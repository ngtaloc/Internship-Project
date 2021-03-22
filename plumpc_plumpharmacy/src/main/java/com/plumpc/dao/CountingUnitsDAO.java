package com.plumpc.dao;

import java.util.List;

import com.plumpc.entity.CountingUnits;

public interface CountingUnitsDAO {

	List<CountingUnits> findAll();
	CountingUnits findById(String id);
	CountingUnits create(CountingUnits countingUnits);
	CountingUnits delete(String id);
	boolean update(CountingUnits countingUnits);
}
