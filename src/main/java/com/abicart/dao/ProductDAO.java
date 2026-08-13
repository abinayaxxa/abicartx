package com.abicart.dao;

import java.util.List;

import com.abicart.model.Product;

public interface ProductDAO{

    boolean addProduct(Product product);

    List<Product> getAllProducts();

    List<Product> getProductsBySeller(int sellerId);

    Product getProductById(int id);

    boolean updateProduct(Product product);

    boolean deleteProduct(int id);

    List<Product> searchProducts(String keyword);
}