package com.gip.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.gip.pojo.*;
import com.gip.service.*;
import com.gip.utils.R;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
public class DataController {
    @Autowired
    SupplierService supplierService;
    @Autowired
    ProductService productService;
    @Autowired
    CustomerService customerService;
    @Autowired
    InorderService inorderService;
    @Autowired
    InventoryService inventoryService;
    @Autowired
    OutOrderService outOrderService;
    @Autowired
    DictService dictService;

    @RequestMapping("/findAllSupplier")
    public String findAllSupplier(int page, int limit, @RequestParam(required = false, value = "searchParams") String data) {
        R r = new R();
        if (data != null) {
            List<Supplier> allSuppliers = supplierService.findAllSuppliers();
            r.setCount(allSuppliers.size());
            JSONObject jsonObject = JSONObject.parseObject(data);
            Supplier supplier = jsonObject.toJavaObject(Supplier.class);
            PageHelper.startPage(page, limit);
            List<Supplier> allSuppliersByIf = supplierService.findAllSuppliersByIf(supplier);
            r.setCode(0);
            r.setStatus("success");
            r.setData(allSuppliersByIf);

        } else {
            List<Supplier> allSuppliersCount = supplierService.findAllSuppliers();
            r.setCount(allSuppliersCount.size());
            PageHelper.startPage(page, limit);
            List<Supplier> allSuppliers = supplierService.findAllSuppliers();
            r.setCode(0);
            r.setStatus("success");
            r.setData(allSuppliers);
        }
        return JSONObject.toJSONString(r);
    }

    @RequestMapping("/addSupplier")
    public String addSupplier(Supplier supplier) {
        System.out.println(supplier);
        int i = supplierService.addSupplier(supplier);
        System.out.println(i);
        R r = new R();
        if (i >= 1) {
            r.setCode(0);
            r.setStatus("success");
            r.setMsg("添加成功");
        } else {
            r.setCode(0);
            r.setStatus("error");
            r.setMsg("添加失败");
        }
        return JSONObject.toJSONString(r);
    }
    @RequestMapping("/addCustomer")
    public String addCustomer(Customer customer) {
        System.out.println(customer);
        int i = customerService.addCustomer(customer);
        System.out.println(i);
        R r = new R();
        if (i >= 1) {
            r.setCode(0);
            r.setStatus("success");
            r.setMsg("添加成功");
        } else {
            r.setCode(0);
            r.setStatus("error");
            r.setMsg("添加失败");
        }
        return JSONObject.toJSONString(r);
    }
    @RequestMapping("/deleteSupplier")
    public String deleteSupplier(int id) {
        int i = supplierService.deleteSupplier(id);
        R r = new R();
        if (i >= 1) {
            r.setCode(0);
            r.setStatus("success");
            r.setMsg("删除成功");
        } else {
            r.setCode(0);
            r.setStatus("error");
            r.setMsg("删除失败");
        }
        return JSONObject.toJSONString(r);
    }
    @RequestMapping("/deleteCustomer")
    public String deleteCustomer(int id) {
        int i = customerService.deleteCustomer(id);
        R r = new R();
        if (i >= 1) {
            r.setCode(0);
            r.setStatus("success");
            r.setMsg("删除客户成功");
        } else {
            r.setCode(0);
            r.setStatus("error");
            r.setMsg("删除客户失败");
        }
        return JSONObject.toJSONString(r);
    }
    @PostMapping("/updateSupplier")
    public String updateSupplier(Supplier supplier) {
        System.out.println(supplier);

        int i = supplierService.updateSupplier(supplier);
        R r = new R();
        if (i >= 1) {
            r.setCode(0);
            r.setStatus("success");

        } else {
            r.setCode(0);
            r.setStatus("error");
        }
        return JSONObject.toJSONString(r);
    }
    @PostMapping("/updateCustomer")
    public String updateCustomer(Customer customer) {
       // System.out.println(customer);

        int i = customerService.updateCustomer(customer);
        R r = new R();
        if (i >= 1) {
            r.setCode(0);
            r.setStatus("success");
            r.setMsg("更新客户成功");
        } else {
            r.setCode(0);
            r.setStatus("error");
            r.setMsg("更新客户失败");
        }
        return JSONObject.toJSONString(r);
    }

