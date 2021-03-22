package com.plumpc.dao;

import java.util.List;

import com.plumpc.entity.DrugClassification;

public interface DrugClassificationDAO {
	List<DrugClassification> findAll();
	DrugClassification findById(String id);
	DrugClassification create(DrugClassification drugClassification);
	DrugClassification delete(String id);
	boolean update(DrugClassification drugClassification);
}
