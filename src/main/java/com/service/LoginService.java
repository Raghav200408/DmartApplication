package com.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repository.LoginDAO;
import com.model.LoginDTO;

@Service
public class LoginService {

    @Autowired
    private LoginDAO dao;

    public boolean validateUser(LoginDTO dto) {

        return dao.validateUser(
                dto.getUsername(),
                dto.getPassword());
    }
}
