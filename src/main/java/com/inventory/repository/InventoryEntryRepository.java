package com.inventory.repository;

import com.inventory.model.InventoryEntry;
import com.inventory.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface InventoryEntryRepository extends JpaRepository<InventoryEntry, Long> {
    List<InventoryEntry> findByProductOrderByExpirationDateAsc(Product product);
}
