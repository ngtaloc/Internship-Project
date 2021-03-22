package com.plumpc.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.google.gson.Gson;
import com.mysql.cj.xdevapi.JsonArray;
import com.plumpc.dao.CountingUnitsDAO;
import com.plumpc.dao.DrugDAO;
import com.plumpc.dao.InvoiceClassificationDAO;
import com.plumpc.dao.InvoiceDAO;
import com.plumpc.dao.PrescriptionDetailedDAO;
import com.plumpc.dao.PrescriptionHospitalDAO;
import com.plumpc.dao.PrescriptionRetailDAO;
import com.plumpc.dao.PrescriptionWholesaleDAO;
import com.plumpc.entity.Drug;
import com.plumpc.entity.DrugClassification;
import com.plumpc.entity.Invoice;
import com.plumpc.entity.InvoiceClassification;
import com.plumpc.entity.PrescriptionDetailed;
import com.plumpc.entity.PrescriptionHospital;
import com.plumpc.entity.PrescriptionRetail;
import com.plumpc.entity.PrescriptionWholesale;
import com.plumpc.service.RetailCartService;




@Controller("RetailSaleControler")
public class RetailSaleControler {
	
	@Autowired
	DrugDAO drugDAO;
	
	@Autowired
	PrescriptionDetailedDAO prescriptionDetailedDAO;
	
	@Autowired
	RetailCartService retailCartService;
	
	@Autowired
	CountingUnitsDAO countingUnitsDAO;
	
	@Autowired
	InvoiceClassificationDAO invoiceClassificationDAO;
	
	@Autowired
	InvoiceDAO invoiceDAO;
	
	@Autowired
	PrescriptionRetailDAO prescriptionRetailDAO;
	
	@Autowired
	PrescriptionHospitalDAO prescriptionHospitalDAO;
	
	@Autowired
	PrescriptionWholesaleDAO prescriptionWholesaleDAO;
	
	
	@RequestMapping(value = "/retail",method = RequestMethod.GET)
	public ModelAndView testDrugInformation(Model model) {
		model.addAttribute("newDrug", new Drug());
	
		model.addAttribute("newPrescriptionDetailed", new PrescriptionDetailed());
		model.addAttribute("changeQuantityRetailPrescription", new PrescriptionDetailed());
		 List<Drug> listSearchDrug = null ;
		 List<Drug> l = drugDAO.findAll();
		 
		
		ModelAndView mav = new ModelAndView("retail");
		mav.addObject("listAS",l);
		mav.addObject("listRetail",retailCartService);
		mav.addObject("drugSV",drugDAO);
		mav.addObject("countingUnits",countingUnitsDAO);
		return mav;
	}
	
	
	@RequestMapping(value="/searchDrug",method=RequestMethod.POST)
	@ResponseBody
    public  List<Drug> addUser(@ModelAttribute(value="newDrug") Drug drug, BindingResult result, HttpServletRequest request, 
            HttpServletResponse response) throws UnsupportedEncodingException{
			
            List<Drug> listDrug = drugDAO.findByKeywords(drug.getName());
           
            return listDrug;
    }
	
	
	@RequestMapping(value = "/addDrugRetailCart", method = RequestMethod.POST)
	public String addEntity(@ModelAttribute(value="newPrescriptionDetailed") PrescriptionDetailed prescriptionDetailed) {
		retailCartService.add(prescriptionDetailed.getDrugId());
		System.out.println("tổng sp:"+ retailCartService.getCount());
		return("redirect:./retail");
	}
	
