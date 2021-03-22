package com.plumpc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "DON_THUOC_CHI_TIET")
public class PrescriptionDetailed {
	@Id
	@GeneratedValue(generator = "uuid2")
	@GenericGenerator(name = "uuid2", strategy = "uuid2")
	@Column(length = 36)
	private String Id; // id đơn thuốc

	@Column(name = "IdThuoc", length = 36, nullable = false)
	private String drugId; // id thuốc

	@Column(name = "SoLanTrongNgay", nullable = true)
	private Integer numberOfDay; // số lần uống mỗi ngày

	@Column(name = "MoiLan", nullable = true)
	private Integer numberOfDrug; // lỗi lần uống n thuốc

	@Column(name = "IdDonVi", length = 36, nullable = true)
	private String countingUnits; // donvi

	@Column(name = "TongThuoc", nullable = false)
	private Integer totalOfDrug; // tổng số thuốc
	


	

	public String getId() {
		return Id;
	}

	

	public String getDrugId() {
		return drugId;
	}

	public Integer getNumberOfDay() {
		return numberOfDay;
	}

	public void setNumberOfDay(Integer numberOfDay) {
		this.numberOfDay = numberOfDay;
	}

	public Integer getNumberOfDrug() {
		return numberOfDrug;
	}

	public void setNumberOfDrug(Integer numberOfDrug) {
		this.numberOfDrug = numberOfDrug;
	}

	public Integer getTotalOfDrug() {
		return totalOfDrug;
	}

	public void setTotalOfDrug(Integer totalOfDrug) {
		this.totalOfDrug = totalOfDrug;
	}

	public String getCountingUnits() {
		return countingUnits;
	}

	public void setCountingUnits(String countingUnits) {
		this.countingUnits = countingUnits;
	}

	public void setDrugId(String drugId) {
		this.drugId = drugId;
	}
	

}
