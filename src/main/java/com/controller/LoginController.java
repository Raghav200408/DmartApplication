package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.model.LoginDTO;
import com.service.LoginService;

import jakarta.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
@RestController
@RequestMapping("/api")
public class LoginController {
	   private static final Logger logger =
	            LogManager.getLogger(ProductController.class);

    @Autowired
    private LoginService service;

    @PostMapping("/login")
    public String login(@RequestBody LoginDTO dto, HttpSession session) {

        if (service.validateUser(dto)) {

            session.setAttribute("username", dto.getUsername());
            logger.info("User '{}' logged in successfully.",
                    dto.getUsername());
            return "SUCCESS";
        }
        logger.warn("Invalid login attempt for username '{}'",
                dto.getUsername());

        return "FAIL";
    }
}