	@RequestMapping(value = "/changeQuantityRetail", method = RequestMethod.POST)
	@ResponseBody
	public String changeQuantityEntity(HttpServletRequest request, 
            HttpServletResponse response) {
		
		retailCartService.updateTotalOfDrug(request.getParameter("idDrug"),Integer.parseInt( request.getParameter("num")));
		System.out.println(request.getParameter("num")+"--"+request.getParameter("idDrug"));
		
		String idDrugGet = request.getParameter("idDrug");
		
		PrescriptionDetailed p = retailCartService.getPrescriptionDetailed(idDrugGet);
		Drug d = drugDAO.findById(idDrugGet);
		double nextPrice = p.getCountingUnits().equals(d.getCountingUnits())?d.getWholesalePrime():d.getRetailPrime();
		List<String > listRep = new ArrayList<String>();
		listRep.add(retailCartService.getAmount()+"" );
		listRep.add(nextPrice+"" );
		listRep.add(nextPrice*p.getTotalOfDrug()+"" );
		Gson gson = new Gson();
		return gson.toJson(listRep);
	}
	
	
	
	
	
	@RequestMapping(value = "/deleteDrugRetail", method = RequestMethod.POST)
	@ResponseBody
	public String deleteDrugEntity(HttpServletRequest request, 
            HttpServletResponse response) {
		retailCartService.remove(request.getParameter("idDrug"));
		
		return retailCartService.getAmount()+"";
	}
	
	
	@RequestMapping(value = "/changeCountUnitDrugRetail", method = RequestMethod.POST)
	@ResponseBody
	public String changeCountUnitDrugEntity(HttpServletRequest request, 
            HttpServletResponse response) {
		System.out.println("thay đổi--------"+retailCartService.getcountUnits(request.getParameter("idDrug"))+"sang"+request.getParameter("data"));
		String idDrugGet = request.getParameter("idDrug");
		retailCartService.updateCountUnits(idDrugGet, request.getParameter("data").trim());
		PrescriptionDetailed p = retailCartService.getPrescriptionDetailed(idDrugGet);
		Drug d = drugDAO.findById(idDrugGet);
		double nextPrice = p.getCountingUnits().equals(d.getCountingUnits())?d.getWholesalePrime():d.getRetailPrime();
		List<String > listRep = new ArrayList<String>();
		listRep.add(retailCartService.getAmount()+"" );
		listRep.add(nextPrice+"" );
		listRep.add(nextPrice*p.getTotalOfDrug()+"" );
		
		Gson gson = new Gson();
		
		
		
		return gson.toJson(listRep);
	}
	
	
	@RequestMapping(value = "/paymentRetail", method = RequestMethod.POST)
	@ResponseBody
	public String paymentDrugEntity(HttpServletRequest request, 
            HttpServletResponse response) {
		String staff = "244d612f-8259-11eb-b91b-00d861e23d77";// 
		
		System.out.println("thanh toan");
		if(retailCartService.getCount() == 0) {			
			return "isEmpty";
		}else {
			
			try {
				 long nowDate = System.currentTimeMillis();
					
				 Invoice invoice = new Invoice();// tạo hóa đơn theo ddown trước B1
				 invoice.setInitializationTime(nowDate);// thêm time
				 
				 invoice.setUser(staff);// thêm người tạo
				 invoice.setNote(request.getParameter("note").isEmpty()?"":request.getParameter("note"));
				 invoice.setTotal(retailCartService.getAmount());
				 
				
				 Collection<PrescriptionDetailed> listPrescriptionDetailed =  retailCartService.getAllItem();//lấy mặt gàng trong giỏ ra
				//day la ban theo don thuoc benh vien
				 System.out.println(request.getParameter("check"));
				 if(request.getParameter("check").equals("true")) {
					 System.out.println("theo ddown	");
					 String idIC = invoiceClassificationDAO.findByKeywords("Theo Đơn").get(0).getId(); 
					 invoice.setInvoiceClassification(idIC);// phân loại hóa đơn
					 // taoj khach hang 
					 if(!request.getParameter("custrue").equals("nullCus")) {
						 invoice.setCustomerId(request.getParameter("custrue"));
					 }
					 String idRetail = invoiceDAO.create(invoice).getId(); // tạo và lấy id hóa đơn
					 System.out.println("hoa đơn"+idRetail);
						try {
							
							 for(PrescriptionDetailed p: retailCartService.getAllItem()) {
								 System.out.println("tao đơn thuốc chi tiết:");
								 String IdGetPrescriptionDetaile = prescriptionDetailedDAO.create(p).getId();// lay id đơn thuốc chi tiết vừa tạo ra B3
								 System.out.println("tao đơn thuốc chi tiết:-->"+IdGetPrescriptionDetaile);
								 PrescriptionHospital prescriptionHospital = new PrescriptionHospital();// dơn thuốc nhaf thuoocs
								 prescriptionHospital.setId(IdGetPrescriptionDetaile);
								 prescriptionHospital.setInvoiceId(idRetail);
								 prescriptionHospital.setSymptom(request.getParameter("symptom"));
								 prescriptionHospital.setDoctorName(request.getParameter("doctor"));
								 prescriptionHospital.setDiagnostic(request.getParameter("diagnostic"));
								 prescriptionHospital.setHospitalAddress(request.getParameter("address"));
								 prescriptionHospitalDAO.create(prescriptionHospital);
							 }
							 
							 retailCartService.clear();
							 return "finish";
						} catch (Exception e) {
						     return "error";
						}
					}else {
						//laf ban hang
						if(request.getParameter("cusfalse").equals("nullCus")) {
							System.out.println("bans le");
							System.out.println(request.getParameter("cusfalse").toString());
							try {
								String idIC = invoiceClassificationDAO.findByKeywords("Bán Lẻ").get(0).getId(); 
								invoice.setInvoiceClassification(idIC);// phân loại hóa đơn
								
								String idRetail = invoiceDAO.create(invoice).getId(); //tao hoa don truoc
								 
								 for(PrescriptionDetailed p: retailCartService.getAllItem()) {
									 System.out.println("tao đơn thuốc chi tiết:");
									 String IdGetPrescriptionDetaile = prescriptionDetailedDAO.create(p).getId();// lay id đơn thuốc chi tiết vừa tạo ra B3
									 System.out.println("tao đơn thuốc chi tiết:-->"+IdGetPrescriptionDetaile);
									 PrescriptionRetail prescriptionRetail = new PrescriptionRetail();// dơn thuốc lẻ
									 prescriptionRetail.setId(IdGetPrescriptionDetaile);
									 prescriptionRetail.setInvoiceId(idRetail);
									 prescriptionRetailDAO.create(prescriptionRetail);
								 }
								 
								 retailCartService.clear();
								 return "finish";
							} catch (Exception e) {
							     return "error";
							}
						}else {
							System.out.println("ban si");
							// la ban si
							try {
								String idIC = invoiceClassificationDAO.findByKeywords("Bán Sỉ").get(0).getId(); 
								invoice.setInvoiceClassification(idIC);// phân loại hóa đơn
								invoice.setCustomerId(request.getParameter("cusfalse"));// tao kach hang
								String idRetail = invoiceDAO.create(invoice).getId(); //tao hoa don truoc
								 
								 for(PrescriptionDetailed p: retailCartService.getAllItem()) {
									 System.out.println("tao đơn thuốc chi tiết:");
									 String IdGetPrescriptionDetaile = prescriptionDetailedDAO.create(p).getId();// lay id đơn thuốc chi tiết vừa tạo ra B3
									 System.out.println("tao đơn thuốc chi tiết:-->"+IdGetPrescriptionDetaile);
									 PrescriptionWholesale prescriptionWholesale = new PrescriptionWholesale();// dơn thuốc lẻ
									 prescriptionWholesale.setId(IdGetPrescriptionDetaile);
									 prescriptionWholesale.setInvoiceId(idRetail);
									 prescriptionWholesaleDAO.create(prescriptionWholesale);
								 }
								 
								 retailCartService.clear();
								 return "finish";
							} catch (Exception e) {
							     return "error";
							}
							
							
						}
					}
			}catch (Exception e) {
				return "error";
			}
			
			
			 
			
		}
		
	}
}
