package com.plumpc.controller;

import java.io.UnsupportedEncodingException;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.protobuf.Timestamp;
import com.plumpc.dao.CountingUnitsDAO;
import com.plumpc.dao.CustomerDAO;
import com.plumpc.dao.CustomerDAOImpl;
import com.plumpc.dao.DecentralizationDAO;
import com.plumpc.dao.DrugClassificationDAO;
import com.plumpc.dao.DrugClassificationDAOImpl;
import com.plumpc.dao.DrugDAO;
import com.plumpc.dao.InvoiceClassificationDAO;
import com.plumpc.dao.InvoiceDAO;
import com.plumpc.dao.PatientDAO;
import com.plumpc.dao.PrescriptionByPharmacyDAO;
import com.plumpc.dao.PrescriptionRetailDAO;
import com.plumpc.dao.UserDAO;
import com.plumpc.entity.Customer;
import com.plumpc.entity.Decentralization;
import com.plumpc.entity.Drug;
import com.plumpc.entity.Invoice;
import com.plumpc.entity.InvoiceClassification;
import com.plumpc.entity.Patient;
import com.plumpc.entity.PrescriptionByPharmacy;
import com.plumpc.entity.PrescriptionDetailed;
import com.plumpc.entity.User;
import com.plumpc.service.CartServiceCheck;
import com.plumpc.service.RetailCartService;

@Controller("SearchController")
public class SearchController {
	@Autowired
	DrugDAO drugDAO;
	
	@Autowired
	CountingUnitsDAO countingUnitsDAO;
	
	@Autowired
	DrugClassificationDAO drugClassificationDAO;
	
	@Autowired
	PrescriptionByPharmacyDAO prescriptionByPharmacy;
	
	@Autowired
	PatientDAO patientDAO;
	
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	DecentralizationDAO decentralizationDAO;
	
	@Autowired
	InvoiceDAO invoiceDAO;
	
	@Autowired
	InvoiceClassificationDAO invoiceClassificationDAO;
	
	@Autowired
	CustomerDAO customerDAO;
	
	@Autowired
	PrescriptionRetailDAO prescriptionRetailDAO;
	
	@Autowired
	CartServiceCheck cartServiceCheck;
	
	@RequestMapping(value = "/search",method = RequestMethod.GET)
	public ModelAndView testDrugInformation(Model model) {
		
		
		ModelAndView mav = new ModelAndView("search");
		
		return mav;
	}
	
	
	@RequestMapping(value="/searchDrugInPageSearch",method=RequestMethod.POST)
	@ResponseBody
    public  List<Drug> searchDrugInPageSearch( HttpServletRequest request, 
            HttpServletResponse response) {
			
            System.out.println(request.getParameter("keyValue"));

            List<Drug> listDrug = drugDAO.findByKeywords(request.getParameter("keyValue"));
            
            if(listDrug.size()>0) {
            	listDrug.forEach((Drug d)->{
                	d.setCountingUnits(countingUnitsDAO.findById(d.getCountingUnits()).getName());
                	d.setCountingUnitsExchange(countingUnitsDAO.findById(d.getCountingUnitsExchange()).getName());
                	d.setDrugClassification(drugClassificationDAO.findById(d.getDrugClassification()).getName());
                });
            }
           
            return listDrug;
    }
	