    @RequestMapping("/test")
    public String test(Supplier supplier) {
        System.out.println(supplier);
        R r = new R();
        r.setCode(0);
        r.setStatus("success");
        return JSONObject.toJSONString(r);
    }

    @RequestMapping("/findAllProduct")
    public String findAllProduct(int page, int limit, @RequestParam(required = false, value = "searchParams") String data) {
        R r = new R();

        if (data != null) {
            JSONObject jsonObject = JSONObject.parseObject(data);
            Product product = jsonObject.toJavaObject(Product.class);
            List<Product> allProduct = productService.findAllProductByIf(product);
            r.setCount(allProduct.size());
            PageHelper.startPage(page, limit);
            List<Product> allProductByIf = productService.findAllProductByIf(product);
            r.setCode(0);
            r.setStatus("success");
            r.setData(allProductByIf);
        } else {
            List<Product> allProduct = productService.findAllProduct();
            r.setCount(allProduct.size());
            PageHelper.startPage(page, limit);
            List<Product> allProduct1 = productService.findAllProduct();
            r.setCode(0);
            r.setStatus("success");
            r.setData(allProduct1);
        }
        return JSONObject.toJSONString(r);
    }
    //查找所有产品类别
    @RequestMapping("/findAllProductCategory")
    public String setProductTable(int page, int limit, @RequestParam(required = false, value = "searchParams") String data) {
        R r = new R();
//        if (data != null) {
//            JSONObject jsonObject = JSONObject.parseObject(data);
//            Dict dict = jsonObject.toJavaObject(Dict.class);
//            List<Dict> allDictByIf = dictService.findAllProductDictByIf(dict);
//            r.setCode(0);
//            r.setStatus("success");
//            r.setData((allDictByIf));
//        } else {
            List<Dict> allDict = dictService.findAllProductDict();
            r.setCount(allDict.size());
            PageHelper.startPage(page, limit);
            List<Dict> allDict1 = dictService.findAllProductDict();
            r.setCode(0);
            r.setStatus("success");
            r.setData(allDict1);
        return JSONObject.toJSONString(r);
    }

    //查找所有职员类别
    @RequestMapping("/findAllEmployeeCategory")
    public String setEmployeeTable(int page, int limit, @RequestParam(required = false, value = "searchParams") String data) {
        R r = new R();
        List<Dict> allDict = dictService.findAllEmployeeDict();
        r.setCount(allDict.size());
        PageHelper.startPage(page, limit);
        List<Dict> allDict1 = dictService.findAllEmployeeDict();
        r.setCode(0);
        r.setStatus("success");
        r.setData(allDict1);
        return JSONObject.toJSONString(r);
    }
    @RequestMapping("/findAllCustomer")
    public String findAllCustomer(int page, int limit, @RequestParam(required = false, value = "searchParams") String data) {
        R r = new R();
        if (data != null) {
            JSONObject jsonObject = JSONObject.parseObject(data);
            Customer customer = jsonObject.toJavaObject(Customer.class);
            List<Customer> allCustomerByIf1 = customerService.findAllCustomerByIf(customer);
            r.setCount(allCustomerByIf1.size());
            PageHelper.startPage(page, limit);
            List<Customer> allCustomerByIf = customerService.findAllCustomerByIf(customer);
            r.setCode(0);
            r.setStatus("success");
            r.setData(allCustomerByIf);
        } else {
            List<Customer> allCustomer = customerService.findAllCustomer();
            r.setCount(allCustomer.size());
            PageHelper.startPage(page, limit);
            List<Customer> allCustomer1 = customerService.findAllCustomer();
            r.setCode(0);
            r.setStatus("success");
            r.setData(allCustomer1);
        }
        return JSONObject.toJSONString(r);

    }

