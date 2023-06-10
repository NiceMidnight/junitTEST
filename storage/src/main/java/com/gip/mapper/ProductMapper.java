package com.gip.mapper;

import com.gip.pojo.Product;

import java.util.List;

public interface ProductMapper {
	// 查找系统库内全部商品信息
	List<Product> findAllProduct();
	//带条件查找商品
	List<Product> findAllProductByIf(Product product);
}
