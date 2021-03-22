package com.plumpc.dao;

import java.util.List;

import com.plumpc.entity.Decentralization;

public interface DecentralizationDAO {
	List<Decentralization> findAll();
	Decentralization findById(String id);
	Decentralization create(Decentralization decentralization);
	Decentralization delete(String id);
	boolean update(Decentralization decentralization);
	List<Decentralization> findByKeywords(String keywords); 
}
