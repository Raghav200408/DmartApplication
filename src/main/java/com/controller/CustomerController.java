package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.model.CustomerDTO;
import com.service.CustomerService;

@RestController
@RequestMapping("/api/customers")
public class CustomerController {

    @Autowired
    private CustomerService service;

    // =============================
    // REGISTER CUSTOMER
    // =============================

    @PostMapping
    public String addCustomer(@RequestBody CustomerDTO customer) {

        int result = service.addCustomer(customer);

        if (result > 0) {

            return "Customer Registered Successfully";

        }

        return "Customer Registration Failed";

    }

    // =============================
    // GET ALL CUSTOMERS
    // =============================

    @GetMapping
    public List<CustomerDTO> getAllCustomers() {

        return service.getAllCustomers();

    }

    // =============================
    // GET CUSTOMER BY ID
    // =============================

    @GetMapping("/{id}")
    public CustomerDTO getCustomerById(
            @PathVariable("id") int id) {

        return service.getCustomerById(id);

    }

    // =============================
    // SEARCH CUSTOMER BY MOBILE
    // =============================

    @GetMapping("/search/{mobile}")
    public ResponseEntity<CustomerDTO> searchCustomer(
            @PathVariable("mobile") String mobile) {

        CustomerDTO customer = service.searchByMobile(mobile);

        if (customer == null) {

            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();

        }

        return ResponseEntity.ok(customer);
    }

    // =============================
    // UPDATE CUSTOMER
    // =============================

    @PutMapping("/{id}")
    public String updateCustomer(

            @PathVariable("id") int id,

            @RequestBody CustomerDTO customer){

        customer.setCustomerId(id);

        int result = service.updateCustomer(customer);

        if(result > 0){

            return "Customer Updated Successfully";

        }

        return "Customer Update Failed";
    }

    // =============================
    // DELETE CUSTOMER
    // =============================

    @DeleteMapping("/{id}")
    public String deleteCustomer(
            @PathVariable("id") int id) {

        int result = service.deleteCustomer(id);

        if (result > 0) {

            return "Customer Deleted Successfully";

        }

        return "Customer Delete Failed";

    }

}