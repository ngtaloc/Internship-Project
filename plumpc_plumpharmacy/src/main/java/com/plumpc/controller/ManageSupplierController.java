package com.plumpc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.plumpc.dao.CustomerDAO;
import com.plumpc.dao.SupplierDAO;
import com.plumpc.entity.Customer;
import com.plumpc.entity.Supplier;
@Controller("ManageSupplier")
public class ManageSupplierController {
	@Autowired
	SupplierDAO supplierDAO;
	
	@RequestMapping(value = "/manageSupplier",method = RequestMethod.GET)
	public ModelAndView testSupplier(Model model) {
		List<Supplier> l = supplierDAO.findAll();
		model.addAttribute("SupplierEdit", new Supplier());
		ModelAndView mav = new ModelAndView("manageSupplier");
		mav.addObject("supplierFindAdd",l);
		return mav;
	}
	@RequestMapping(value = "/editsupplier", method = RequestMethod.POST)
	public String editEntity(@ModelAttribute("SupplierEdit") Supplier supplier) {
		try {
			supplierDAO.update(supplier);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return("redirect:./manageSupplier");
	}
	
	@RequestMapping(value = "/createsupplier", method = RequestMethod.POST)
	public String createEntity(@ModelAttribute("SupplierEdit") Supplier supplier) {
		try {
			supplierDAO.create(supplier);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return("redirect:./manageSupplier");
	}
	@RequestMapping(value = "/deletesupplier", method = RequestMethod.POST)
	public String deleteEntity(@ModelAttribute("SupplierEdit") Supplier supplier) {
		System.out.println("xoa" + supplier.getId());
		supplierDAO.delete(supplier.getId());
		
		return("redirect:./manageSupplier");
	}
	@RequestMapping(value="/searchSupplier",method=RequestMethod.POST)
	@ResponseBody
    public  List<Supplier> addUser(@ModelAttribute(value="newSupplier") Supplier supplier, BindingResult result ){
           	
            List<Supplier> listSupplier = supplierDAO.findByKeywords(supplier.getName());
            String json = new Gson().toJson(listSupplier);

            return listSupplier;
    }
}