	@RequestMapping(value="/searchPrescriptionByPharmacyInPageSearch",method=RequestMethod.POST)
	@ResponseBody
    public  List<PrescriptionByPharmacy> searchPrescriptionByPharmacyInPageSearch( HttpServletRequest request, 
            HttpServletResponse response) {
			
            System.out.println(request.getParameter("keyValue"));
            
            

            
            Map<String, PrescriptionByPharmacy> map = new HashMap<String, PrescriptionByPharmacy>();
            List<PrescriptionByPharmacy> checkP = prescriptionByPharmacy.findByKeywords(request.getParameter("keyValue"));
            
            if(checkP.size()>0) {
            	checkP.forEach((PrescriptionByPharmacy p)->{
                	map.put(p.getId(), p);
                });
            }
            
            List<Patient>check = patientDAO.findByKeywords(request.getParameter("keyValue"));
            if(check.size()>0) {
            	prescriptionByPharmacy.findByKeywords(check.get(0).getId()).forEach((PrescriptionByPharmacy p)->{
                	map.put(p.getId(), p);
                });
            }
           
            List<PrescriptionByPharmacy> listPrescriptionByPharmacy = new ArrayList<PrescriptionByPharmacy>(map.values());
            
            
            if(listPrescriptionByPharmacy.size()>0) {
            	listPrescriptionByPharmacy.forEach((PrescriptionByPharmacy p)->{
                	p.setPatientId(patientDAO.findById(p.getPatientId()).getName());
                	
                	
                });
            }
           
            return listPrescriptionByPharmacy;
    }
	
	
	
	
	@RequestMapping(value="/searchUserInPageSearch",method=RequestMethod.POST)
	@ResponseBody
    public  List<User> searchUserSearch( HttpServletRequest request, 
            HttpServletResponse response) {
			
            System.out.println(request.getParameter("keyValue"));
            
            

            
            Map<String, User> map = new HashMap<String, User>();
            List<User> checkP = userDAO.findByKeywords(request.getParameter("keyValue"));
            
            if(checkP.size()>0) {
            	checkP.forEach((User u)->{
                	map.put(u.getId(), u);
                });
            }
            
            List<Decentralization>check = decentralizationDAO.findByKeywords(request.getParameter("keyValue"));
            if(check.size()>0) {
            	userDAO.findByKeywords(check.get(0).getId()).forEach((User p)->{
                	map.put(p.getId(), p);
                });
            }
           
            List<User> listUser = new ArrayList<User>(map.values());
            
            
            if(listUser.size()>0) {
            	listUser.forEach((User u)->{
                	u.setDecentralization(decentralizationDAO.findById(u.getDecentralization()).getName());
                	
                	
                });
            }
           
            return listUser;
    }
	
	@RequestMapping(value="/searchInvoiceInPageSearch",method=RequestMethod.POST)
	@ResponseBody
    public  List<Object> searchInvoiceInPageSearch( HttpServletRequest request, 
            HttpServletResponse response) {
			
            System.out.println(request.getParameter("keyValue"));
            
            

            
            Map<String, Invoice> map = new HashMap<String, Invoice>();
            List<Invoice> checkP = invoiceDAO.findByKeywords(request.getParameter("keyValue"));
            
            if(checkP.size()>0) {
            	checkP.forEach((Invoice u)->{
                	map.put(u.getId(), u);
                });
            }
            
            List<InvoiceClassification>check = invoiceClassificationDAO.findByKeywords(request.getParameter("keyValue"));
            if(check.size()>0) {
            	invoiceDAO.findByKeywords(check.get(0).getId()).forEach((Invoice p)->{
                	map.put(p.getId(), p);
                });
            }
            
            
            List<Customer> checkCus =  customerDAO.findByKeywords(request.getParameter("keyValue"));
            if(checkCus.size()>0) {
            	
            	checkCus.forEach((Customer c)->{
            		invoiceDAO.findByKeywords(c.getId()).forEach((Invoice p)->{
                    	map.put(p.getId(), p);
                    });
            	});
            	
            }
            
            List<User> checkUser =  userDAO.findByKeywords(request.getParameter("keyValue"));
            if(checkUser.size()>0) {
            	
            	checkUser.forEach((User c)->{
            		invoiceDAO.findByKeywords(c.getId()).forEach((Invoice p)->{
                    	map.put(p.getId(), p);
                    });
            	});
            	
            }
           
            List<Invoice> listInvoice = new ArrayList<Invoice>(map.values());
            List<Object> objectDataSend = new ArrayList<Object>();
            
            if(listInvoice.size()>0) {
            	listInvoice.forEach((Invoice u)->{
            		List<Object> object = new ArrayList<Object>();
            		
            		
            		u.setUser(userDAO.findById(u.getUser()).getName());
            		object.add(u);
            		long dateget=u.getInitializationTime()*1L;
            		
            		String date = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new java.util.Date (dateget));
            		
                    object.add(date);
                   
                    objectDataSend.add(object);
                });
            }
           
            return objectDataSend;
    }
}
