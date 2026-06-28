package com.controller;

import java.io.File;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.model.ProductDTO;
import com.service.ProductService;

@RestController
@RequestMapping("/api/products")
public class ProductController {

    @Autowired
    private ProductService service;

    @PostMapping(consumes = "multipart/form-data")
    public String addProduct(

        @RequestParam("productName") String productName,

        @RequestParam("category") String category,

        @RequestParam("price") double price,

        @RequestParam("quantity") int quantity,

        @RequestParam("manufacturerName") String manufacturerName,

        @RequestParam("manufactureDate") String manufactureDate,

        @RequestParam("expiryDate") String expiryDate,

        @RequestParam("createdBy") int createdBy,

        @RequestParam("image") MultipartFile image
    ) {

        try {

            String uploadDir =
                    "C:/DmartUploads/";

            File dir = new File(uploadDir);

            if (!dir.exists()) {
                dir.mkdirs();
            }

            String fileName =
                    UUID.randomUUID()
                    + "_"
                    + image.getOriginalFilename();

            Path path =
                    Paths.get(uploadDir + fileName);

            Files.write(path, image.getBytes());

            ProductDTO p =
                    new ProductDTO();

            p.setProductName(productName);
            p.setCategory(category);
            p.setPrice(price);
            p.setQuantity(quantity);
            p.setManufacturerName(manufacturerName);

            p.setManufactureDate(
                    LocalDate.parse(manufactureDate));

            p.setExpiryDate(
                    LocalDate.parse(expiryDate));

            p.setImagePath(fileName);

            p.setCreatedBy(createdBy);
            p.setUpdatedBy(createdBy);

            service.addProduct(p);

            return "Product Added Successfully";

        } catch (Exception e) {

            e.printStackTrace();

            return "Failed";
        }
    }

    @GetMapping
    public List<ProductDTO> getAllProducts() {

        return service.getAllProducts();
    }

    @GetMapping("/{id}")
    public ProductDTO getProductById(
            @PathVariable("id") int id) {

        return service.getProductById(id);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteProduct(
            @PathVariable("id") int id) {

        try {

            int result = service.deleteProduct(id);

            if (result > 0) {
                return ResponseEntity.ok("Product Deleted Successfully");
            }

            return ResponseEntity
                    .status(HttpStatus.NOT_FOUND)
                    .body("Product Not Found");

        }
        catch (DataIntegrityViolationException e) {

            return ResponseEntity
                    .status(HttpStatus.CONFLICT)
                    .body("Cannot delete product because it is already used in billing.");

        }
    }

    @GetMapping("/search/{id}")
    public ProductDTO searchProductById(
            @PathVariable("id") int id) {

        return service.searchProductById(id);
    }
    @PutMapping(value="/{id}", consumes="multipart/form-data")
    public String updateProduct(

            @PathVariable("id") int id,

            @RequestParam("productName") String productName,

            @RequestParam("category") String category,

            @RequestParam("price") double price,

            @RequestParam("quantity") int quantity,

            @RequestParam("manufacturerName") String manufacturerName,

            @RequestParam("manufactureDate") String manufactureDate,

            @RequestParam("expiryDate") String expiryDate,

            @RequestParam("createdBy") int createdBy,

            @RequestParam(value="image",required=false)
            MultipartFile image){

        try{

            ProductDTO oldProduct =
                    service.getProductById(id);

            String fileName =
                    oldProduct.getImagePath();

            if(image!=null && !image.isEmpty()){

                String uploadDir="C:/DmartUploads/";

                File dir=new File(uploadDir);

                if(!dir.exists()){

                    dir.mkdirs();

                }

                fileName=

                        UUID.randomUUID()

                        +"_"

                        +image.getOriginalFilename();

                Path path=

                        Paths.get(uploadDir+fileName);

                Files.write(path,image.getBytes());

            }

            ProductDTO p=new ProductDTO();

            p.setProductId(id);

            p.setProductName(productName);

            p.setCategory(category);

            p.setPrice(price);

            p.setQuantity(quantity);

            p.setManufacturerName(manufacturerName);

            p.setManufactureDate(

                    LocalDate.parse(manufactureDate));

            p.setExpiryDate(

                    LocalDate.parse(expiryDate));

            p.setImagePath(fileName);

            p.setUpdatedBy(createdBy);

            service.updateProduct(p);

            return "Product Updated Successfully";

        }

        catch(Exception e){

            e.printStackTrace();

            return "Update Failed";

        }

    }
}