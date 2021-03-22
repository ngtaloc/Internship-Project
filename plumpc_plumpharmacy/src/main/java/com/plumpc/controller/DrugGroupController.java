package com.plumpc.controller;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.plumpc.dao.DrugClassificationDAO;
import com.plumpc.entity.DrugClassification;

@Controller("DrugGroupController")
public class DrugGroupController {
	
	@Autowired
	DrugClassificationDAO drugClassificationDAO;
	
	@RequestMapping(value = "/drugGroup",method = RequestMethod.GET)
	public ModelAndView testDrugInformation(Model model, Authentication authentication) {
		List<DrugClassification> l = drugClassificationDAO.findAll();
		System.out.println("CALLuser:"+ authentication.getName());
		model.addAttribute("DrugClassificationEdit", new DrugClassification());
		model.addAttribute("newDrugClassificationEdit", new DrugClassification());
		ModelAndView mav = new ModelAndView("drugGroup");
		mav.addObject("drugClassificationFindAdd",l);
		return mav;
	}
	@RequestMapping(value = "/editdrugGroup", method = RequestMethod.POST)
	public String editEntity(@ModelAttribute("DrugClassificationEdit") DrugClassification drugClassification) {
		try {
			drugClassificationDAO.update(drugClassification);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return("redirect:./drugGroup");
	}
	
	
	@RequestMapping(value = "/deletedrugGroup", method = RequestMethod.POST)
	public String deleteEntity(@ModelAttribute("DrugClassificationEdit") DrugClassification drugClassification) {
		System.out.println("xoa" + drugClassification.getId());
		drugClassificationDAO.delete(drugClassification.getId());
		
		return("redirect:./drugGroup");
	}
	
	

	@RequestMapping(value = "/adddrugGroup", method = RequestMethod.POST)
	public String newEntity(@ModelAttribute("newDrugClassificationEdit") DrugClassification drugClassification) {
		String idnew = drugClassificationDAO.create(drugClassification).getId();
		System.out.println(idnew);
		
		return("redirect:./drugGroup");
	}

	
}
