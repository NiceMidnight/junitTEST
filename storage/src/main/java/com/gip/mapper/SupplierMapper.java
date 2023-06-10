package com.gip.mapper;

import com.gip.pojo.Supplier;

import java.util.List;

public interface SupplierMapper {

	// 查找全部供货商
	List<Supplier> findAllSuppliers();

	// 带条件查找
	List<Supplier> findAllSuppliersByIf(Supplier supplier);

	//添加供货商
	int addSupplier(Supplier supplier);

	//根据id删除供货商
	int deleteSupplier(int id);

	//根据id更新供货商信息
	int updateSupplier(Supplier supplier);

	//根据id查找供货商
	Supplier findSupplierById(int id);
}
