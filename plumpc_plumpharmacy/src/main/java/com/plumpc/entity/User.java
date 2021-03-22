package com.plumpc.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

// nhân viên

@Entity
@Table(name = "NHAN_VIEN")
public class User {
	@Id
	@GeneratedValue(generator = "uuid2")
	@GenericGenerator(name = "uuid2", strategy = "uuid2")
	@Column(length = 36)
	private String Id;

	@Column(name = "HoTen", length = 100, nullable = false)
	private String name;

	@Column(name = "DiaChi", length = 200, nullable = false)
	private String address;

	@Column(name = "SoDienThoai", length = 11, nullable = false)
	private String phone;

	@Column(name = "PhanQuyen", length = 36, nullable = false)
	private String decentralization;

	@Column(name = "NgayVaoLam", nullable = false)
	@Type(type = "date")
	private Date dateJoin;

	@Column(name = "TaiKhoan", length = 50, nullable = false)
	private String userName;

	@Column(name = "MatKhau", length = 100, nullable = false)
	private String password;

	@Column(name = "GhiChu", nullable = true)
	@Type(type = "text")
	private String note;

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		this.Id = id;
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

	public String getDecentralization() {
		return decentralization;
	}

	public void setDecentralization(String decentralization) {
		this.decentralization = decentralization;
	}

	public Date getDateJoin() {
		return dateJoin;
	}

	public void setDateJoin(Date dateJoin) {
		this.dateJoin = dateJoin;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}
