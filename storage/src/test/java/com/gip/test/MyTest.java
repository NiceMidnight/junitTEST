package com.gip.test;

import com.gip.mapper.CustomerMapper;
import com.gip.pojo.*;
import com.gip.service.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class MyTest {
    @Autowired
    EmployeeService employeeService;
    @Autowired
    SupplierService supplierService;
    @Autowired
    ProductService productService;
    @Autowired
    CustomerService customerService;
    @Autowired
    CustomerMapper customerMapper;
    @Autowired
    InorderService inorderService;
    @Autowired
    OutOrderService outOrderService;

    @Test
    public void test1(){
        Employee employeeById = employeeService.findEmployeeById(1);
        System.out.println(employeeById);
    }
    @Test
    public void test2(){
        Supplier supplierById = supplierService.findSupplierById(1);
        System.out.println(supplierById);
    }
    @Test
    public void test3(){
        Supplier supplier = new Supplier();
        supplier.setSupplierId(16);
        supplier.setSupplierPhone("110");
        int i = supplierService.updateSupplier(supplier);
        System.out.println(i);
    }
    @Test
    public void test4(){
        List<Product> allProduct = productService.findAllProduct();
        System.out.println(allProduct);
    }
    @Test
    public void test5(){
//        List<Customer> allCustomer = customerService.findAllCustomer();
//        System.out.println(allCustomer);
        List<Customer> allCustomer = customerMapper.findAllCustomer();
        System.out.println(allCustomer);
    }
    @Test
    public void test6(){
        List<InOrder> allInOrder = inorderService.findAllInOrder();
        System.out.println(allInOrder);
    }
    @Test
    public void test7(){
        OutOrder outOrder = new OutOrder();
        outOrder.setOrderStorageId(2);
        List<OutOrder> allOutOrderByIf = outOrderService.findAllOutOrderByIf(outOrder);
        System.out.println(allOutOrderByIf);
    }
    @Test
    public void test8(){
        int i = employeeService.countEmployee();
        System.out.println(i);
    }
}
