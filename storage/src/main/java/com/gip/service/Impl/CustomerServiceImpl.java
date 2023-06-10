package com.gip.service.Impl;

import com.gip.mapper.CustomerMapper;
import com.gip.pojo.Customer;
import com.gip.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    CustomerMapper customerMapper;
    @Override
    public List<Customer> findAllCustomer() {
        return customerMapper.findAllCustomer();
    }

    @Override
    public List<Customer> findAllCustomerByIf(Customer customer) {
        return customerMapper.findAllCustomerByIf(customer);
    }

    @Override
    public int addCustomer(Customer customer) {
        return customerMapper.addCustomer(customer);
    }

    @Override
    public int deleteCustomer(int id) {
        return customerMapper.deleteCustomer(id);
    }

    @Override
    public int updateCustomer(Customer customer) {
        return customerMapper.updateCustomer(customer);
    }
    @Override
    public Customer findCustomerById(int id){
        return customerMapper.findCustomerById(id);
    }
    @Override
    public int countCustomer(){
        return customerMapper.countCustomer();
    }
}
