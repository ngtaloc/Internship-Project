package com.plumpc.controller;

import java.util.List;
import java.util.function.Consumer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.plumpc.dao.CustomerDAO;
import com.plumpc.dao.InvoiceDAO;
import com.plumpc.dao.UserDAO;
import com.plumpc.entity.Customer;
import com.plumpc.entity.Drug;
import com.plumpc.entity.Invoice;
import com.plumpc.entity.User;

@Controller("ManagementSaleController")
public class ManagementSaleController {
	
	@Autowired
	CustomerDAO customerDAO;
	@Autowired
	InvoiceDAO invoiceDAO;
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping(value = "/managementSale",method = RequestMethod.GET)
	public ModelAndView testDrssugInformation(Model model) {
		
		ModelAndView mav = new ModelAndView("managementSale");
		List<Invoice> l = invoiceDAO.findAll();
		if(l.size()>0) {
			System.out.println("check");
			for(Invoice i:l) {
				if(i.getCustomerId() == null) {
					i.setCustomerId("Khách lẻ");
				}else {
					i.setCustomerId(customerDAO.findById(i.getCustomerId()).getName());
				}
				
			}
//			l.forEach((Invoice invoice)->{
//				//Láº¥y id cá»§a khÃ¡ch hÃ ng
//				String cusId =  invoice.getCustomerId();
//				Customer customer =  customerDAO.findById(cusId);
//				
//				//Láº¥y id cá»§a nhÃ¢n viÃªn
//				String userId = invoice.getUser();
//				User user = userDAO.findById(userId);
//				invoice.setCustomerId(customer.getName());
//				invoice.setUser(user.getName());
//				
//			});
		}
		model.addAttribute("ManagementSaleEdit", new Invoice());
		
		mav.addObject("managementSaleFindAdd",l);

		return mav;
	}
	
	@RequestMapping(value = "/deleteManagementSale", method = RequestMethod.POST)
	public String deleteEntity(@ModelAttribute("ManagementSaleEdit") Invoice invoice) {
		invoiceDAO.delete(invoice.getId());
		return ("redirect:./managementSale");
	}
}
