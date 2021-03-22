package com.plumpc.dao;
import java.util.List;

import com.plumpc.entity.PrescriptionHospital;


public interface PrescriptionHospitalDAO {
	List<PrescriptionHospital> findAll();
	PrescriptionHospital findById(String id);
	PrescriptionHospital create(PrescriptionHospital prescriptionhospital);
	PrescriptionHospital delete(String id);
	boolean update(PrescriptionHospital prescriptionhospital);
}
