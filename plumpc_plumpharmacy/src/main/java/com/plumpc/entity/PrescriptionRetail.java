package com.plumpc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="DON_THUOC_LE")
public class PrescriptionRetail {
	@Id
	@Column(length = 36)
	private String Id;
	
	@Column(name="IdHoaDon", length=36, nullable= false)
	private String invoiceId; // id hóa đơn

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(String invoiceId) {
		this.invoiceId = invoiceId;
	}
}
