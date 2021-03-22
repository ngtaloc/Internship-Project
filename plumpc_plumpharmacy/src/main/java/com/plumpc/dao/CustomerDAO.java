package com.plumpc.dao;

import java.util.List;

import com.plumpc.entity.Customer;

public interface CustomerDAO {

	List<Customer> findAll();
	Customer findById(String id);
	Customer create(Customer customer);
	Customer delete(String id);
	boolean update(Customer customer);
	List<Customer> findByKeywords(String keywords);
}
