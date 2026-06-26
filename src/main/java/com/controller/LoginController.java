package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.model.LoginDTO;
import com.service.LoginService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api")
public class LoginController {

    @Autowired
    private LoginService service;

    @PostMapping("/login")
    public String login(@RequestBody LoginDTO dto, HttpSession session) {

        if (service.validateUser(dto)) {

            session.setAttribute("username", dto.getUsername());

            return "SUCCESS";
        }

        return "FAIL";
    }
}