package com.plumpc.dao;

import java.util.List;

import com.plumpc.entity.Patient;

public interface PatientDAO {
	List<Patient> findAll();
	Patient findById(String id);
	Patient create(Patient patient);
	Patient delete(String id);
	boolean update(Patient patient);
	List<Patient> findByKeywords(String keywords) ;
}
