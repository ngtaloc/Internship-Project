package com.plumpc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


// nhà cung cấp

@Entity
@Table(name="NHA_CUNG_CAP")
public class Supplier {
	@Id
	@GeneratedValue(generator = "uuid2")
	@GenericGenerator(name = "uuid2", strategy = "uuid2")
	@Column(length = 36)
	private String Id;
	
	@Column(name="TenNhaCungCap", length=50, nullable= false)
	private String name;
	
	@Column(name="DiaChi", length=150, nullable= true)
	private String address;
	
	@Column(name="SoDienThoai", length=11, nullable= true ,insertable = true, updatable = true)
	private String phone;
	
	@Column(name="CongNo", nullable= true)
	private Float liabilities;
	
	@Column(name="GhiChu", length=150, nullable= true)
	private String note;
	
	public String getId() {
		return Id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Float getLiabilities() {
		return liabilities;
	}

	public void setLiabilities(Float liabilities) {
		this.liabilities = liabilities;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
}
