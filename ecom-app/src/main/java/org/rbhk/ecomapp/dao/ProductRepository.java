package org.rbhk.ecomapp.dao;

import org.rbhk.ecomapp.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {


}
