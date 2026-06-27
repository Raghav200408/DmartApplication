package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.DashboardDTO;
import com.repository.DashboardDAO;

@Service
public class DashboardService {

    @Autowired
    private DashboardDAO dashboardDAO;

    public DashboardDTO getDashboardSummary() {

        return dashboardDAO.getDashboardSummary();
        
        

    }
}