    @RequestMapping("/findAllInOrder")
    public String findAllInOrder(int page, int limit, @RequestParam(required = false, value = "searchParams") String data) {
        R r = new R();

        if (data != null) {

            JSONObject jsonObject = JSONObject.parseObject(data);
            InOrder inOrder = jsonObject.toJavaObject(InOrder.class);
            List<InOrder> allInOrderByIf1 = inorderService.findAllInOrderByIf(inOrder);
            r.setCount(allInOrderByIf1.size());
            PageHelper.startPage(page, limit);
            List<InOrder> allInOrderByIf = inorderService.findAllInOrderByIf(inOrder);
            r.setCode(0);
            r.setStatus("success");
            r.setData(allInOrderByIf);

        } else {
            List<InOrder> allInOrder = inorderService.findAllInOrder();
            r.setCount(allInOrder.size());
            PageHelper.startPage(page, limit);
            List<InOrder> allInOrder1 = inorderService.findAllInOrder();
            r.setCode(0);
            r.setStatus("success");
            r.setData(allInOrder1);
        }

        return JSONObject.toJSONString(r);

    }

    @RequestMapping("/addInOrder")
    public String addInOrder(InOrder inOrder) {
        System.out.println(inOrder);

        //取出入库订单中的商品id和商品数量,仓库id
        Integer orderProductId = inOrder.getOrderProductId();
        Integer orderProductNum = inOrder.getOrderProductNum();
        Integer orderStorageId = inOrder.getOrderStorageId();

        Inventory inventory = new Inventory();
        inventory.setStorageId(orderStorageId);
        inventory.setProductId(orderProductId);

        //取出上述条件的库存量
        Inventory inventoryByIf = inventoryService.findInventoryByIf(inventory);

        Integer productNum = inventoryByIf.getProductNum();

        Integer sum=productNum+orderProductNum;
        inventory.setProductNum(sum);
        //执行
        int j = inventoryService.updateInventory(inventory);
        int i = inorderService.addInOrder(inOrder);

        R r = new R();
        if (i >= 1&&j>=1) {
            r.setCode(0);
            r.setStatus("success");
            r.setMsg("添加成功");
        } else {
            r.setCode(0);
            r.setStatus("error");
            r.setMsg("添加失败");
        }
        return JSONObject.toJSONString(r);
    }

    @RequestMapping("/findAllOutOrder")
    public String findAllOutOrder(int page, int limit, @RequestParam(required = false, value = "searchParams") String data) {
        R r = new R();

        if (data != null) {

            JSONObject jsonObject = JSONObject.parseObject(data);
            OutOrder outOrder = jsonObject.toJavaObject(OutOrder.class);
            List<OutOrder> allOutOrderByIf = outOrderService.findAllOutOrderByIf(outOrder);
            r.setCount(allOutOrderByIf.size());
            PageHelper.startPage(page, limit);
            List<OutOrder> allOutOrderByIf1 = outOrderService.findAllOutOrderByIf(outOrder);
            r.setCode(0);
            r.setStatus("success");
            r.setData(allOutOrderByIf1);

        } else {
            List<OutOrder> allOutOrder1 = outOrderService.findAllOutOrder();
            r.setCount(allOutOrder1.size());
            PageHelper.startPage(page, limit);
            List<OutOrder> allOutOrder = outOrderService.findAllOutOrder();
            r.setCode(0);
            r.setStatus("success");
            r.setData(allOutOrder);
        }

        return JSONObject.toJSONString(r);

    }

