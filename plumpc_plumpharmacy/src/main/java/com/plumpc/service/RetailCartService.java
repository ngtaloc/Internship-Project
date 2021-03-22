package com.plumpc.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.plumpc.dao.DrugDAO;
import com.plumpc.entity.Drug;
import com.plumpc.entity.PrescriptionDetailed;


@SessionScope// scopeTarget.retailCartService
@Service
public class RetailCartService {
	
	@Autowired
	DrugDAO drugDAO;
	
	Map<String, PrescriptionDetailed> map = new HashMap<String, PrescriptionDetailed>();
	public void add(String id) {
		PrescriptionDetailed p = map.get(id);
		if(p==null) {
			Drug d= drugDAO.findById(id);
			System.out.println("sp null");
			PrescriptionDetailed newP = new PrescriptionDetailed();
			newP.setDrugId(id);
			newP.setTotalOfDrug(1);
			newP.setCountingUnits(d.getCountingUnits());
			map.put(id,newP);
		}else {
			System.out.println("sp k null");
			p.setTotalOfDrug(p.getTotalOfDrug()+1);
			
			
		}
	}
	public void remove(String id) {
		map.remove(id);
	}
	public void updateTotalOfDrug(String id,int total) {
		PrescriptionDetailed p = map.get(id);
		p.setTotalOfDrug(total);
	}
	public void update(String id,int qty) {
		PrescriptionDetailed  p= map.get(id);
		p.setTotalOfDrug(qty);
		
	}
	public void updateCountUnits(String id,String idUnits) {
		map.get(id).setCountingUnits(idUnits);
		System.out.println(map.get(id).getCountingUnits());
	
	}
	public void clear() {
		map.clear();
	}
	public int getCount() {
		Collection<PrescriptionDetailed> ps = this.getAllItem();
		int count = 0 ;
		for(PrescriptionDetailed p:ps){
			
			count += p.getTotalOfDrug();
		}
		return count;
	}
	public double getAmount() {
		Collection<PrescriptionDetailed> ps = this.getAllItem();
		double countAmount = 0 ;
		for(PrescriptionDetailed p:ps){
			Drug drug = drugDAO.findById(p.getDrugId());
			if(p.getCountingUnits().equals(drug.getCountingUnits())) {
				
				countAmount += (p.getTotalOfDrug()*drug.getWholesalePrime()) ;
			}else {
				countAmount += (p.getTotalOfDrug()*drug.getRetailPrime()) ;
			}
		}
		return countAmount;
	}
	public Collection<PrescriptionDetailed> getAllItem(){
		return map.values();
	}
	public  double getPrice(String id) {
		
		PrescriptionDetailed p = map.get(id);
		double price=0;
		Drug drug = drugDAO.findById(p.getDrugId());
		
		if(p.getCountingUnits().equals(drug.getCountingUnits())  ) {
			
			
			price =drug.getWholesalePrime();
		}else {
			
			price =drug.getRetailPrime();
		}
		return price;
	}
	public String getcountUnits(String id) {
		PrescriptionDetailed p = map.get(id);
		return p.getCountingUnits();
	}
	public PrescriptionDetailed getPrescriptionDetailed(String id) {
		return map.get(id);
	}
	
}
