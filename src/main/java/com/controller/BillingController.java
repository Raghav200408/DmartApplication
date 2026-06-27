package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;

import com.model.BillingDTO;
import com.model.BillingSummaryDTO;
import com.model.InvoiceDTO;
import com.service.BillingService;

@RestController
@RequestMapping("/api/billing")
public class BillingController {

    @Autowired
    private BillingService billingService;

    @GetMapping("/{customerId}")
    public BillingDTO getBillDetails(@PathVariable("customerId") int customerId) {

        return billingService.getBillDetails(customerId);

    }

    @PostMapping("/generate")
    public int generateBill(
            @RequestParam("customerId") int customerId,
            @RequestParam("paymentType") String paymentType) {

        return billingService.generateBill(customerId, paymentType);

    }
    
    @GetMapping("/invoice/{billId}")
    public InvoiceDTO getInvoice(
            @PathVariable("billId") int billId) {

        return billingService.getInvoice(billId);

    }
    
    @GetMapping("/all")
    public List<BillingSummaryDTO> getAllBills(){

        return billingService.getAllBills();

    }

}