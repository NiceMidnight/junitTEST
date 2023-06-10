package com.gip.service;

import com.gip.pojo.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAllCustomer();
    List<Customer> findAllCustomerByIf(Customer customer);
    int addCustomer(Customer customer);
    int deleteCustomer(int id);
    int updateCustomer(Customer customer);
    Customer findCustomerById(int id);
    int countCustomer();
}
