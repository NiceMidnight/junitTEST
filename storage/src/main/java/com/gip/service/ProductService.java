package com.gip.service;

import java.util.List;

import com.gip.pojo.Product;

public interface ProductService {
	// 查找系统库内全部商品信息
	List<Product> findAllProduct();
	//带条件查找商品
	List<Product> findAllProductByIf(Product product);
}
