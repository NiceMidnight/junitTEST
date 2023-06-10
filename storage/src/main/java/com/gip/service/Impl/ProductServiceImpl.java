package com.gip.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gip.mapper.ProductMapper;
import com.gip.pojo.Product;
import com.gip.service.ProductService;


@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductMapper productMapper;

	@Override
	public List<Product> findAllProduct() {
		return productMapper.findAllProduct();
	}

	@Override
	public List<Product> findAllProductByIf(Product product) {
		return productMapper.findAllProductByIf(product);
	}

}