    @RequestMapping("/addOutOrder")
    public String addOutOrder(OutOrder outOrder) {
        R r = new R();
        int i=0;
        int j=0;
        System.out.println(outOrder);

        //取出出库订单中的商品id和商品数量,仓库id
        Integer orderProductId = outOrder.getOrderProductId();
        Integer orderProductNum = outOrder.getOrderProductNum();
        Integer orderStorageId = outOrder.getOrderStorageId();

        Inventory inventory = new Inventory();
        inventory.setStorageId(orderStorageId);
        inventory.setProductId(orderProductId);

        //取出上述条件的库存量
        Inventory inventoryByIf = inventoryService.findInventoryByIf(inventory);

        Integer productNum = inventoryByIf.getProductNum();

        if(productNum>=orderProductNum){
            Integer sum=productNum-orderProductNum;
            inventory.setProductNum(sum);
             j = inventoryService.updateInventory(inventory);
             i = outOrderService.addOutOrder(outOrder);
        }

        if (i >= 1&&j>=1) {
            r.setCode(0);
            r.setStatus("success");
            r.setMsg("添加成功");
        } else {
            r.setCode(0);
            r.setStatus("error");
            r.setMsg("对不起，商品库存不足!");
        }
        return JSONObject.toJSONString(r);
    }
    @RequestMapping("/findAllInventory")
    public String findAllInventory(int page, int limit, @RequestParam(required = false, value = "searchParams") String data) {
        R r = new R();

        if (data != null) {

            JSONObject jsonObject = JSONObject.parseObject(data);
            Inventory inventory = jsonObject.toJavaObject(Inventory.class);
            System.out.println(inventory);
            List<Inventory> allInventoryByIf = inventoryService.findAllInventoryByIf(inventory);
            r.setCount(allInventoryByIf.size());
            PageHelper.startPage(page, limit);
            List<Inventory> allInventoryByIf1 = inventoryService.findAllInventoryByIf(inventory);
            r.setCode(0);
            r.setStatus("success");
            r.setData(allInventoryByIf1);

        } else {
            List<Inventory> allInventory = inventoryService.findAllInventory();
            r.setCount(allInventory.size());
            PageHelper.startPage(page, limit);
            List<Inventory> allInventory1 = inventoryService.findAllInventory();
            r.setCode(0);
            r.setStatus("success");
            r.setData(allInventory1);
        }

        return JSONObject.toJSONString(r);

    }

    @RequestMapping("/findInorderReport")
    public String findInorderReport(int page, int limit, @RequestParam(required = false, value = "searchParams") String data){
        R r = new R();

        if (data != null) {

            JSONObject jsonObject = JSONObject.parseObject(data);

            InOrder inOrder = jsonObject.toJavaObject(InOrder.class);
            List<InOrder> allInOrderByIf1 = inorderService.findInorderReport(inOrder);
            r.setCount(allInOrderByIf1.size());
            PageHelper.startPage(page, limit);
            List<InOrder> allInOrderByIf = inorderService.findInorderReport(inOrder);
            r.setCode(0);
            r.setStatus("success");
            r.setData(allInOrderByIf);

        } else {
            List<InOrder> allInOrder = inorderService.findAllInOrder();
            r.setCount(allInOrder.size());
            PageHelper.startPage(page, limit);
            List<InOrder> allInOrder1 = inorderService.findAllInOrder();
            r.setCode(0);
            r.setStatus("success");
            r.setData(allInOrder1);
        }

        return JSONObject.toJSONString(r);
    }

    @RequestMapping("/findInorderData")
    public String findInorderData(@RequestParam(required = false, value = "data") String data){
        R r = new R();

        if (data != null) {

            JSONObject jsonObject = JSONObject.parseObject(data);

            InOrder inOrder = jsonObject.toJavaObject(InOrder.class);
            List<InOrder> allInOrderByIf1 = inorderService.findInorderReport(inOrder);

            HashMap<String, Integer> map = new HashMap<>();
            for (InOrder order : allInOrderByIf1) {
                if(map.containsKey(order.getProductName())){
                    Integer num = map.get(order.getProductName());
                    Integer sum=num+order.getOrderProductNum();
                    map.put(order.getProductName(),sum);
                }else{
                    map.put(order.getProductName(),order.getOrderProductNum());
                }

            }

            r.setCount(allInOrderByIf1.size());
            r.setCode(0);
            r.setStatus("success");
            r.setMsg("success");
            r.setData(map);

        } else {
            List<InOrder> allInOrder = inorderService.findAllInOrder();

            HashMap<String, Integer> map = new HashMap<>();
            for (InOrder order : allInOrder) {
                if(map.containsKey(order.getProductName())){
                    Integer num = map.get(order.getProductName());
                    Integer sum=num+order.getOrderProductNum();
                    map.put(order.getProductName(),sum);
                }else{
                    map.put(order.getProductName(),order.getOrderProductNum());
                }

            }
            r.setCount(allInOrder.size());
            r.setCode(0);
            r.setStatus("success");
            r.setMsg("success");
            r.setData(map);
        }

        return JSONObject.toJSONString(r);
    }
}
