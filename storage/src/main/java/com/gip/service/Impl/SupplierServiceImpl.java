package com.gip.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gip.mapper.SupplierMapper;
import com.gip.pojo.Supplier;
import com.gip.service.SupplierService;

@Service
@Transactional
public class SupplierServiceImpl implements SupplierService {
	@Autowired
	SupplierMapper supplierMapper;

	@Override
	public List<Supplier> findAllSuppliers() {
		return supplierMapper.findAllSuppliers();
	}

	@Override
	public List<Supplier> findAllSuppliersByIf(Supplier supplier) {
		return supplierMapper.findAllSuppliersByIf(supplier);
	}

	@Override
	public int addSupplier(Supplier supplier) {
		return supplierMapper.addSupplier(supplier);
	}

	@Override
	public int deleteSupplier(int id) {
		return supplierMapper.deleteSupplier(id);
	}

	@Override
	public int updateSupplier(Supplier supplier) {
		return supplierMapper.updateSupplier(supplier);
	}

	@Override
	public Supplier findSupplierById(int id) {
		return supplierMapper.findSupplierById(id);
	}

}
