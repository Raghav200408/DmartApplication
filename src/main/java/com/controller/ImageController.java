package com.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/images")
public class ImageController {

    private final String uploadDir = "C:/DmartUploads/";

    @GetMapping("/{fileName:.+}")
    public ResponseEntity<Resource> getImage(
            @PathVariable("fileName") String fileName) throws IOException {

        Path path = Paths.get(uploadDir + fileName);

        if (!Files.exists(path)) {
            return ResponseEntity.notFound().build();
        }

        ByteArrayResource resource =
                new ByteArrayResource(Files.readAllBytes(path));

        String type = Files.probeContentType(path);

        if (type == null) {
            type = "application/octet-stream";
        }

        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(type))
                .body(resource);
    }
}