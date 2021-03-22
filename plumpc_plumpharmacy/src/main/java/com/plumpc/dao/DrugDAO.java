package com.plumpc.dao;

import java.util.List;

import com.plumpc.entity.Drug;

public interface DrugDAO {
	List<Drug> findAll();
	Drug findById(String id);
	Drug create(Drug drug);
	Drug delete(String id);
	boolean update(Drug drug);
	List<Drug> findByKeywords(String keywords);
}
