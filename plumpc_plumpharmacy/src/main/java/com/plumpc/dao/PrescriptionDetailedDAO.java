package com.plumpc.dao;
import java.util.List;

import com.plumpc.entity.PrescriptionDetailed;


public interface PrescriptionDetailedDAO {
	List<PrescriptionDetailed> findAll();
	PrescriptionDetailed findById(String id);
	PrescriptionDetailed create(PrescriptionDetailed prescriptiondetailed);
	PrescriptionDetailed delete(String id);
	boolean update(PrescriptionDetailed prescriptiondetailed);
	
}
