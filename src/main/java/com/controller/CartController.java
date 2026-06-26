package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.model.CartDTO;
import com.service.CartService;

@RestController
@RequestMapping("/api/cart")
public class CartController {

    @Autowired
    private CartService service;

    // =============================
    // ADD PRODUCT TO CART
    // =============================

    @PostMapping
    public String addToCart(@RequestBody CartDTO cart) {

        int result = service.addToCart(cart);

        if (result > 0) {

            return "Product Added To Cart";

        }

        return "Failed To Add Product";

    }

    // =============================
    // GET CUSTOMER CART
    // =============================

    @GetMapping("/{customerId}")
    public List<CartDTO> getCartByCustomer(
            @PathVariable("customerId") int customerId) {

        return service.getCartByCustomer(customerId);

    }

    // =============================
    // UPDATE CART
    // =============================

    @PutMapping("/{cartId}")
    public String updateCart(

            @PathVariable("cartId") int cartId,

            @RequestBody CartDTO cart) {

        cart.setCartId(cartId);

        int result = service.updateCart(cart);

        if (result > 0) {

            return "Cart Updated Successfully";

        }

        return "Cart Update Failed";

    }

    // =============================
    // DELETE CART ITEM
    // =============================

    @DeleteMapping("/{cartId}")
    public String deleteCartItem(
            @PathVariable("cartId") int cartId) {

        int result = service.deleteCartItem(cartId);

        if (result > 0) {

            return "Product Removed From Cart";

        }

        return "Delete Failed";

    }

    // =============================
    // CLEAR CART
    // =============================

    @DeleteMapping("/customer/{customerId}")
    public String clearCart(
            @PathVariable("customerId") int customerId) {

        int result = service.clearCart(customerId);

        if (result > 0) {

            return "Cart Cleared Successfully";

        }

        return "Cart Already Empty";

    }

}