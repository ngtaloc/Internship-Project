package com.plumpc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

// đơn thuốc theo đơn

@Entity
@Table(name="DON_THUOC_THEO_DON")
public class PrescriptionHospital {
	
	@Id
	@GeneratedValue(generator = "uuid2")
	@GenericGenerator(name = "uuid2", strategy = "uuid2")
	@Column(length = 36)
	private String Id;
	
	public void setId(String id) {
		Id = id;
	}

	@Column(name="IdHoaDon", length=36, nullable= false)
	private String invoiceId; // id hóa đơn
	
	@Column(name="TenBacSi", length=100, nullable= false)
	private String doctorName; // tên bác sĩ
	
	@Column(name="DiaChiBenhVien", length=250, nullable= false)
	private String hospitalAddress; // địa chỉ bệnh viện
	
	@Column(name="ChuanDoan", length=250, nullable= false)
	private String diagnostic; //chuẩn đoán
	
	@Column(name="TrieuChung", length=250, nullable= false)
	private String symptom; // triệu chứng

	public String getId() {
		return Id;
	}

	public String getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(String invoiceId) {
		this.invoiceId = invoiceId;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getHospitalAddress() {
		return hospitalAddress;
	}

	public void setHospitalAddress(String hospitalAddress) {
		this.hospitalAddress = hospitalAddress;
	}

	public String getDiagnostic() {
		return diagnostic;
	}

	public void setDiagnostic(String diagnostic) {
		this.diagnostic = diagnostic;
	}

	public String getSymptom() {
		return symptom;
	}

	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}

	
	
}
