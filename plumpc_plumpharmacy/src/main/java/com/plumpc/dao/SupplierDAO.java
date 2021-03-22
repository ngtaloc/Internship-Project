package com.plumpc.dao;

import java.util.List;

import com.plumpc.entity.Supplier;

public interface SupplierDAO {
	List<Supplier> findAll();
	Supplier findById(String id);
	Supplier create(Supplier supplier);
	Supplier delete(String id);
	boolean update(Supplier supplier);
	List<Supplier> findByKeywords(String keywords);
}
