package com.plumpc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.plumpc.dao.DecentralizationDAO;
import com.plumpc.dao.UserDAO;
import com.plumpc.entity.Decentralization;
import com.plumpc.entity.DrugClassification;
import com.plumpc.entity.User;

@Controller("UserController")
public class UserController {
	@Autowired
	UserDAO userDAO;

	@Autowired
	DecentralizationDAO decentralizationDAO;
	
	//Request Mapping cho trang employeeManager	
	@RequestMapping(value = "/employeeManager", method = RequestMethod.GET)
	public ModelAndView testUserInformation(Model model) {
		List<User> l = userDAO.findAll();

		model.addAttribute("UserEdit", new User());
		model.addAttribute("UserAdd", new User());
		ModelAndView mav = new ModelAndView("employeeManager");
		mav.addObject("userFindAddEmp", l);
		mav.addObject("decentralizationDAO", decentralizationDAO);
		return mav;
	}

	@RequestMapping(value = "/editUser", method = RequestMethod.POST)
	public String editEntity(@ModelAttribute("UserEdit") User user) {
		System.out.println("update" + user.getId());
		try {
			userDAO.update(user);
		} catch (Exception e) {
			// TODO: handle exception } }
		}
		return ("redirect:./employeeManager");
	}
	
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String newEntity(@ModelAttribute("UserAdd") User user) {
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaa");
		/* userDAO.create(user); */
		return("redirect:./employeeManager");
	}
	
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	public String deleteEntity(@ModelAttribute("UserEdit") User user) {
		System.out.println("xoa" + user.getId());
		userDAO.delete(user.getId());
		return ("redirect:./employeeManager");
	}

	//Request Mapping cho trang manageAccount 	
	@RequestMapping(value = "/manageAccount", method = RequestMethod.GET)
	public ModelAndView userInformation(Model model) {
		List<User> l = userDAO.findAll();
		model.addAttribute("UserEdits", new User());
		model.addAttribute("UserAdds", new User());
		ModelAndView mav2 = new ModelAndView("manageAccount");
		mav2.addObject("userFindAdd", l);
		mav2.addObject("decentralizationDAO", decentralizationDAO);
		return mav2;
	}
	
	@RequestMapping(value = "/editUsers", method = RequestMethod.POST)
	public String editEntitys(@ModelAttribute("UserEdits") User user) {
		System.out.println("update" + user.getId());
		try {
			userDAO.update(user);
		} catch (Exception e) {
			// TODO: handle exception } }
		}
		return ("redirect:./manageAccount");
	}

	@RequestMapping(value = "/deleteUsers", method = RequestMethod.POST)
	public String deleteEntitys(@ModelAttribute("UserEdits") User user) {
		System.out.println("xoa" + user.getId());
		userDAO.delete(user.getId());
		return ("redirect:./manageAccount");
	}
	
}
