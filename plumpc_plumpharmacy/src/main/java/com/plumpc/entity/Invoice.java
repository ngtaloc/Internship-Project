package com.plumpc.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

@Entity
@Table(name="HOA_DON")
public class Invoice {
	
	@Id
	@GeneratedValue(generator = "uuid2")
	@GenericGenerator(name = "uuid2", strategy = "uuid2")
	@Column(length = 36)
	private String Id;
	
	@Column(name="NhanVien", length=36, nullable= false)
	private String user;// nhân viên , người tạo hóa đơn
	
	@Column(name="GhiChu", nullable= true)
	@Type(type="text")
	private String note;
	
	@Column(name="IdDonThuoc", length=36, nullable= true)
	private String prescriptionId; //  mã đơn thuốc
	
	@Column(name="IdKhachHang", length=36, nullable= true)
	private String customerId; // mã khách hàng
	
	@Column(name="PhanLoaiHoaDon", length=36, nullable= false)
	private String invoiceClassification; // phân loại hóa đơn
	
	@Column(name="ThoiGianTao", nullable= false)
	private long initializationTime; // thời gian tạo
	
	@Column(name = "TongTien", nullable = true)
	private double total; // tổng số thuốc

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getPrescriptionId() {
		return prescriptionId;
	}

	public void setPrescriptionId(String prescriptionId) {
		this.prescriptionId = prescriptionId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getInvoiceClassification() {
		return invoiceClassification;
	}

	public void setInvoiceClassification(String invoiceClassification) {
		this.invoiceClassification = invoiceClassification;
	}

	public long getInitializationTime() {
		return initializationTime;
	}

	public void setInitializationTime(long initializationTime) {
		this.initializationTime = initializationTime;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	
}
