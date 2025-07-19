// InventoryController.java (actualizado con lógica FIFO en salidas)
package com.inventory.controller;

import com.inventory.model.*;
import com.inventory.repository.*;
import com.inventory.repository.ProductRepository;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import java.time.LocalDate;
import java.util.*;

@RestController
@RequestMapping("/api/inventory")
public class InventoryController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private InventoryEntryRepository entryRepository;

    @Autowired
    private InventoryExitRepository exitRepository;

    @PostMapping("/entries")
    public InventoryEntry createEntry(@RequestBody InventoryEntry entry) {
        if (entry.getQuantity() <= 0 || entry.getExpirationDate().isBefore(LocalDate.now())) {
            throw new RuntimeException("Entrada inválida");
        }
        return entryRepository.save(entry);
    }

    @PostMapping("/exits")
    public InventoryExit createExit(@RequestBody InventoryExit exit) {
        if (exit.getQuantity() <= 0) {
            throw new RuntimeException("Cantidad de salida inválida");
        }

        Product product = exit.getProduct();
        List<InventoryEntry> entries = entryRepository.findByProductOrderByExpirationDateAsc(product);

        int remaining = exit.getQuantity();

        for (InventoryEntry entry : entries) {
            if (entry.getQuantity() <= 0) continue;

            int deducted = Math.min(entry.getQuantity(), remaining);
            entry.setQuantity(entry.getQuantity() - deducted);
            remaining -= deducted;
            entryRepository.save(entry);

            if (remaining == 0) break;
        }

        if (remaining > 0) {
            throw new RuntimeException("Stock insuficiente para realizar la salida");
        }

        return exitRepository.save(exit);
    }

    @GetMapping
    public List<Map<String, Object>> listInventory() {
        List<Product> products = productRepository.findAll();
        List<Map<String, Object>> result = new ArrayList<>();
        LocalDate now = LocalDate.now();

        for (Product product : products) {
            List<InventoryEntry> entries = entryRepository.findByProductOrderByExpirationDateAsc(product);
            int totalQuantity = entries.stream().mapToInt(InventoryEntry::getQuantity).sum();
            String status = "Vigente";
            for (InventoryEntry e : entries) {
                if (e.getExpirationDate().isBefore(now)) {
                    status = "Vencido";
                    break;
                } else if (!e.getExpirationDate().isAfter(now.plusDays(3))) {
                    status = "Por vencer";
                }
            }
            Map<String, Object> map = new HashMap<>();
            map.put("product", product);
            map.put("quantity", totalQuantity);
            map.put("status", status);
            result.add(map);
        }
        return result;
    }
}
