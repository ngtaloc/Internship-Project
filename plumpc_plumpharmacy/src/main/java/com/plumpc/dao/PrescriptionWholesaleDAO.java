package com.plumpc.dao;

import java.util.List;

import com.plumpc.entity.PrescriptionWholesale;

public interface PrescriptionWholesaleDAO {
	List<PrescriptionWholesale> findAll();
	PrescriptionWholesale findById(String id);
	PrescriptionWholesale create(PrescriptionWholesale prescriptionWholesale);
	PrescriptionWholesale delete(String id);
	boolean update(PrescriptionWholesale prescriptionWholesale);
}
