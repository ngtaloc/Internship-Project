package com.plumpc.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


// thuốc

@Entity
@Table(name="THUOC")
public class Drug {
	@Id
	@GeneratedValue(generator = "uuid2")
	@GenericGenerator(name = "uuid2", strategy = "uuid2")
	@Column(length = 36)
	private String Id;
	
	@Column(name="TenThuoc", length=50, nullable= false)
	private String name;
	
	@Column(name="HoatChat", length=100, nullable= true)
	private String ingredient; // thành phần trong thuốc
	
	@Column(name="NhomThuoc", length=36, nullable= false)
	private String drugClassification; // nhóm thuốc
//	@OneToOne
//	@JoinColumn(name = "NhomThuoc", referencedColumnName = "Id")
//	private DrugClassification drugClassification; // nhóm thuốc

	@Column(name="TiLeQuyDoi", nullable= false)
	private Integer conversionRate; // tỉ lệ quy đổi
	
	@Column(name="GiaNhap", nullable= false)
	private Integer primeCost; // giá nhập
	
	@Column(name="GiaNhapQD", nullable= true)
	private Integer primeCostExchange; // giá nhập quy đổi
	
	@Column(name="TyLeChietKhau", nullable= false)
	private Double discount; // chiết khấu / tỉ lệ chiết khấu từ nhà cung cấp
	
	@Column(name="VAT", nullable= false)
	private Double vat; // thuế giá trị gia tăng
	
	@Column(name="NhapCoVAT", nullable= true)
	private Integer primeCostVAT; // giá nhập đã có vat
	
	@Column(name="LoiNhuanXC", nullable= false)
	private Double wholesaleProfit; // lợi nhuận bán sỉ
	
	@Column(name="LoiNhuanXL", nullable= true)
	private Double retailProfit; // lợi nhuận bán lẻ
	
	@Column(name="GiaBanLe", nullable= true)
	private Double retailPrime; // giá bán lẻ
	
	@Column(name="GiaBanSi", nullable= true)
	private Double wholesalePrime; // giá bán sỉ
	
	@Column(name="NhaSanXuat", length=50, nullable= true)
	private String drugManufacturer; // nhà sản xuất
	
	@Column(name="XuatXu", length=50, nullable= true)
	private String origin; // xuất xứ
	
	@Column(name="GhiChu", length=200, nullable= true)
	private String note;
	
	@Column(name="NhaCungCap", length=36, nullable= true)
	private String supplier; // nhà cung cấp
//	@OneToOne
//	@JoinColumn(name = "NhaCungCap", referencedColumnName = "Id")
//	private Supplier supplier; // nhà cung cấp
	
	@Column(name="DonViTinh", length=36, nullable= true)
	private String countingUnits; // đơn vị tính/ đơn vị của thuốc
//	@OneToOne
//	@JoinColumn(name = "DonViTinh", referencedColumnName = "Id")
//	private CountingUnits countingUnits; // đơn vị tính/ đơn vị của thuốc
	
	@Column(name="DonViQuyDoi", length=36, nullable= true)
	private String countingUnitsExchange; // đơn vị quy đổi

	public void setId(String id) {
		Id = id;
	}

	public String getId() {
		return Id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	public String getDrugClassification() {
		return drugClassification;
	}

	public void setDrugClassification(String drugClassification) {
		this.drugClassification = drugClassification;
	}

	public Integer getConversionRate() {
		return conversionRate;
	}

	public void setConversionRate(Integer conversionRate) {
		this.conversionRate = conversionRate;
	}

	public Integer getPrimeCost() {
		return primeCost;
	}

	public void setPrimeCost(Integer primeCost) {
		this.primeCost = primeCost;
	}

	public Integer getPrimeCostExchange() {
		return primeCostExchange;
	}

	public void setPrimeCostExchange(Integer primeCostExchange) {
		this.primeCostExchange = primeCostExchange;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Double getVat() {
		return vat;
	}

	public void setVat(Double vat) {
		this.vat = vat;
	}

	public Integer getPrimeCostVAT() {
		return primeCostVAT;
	}

	public void setPrimeCostVAT(Integer primeCostVAT) {
		this.primeCostVAT = primeCostVAT;
	}

	public Double getWholesaleProfit() {
		return wholesaleProfit;
	}

	public void setWholesaleProfit(Double wholesaleProfit) {
		this.wholesaleProfit = wholesaleProfit;
	}

	public Double getRetailProfit() {
		return retailProfit;
	}

	public void setRetailProfit(Double retailProfit) {
		this.retailProfit = retailProfit;
	}

	public Double getRetailPrime() {
		return retailPrime;
	}

	public void setRetailPrime(Double retailPrime) {
		this.retailPrime = retailPrime;
	}

	public Double getWholesalePrime() {
		return wholesalePrime;
	}

	public void setWholesalePrime(Double wholesalePrime) {
		this.wholesalePrime = wholesalePrime;
	}

	public String getDrugManufacturer() {
		return drugManufacturer;
	}

	public void setDrugManufacturer(String drugManufacturer) {
		this.drugManufacturer = drugManufacturer;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public String getCountingUnits() {
		return countingUnits;
	}

	public void setCountingUnits(String countingUnits) {
		this.countingUnits = countingUnits;
	}

	public String getCountingUnitsExchange() {
		return countingUnitsExchange;
	}

	public void setCountingUnitsExchange(String countingUnitsExchange) {
		this.countingUnitsExchange = countingUnitsExchange;
	}
//	@OneToOne
//	@JoinColumn(name = "DonViQuyDoi", referencedColumnName = "Id")
//	private CountingUnits countingUnitsExchange; // đơn vị quy đổi

	

	
	
	
}
