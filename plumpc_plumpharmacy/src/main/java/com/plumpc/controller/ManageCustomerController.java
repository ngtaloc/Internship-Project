package com.plumpc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.plumpc.dao.CustomerDAO;
import com.plumpc.entity.Customer;

@Controller("ManageCustomer")
public class ManageCustomerController {
	@Autowired
	CustomerDAO customerDAO;
	
	@RequestMapping(value = "/manageCustomer",method = RequestMethod.GET)
	public ModelAndView testCustomer(Model model) {
		List<Customer> l = customerDAO.findAll();
		
		model.addAttribute("CustomerEdit", new Customer());
		ModelAndView mav = new ModelAndView("manageCustomer");
		mav.addObject("cutomerFindAdd",l);
		return mav;
	}
	@RequestMapping(value = "/editcustomer", method = RequestMethod.POST)
	public String editEntity(@ModelAttribute("CustomerEdit") Customer customer) {
		try {
			customerDAO.update(customer);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return("redirect:./manageCustomer");
	}
	@RequestMapping(value = "/createcustomer", method = RequestMethod.POST)
	public String createEntity(@ModelAttribute("CustomerEdit") Customer customer) {
		try {
			customerDAO.create(customer);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return("redirect:./manageCustomer");
	}
	@RequestMapping(value = "/deletecustomer", method = RequestMethod.POST)
	public String deleteEntity(@ModelAttribute("CustomerEdit") Customer customer) {
		System.out.println("xoa" + customer.getId());
		customerDAO.delete(customer.getId());
		
		return("redirect:./manageCustomer");
	}
}
