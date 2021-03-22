package com.plumpc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="DON_THUOC_NHA_THUOC")
public class PrescriptionByPharmacy {
	@Id
	@GeneratedValue(generator = "uuid2")
	@GenericGenerator(name = "uuid2", strategy = "uuid2")
	@Column(length = 36)
	private String Id;
	
	@Column(name="TenDonThuoc", length=50, nullable= false)
	private String Name;
	
	@Column(name="TrieuChung", length=150, nullable= false)
	private String symptom;// triệu chứng
	
	@Column(name="IdDoiTuong", length=36, nullable= false)
	private String patientId; // id dối tượng
	
	@Column(name="SoNgayUong",nullable= false)
	private Integer NumberOfDay; // số ngày dùng thuốc

	public String getId() {
		return Id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getSymptom() {
		return symptom;
	}

	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}

	public String getPatientId() {
		return patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}

	public Integer getNumberOfDay() {
		return NumberOfDay;
	}

	public void setNumberOfDay(Integer numberOfDay) {
		NumberOfDay = numberOfDay;
	}

	
}
