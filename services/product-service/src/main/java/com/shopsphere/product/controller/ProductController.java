package com.shopsphere.product.controller;

import com.shopsphere.product.dto.ProductRequest;
import com.shopsphere.product.dto.ProductResponse;
import com.shopsphere.product.service.ProductService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/products")
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;

    @PostMapping
    public ProductResponse addProduct(
            @RequestBody @Valid ProductRequest request) {

        return productService.addProduct(request);

    }

    @GetMapping
    public List<ProductResponse> getAllProducts() {

        return productService.getAllProducts();

    }

    @GetMapping("/{id}")
    public ProductResponse getProductById(
            @PathVariable Long id) {

        return productService.getProductById(id);

    }

    @PutMapping("/{id}")
    public ProductResponse updateProduct(
            @PathVariable Long id,
            @RequestBody @Valid ProductRequest request) {

        return productService.updateProduct(id, request);

    }

    @DeleteMapping("/{id}")
    public void deleteProduct(
            @PathVariable Long id) {

        productService.deleteProduct(id);

    }

}
