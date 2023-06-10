package com.gip.controller;

import com.gip.mapper.StorageMapper;
import com.gip.pojo.*;
import com.gip.service.*;
import com.gip.service.Impl.OutOrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class MenuController {
    @Autowired
    EmployeeService employeeService;
    @Autowired
    SupplierService supplierService;
    @Autowired
    StorageMapper storageMapper;
    @Autowired
    ProductService productService;
    @Autowired
    CustomerService customerService;
    @Autowired
    InorderService inorderService;
    @Autowired
    DictService dictService;
    @Autowired
    OutOrderService outOrderService;
    @RequestMapping("/supplierTable")
    public String supplierTable() {
        return "supplierTable";
    }

    @RequestMapping("/supplierAdd")
    public String supplierAdd() {
        return "supplierAdd";
    }
    @RequestMapping("/customerAdd")
    public String customerAdd(){
        return "customerAdd";
    }
    @RequestMapping("/supplierEdit")
    public String supplierEdit(int id, Model model) {
        Supplier supplierById = supplierService.findSupplierById(id);
        model.addAttribute("supplier", supplierById);
        return "supplierEdit";
    }
    @RequestMapping("/customerEdit")
    public String customerEdit(int id, Model model) {
        Customer customerById = customerService.findCustomerById(id);
        model.addAttribute("customer",customerById);
        return "customerEdit";
    }


    @RequestMapping("/productTable")
    public String productTable() {
        return "productTable";
    }



    @RequestMapping("/customerTable")
    public String customerTable() {
        return "customerTable";
    }
    //系统管理员管理产品类别
    @RequestMapping("/setProductTable")
    public String setProductTable() {
        return "setProductTable";
    }

    //系统管理员管理职工类别
    @RequestMapping("/setEmployeeCategoryTable")
    public String setEmployeeCategoryTable(){
        return "setEmployeeCategoryTable";
    }
    @RequestMapping("/inOrderTable")
    public String inOrderTable() {
        return "inOrderTable";
    }
    @RequestMapping("/inOrderAdd")
    public String inOrderAdd(Model model) {
        List<Supplier> allSuppliers = supplierService.findAllSuppliers();
        model.addAttribute("allSuppliers",allSuppliers);
        List<Storage> allStorage = storageMapper.findAllStorage();
        model.addAttribute("allStorage",allStorage);
        List<Product> allProduct = productService.findAllProduct();
        model.addAttribute("allProduct",allProduct);
        return "inOrderAdd";
    }
    @RequestMapping("/outOrderTable")
    public String outOrderTable(){
        return "outOrderTable";
    }
    @RequestMapping("/outOrderAdd")
    public String outOrderAdd(Model model){
        List<Customer> allCustomer = customerService.findAllCustomer();
        model.addAttribute("allCustomer",allCustomer);
        List<Storage> allStorage = storageMapper.findAllStorage();
        model.addAttribute("allStorage",allStorage);
        List<Product> allProduct = productService.findAllProduct();
        model.addAttribute("allProduct",allProduct);
        return "outOrderAdd";
    }
    @RequestMapping("/welcome")
    public String welcome(Model model){
        int i = employeeService.countEmployee();
        model.addAttribute("employeeCount",i);
        model.addAttribute("inOrderCount",inorderService.findAllInOrder().size());
        model.addAttribute("customerCount",customerService.countCustomer());
        List<Supplier> allSuppliers = supplierService.findAllSuppliers();
        model.addAttribute("supplierCount",allSuppliers.size());
        model.addAttribute("outOrderCount", outOrderService.findAllOutOrder().size());
        model.addAttribute("productCount",productService.findAllProduct().size());
        return "welcome";
    }
    @RequestMapping("/inventoryTable")
    public String inventoryTable(Model model){
        List<Storage> allStorage = storageMapper.findAllStorage();
        model.addAttribute("allStorage",allStorage);
        List<Product> allProduct = productService.findAllProduct();
        model.addAttribute("allProduct",allProduct);
        return "inventoryTable";
    }
    @RequestMapping("/inReport")
    public String inReport(Model model){
        List<Storage> allStorage = storageMapper.findAllStorage();
        model.addAttribute("allStorage",allStorage);
        List<Product> allProduct = productService.findAllProduct();
        model.addAttribute("allProduct",allProduct);
        List<Supplier> allSuppliers = supplierService.findAllSuppliers();
        model.addAttribute("allSuppliers",allSuppliers);
        return "inReport";
    }
    @RequestMapping("/404")
    public String noFound(){
        return "404";
    }
    @RequestMapping("/myAccount")
    public String myAccount(){
        return "myAccount";
    }

    @RequestMapping("/inOrderShow")
    public String inOrderShow(Model model){
        List<Storage> allStorage = storageMapper.findAllStorage();
        model.addAttribute("allStorage",allStorage);
        List<Product> allProduct = productService.findAllProduct();
        model.addAttribute("allProduct",allProduct);
        List<Supplier> allSuppliers = supplierService.findAllSuppliers();
        model.addAttribute("allSuppliers",allSuppliers);
        return "inOrderShow";
    }



}