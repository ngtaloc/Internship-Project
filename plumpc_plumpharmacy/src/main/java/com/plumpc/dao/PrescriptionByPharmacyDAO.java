package com.plumpc.dao;

import java.util.List;

import com.plumpc.entity.PrescriptionByPharmacy;

public interface PrescriptionByPharmacyDAO {
	
	List<PrescriptionByPharmacy> findAll();
	PrescriptionByPharmacy findById(String id);
	PrescriptionByPharmacy create(PrescriptionByPharmacy prescriptionbypharmacy);
	PrescriptionByPharmacy delete(String id);
	boolean update(PrescriptionByPharmacy prescriptionbypharmacy);
	
	List<PrescriptionByPharmacy> findByKeywords(String keywords);
}
