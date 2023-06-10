package com.gip.controller;

import com.gip.pojo.Employee;
import com.gip.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    EmployeeService employeeService;
    @RequestMapping(value={"/","/index"})
    public String login(){
        return "index";
    }
    @PostMapping("/toLogin")
    public String toLogin(Employee employee, HttpSession session){
        //System.out.println(employee);
        Employee employeeById = employeeService.findEmployeeById(employee.getEmployeeId());
        //System.out.println(employeeById);
        if (employeeById!=null) {
            session.setAttribute("Employee", employeeById);
            if (employeeById.getEmployeeRole() == 1) return "mainAdministrators";
            else if (employeeById.getEmployeeRole() == 2) return "main";
            else if (employeeById.getEmployeeRole() == 3) return "mainControl";
        }
        return "index";
    }
    @RequestMapping("/layout")
    public String layout(HttpSession session){
        session.invalidate();
        return "index";
    }
}
