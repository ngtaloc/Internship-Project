package com.plumpc.service.impl;



import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import com.plumpc.dao.CountingUnitsDAO;
import com.plumpc.dao.CountingUnitsDAOImpl;
import com.plumpc.dao.CustomerDAO;
import com.plumpc.dao.CustomerDAOImpl;
import com.plumpc.dao.PatientDAOImpl;

import com.plumpc.entity.CountingUnits;
import com.plumpc.entity.Customer;
import com.plumpc.entity.Decentralization;
import com.plumpc.entity.Drug;
import com.plumpc.entity.DrugClassification;
import com.plumpc.entity.InvoiceClassification;
import com.plumpc.entity.Patient;
import com.plumpc.entity.Supplier;
import com.plumpc.entity.User;
import com.plumpc.utils.HibernateUtils;

public class APIServiceImpl {
	@Autowired
	CustomerDAO customerDAO;
	public ArrayList<DrugClassification> getDrugClassification (){
		
		
		
		return null;
	}
	public ArrayList<Customer> getAllCustomer(){

		

		return null ;
		
	}
	
	public ArrayList<CountingUnits> getAllCountingUnits(){
		
		return null;
	}
	
}
