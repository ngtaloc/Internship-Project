package com.plumpc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.plumpc.dao.DrugClassificationDAOImpl;
import com.plumpc.entity.DrugClassification;
import com.plumpc.entity.User;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/mainUser", method = RequestMethod.GET)
	public ModelAndView mainPageUser() {
		ModelAndView mav = new ModelAndView("mainUser");
		return mav;
	}
	
	@RequestMapping(value = "/mainAdmin", method = RequestMethod.GET)
	public ModelAndView mainPageAdmin() {
		ModelAndView mav = new ModelAndView("mainAdmin");
		return mav;
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("home");
		return mav;
	}
	@RequestMapping(value = "/warehouseInvoice", method = RequestMethod.GET)
	public ModelAndView testPage() {
		ModelAndView mav = new ModelAndView("warehouseInvoice");
		return mav;
	}
	
	@RequestMapping(value = "/wholesale", method = RequestMethod.GET)
	public ModelAndView testwholesale() {
		ModelAndView mav = new ModelAndView("wholesale");
		return mav;
	}
	@RequestMapping(value = "/soldPrescription", method = RequestMethod.GET)
	public ModelAndView testsoldPrescription() {
		ModelAndView mav = new ModelAndView("soldPrescription");
		return mav;
	}
	@RequestMapping(value = "/customerRefund", method = RequestMethod.GET)
	public ModelAndView testcustomerRefund() {
		ModelAndView mav = new ModelAndView("customerRefund");
		return mav;
	}
	
	@RequestMapping(value = "/exportStock", method = RequestMethod.GET)
	public ModelAndView testExportStockPage() {
		ModelAndView mav = new ModelAndView("exportStock");
		return mav;
	}
	@RequestMapping(value = "/inventoryManagement", method = RequestMethod.GET)
	public ModelAndView testInventoryManagerPage() {
		ModelAndView mav = new ModelAndView("inventoryManagement");
		return mav;
	}
	@RequestMapping(value = "/medicineInformation", method = RequestMethod.GET)
	public ModelAndView testMedicineInformationPage() {
		ModelAndView mav = new ModelAndView("medicineInformation");
		return mav;
	}
	
	@RequestMapping(value = "/warehouseReceipt", method = RequestMethod.GET)
	public ModelAndView testWarehouseReceipt() {
		ModelAndView mav = new ModelAndView("warehouseReceipt");
		return mav;
	}
	
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public ModelAndView testReport() {
		ModelAndView mav = new ModelAndView("report");
		return mav;
	} 	
	
	@RequestMapping(value = "/detailCustomer", method = RequestMethod.GET)
	public ModelAndView testdetailCustomer() {
		ModelAndView mav = new ModelAndView("detailCustomer");
		return mav;
	}
	

	
	
}