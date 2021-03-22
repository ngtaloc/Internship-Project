package com.plumpc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
// phân loại hóa đơn

@Entity
@Table(name="PHAN_LOAI_HOA_DON")
public class InvoiceClassification {
	

	@Id
	@GeneratedValue(generator = "uuid2")
	@GenericGenerator(name = "uuid2", strategy = "uuid2")
	@Column(length = 36)
	private String Id;
	
	@Column(name="TenPhanLoaiHoaDon", length=50, nullable= false)
	private String Name;


	public String getId() {
		return Id;
	}
	
	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}
	
	

}
