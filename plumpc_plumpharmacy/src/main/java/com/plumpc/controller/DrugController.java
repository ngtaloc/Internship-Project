package com.plumpc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.plumpc.dao.CountingUnitsDAO;
import com.plumpc.dao.DrugClassificationDAO;
import com.plumpc.dao.DrugDAO;
import com.plumpc.entity.CountingUnits;
import com.plumpc.entity.Drug;
import com.plumpc.entity.DrugClassification;

@Controller("DrugController")
public class DrugController {

	@Autowired
	DrugDAO drugDAO;
	@Autowired
	CountingUnitsDAO countingUnitsDAO;
	@Autowired
	DrugClassificationDAO drugClassificationDAO;

	@RequestMapping(value = "/drugInformationManager", method = RequestMethod.GET)
	public ModelAndView testDrugInformationManager(Model model) {
		List<Drug> l = drugDAO.findAll();
		l.forEach((Drug drug)->{
			
			String drugID = drug.getDrugClassification();
			DrugClassification drugClassification = drugClassificationDAO.findById(drugID);
			drug.setDrugClassification(drugClassification.getName());
			
			String countUnitsID = drug.getCountingUnits();
			CountingUnits countingUnits = countingUnitsDAO.findById(countUnitsID);
			CountingUnits countingUnitsExchange= countingUnitsDAO.findById(drug.getCountingUnitsExchange());
			drug.setCountingUnits(countingUnits.getName());
			drug.setCountingUnitsExchange(countingUnitsExchange.getName());
		});
		model.addAttribute("DrugInformationManagerEdit", new Drug());
		ModelAndView mav = new ModelAndView("drugInformationManager");
		mav.addObject("drugInformationManagerFindAdd", l);
		return mav;
	}

	@RequestMapping(value = "/editDrugInformationManager", method = RequestMethod.POST)
	public String editEntity(@ModelAttribute("DrugInformationManagerEdit") Drug drug) {
	System.out.println(drug.getCountingUnitsExchange());
		try {

			drugDAO.update(drug);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ("redirect:./drugInformationManager");
	}

	@RequestMapping(value = "/deleteDrugInformationManager", method = RequestMethod.POST)
	public String deleteEntity(@ModelAttribute("DrugInformationManagerEdit") Drug drug) {
		try {
			drugDAO.delete(drug.getId());
			System.out.println("OK");
		} catch (Exception e) {
			System.out.println("Error");
		}
		return ("redirect:./drugInformationManager");
	}

	@RequestMapping(value = "/createDrugInformationManager", method = RequestMethod.POST)
	public String createEntity(@ModelAttribute("DrugInformationManagerEdit") Drug drug) {
		Gson gson = new Gson(); 
		System.out.println(gson.toJson(drug));
		drugDAO.create(drug);
		System.out.println("OK");
		return ("redirect:./drugInformationManager");
	}
}
