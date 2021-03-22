package com.plumpc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.plumpc.dao.DecentralizationDAO;
import com.plumpc.dao.UserDAO;
import com.plumpc.entity.Decentralization;
import com.plumpc.entity.User;

@Controller
public class ReportController {

	@Autowired
	UserDAO userDAO;
	@Autowired
	DecentralizationDAO decentralizationDAO;

	
	@RequestMapping(value = "/banLe", method = RequestMethod.GET)
	public ModelAndView downloadExceBanLe(HttpServletRequest request, HttpServletResponse response) {

		
		
		
		List<User> users = userDAO.findAll();
		return new ModelAndView("excelViewbanLe", "Users", users);
	}
	@RequestMapping(value = "/banSi", method = RequestMethod.GET)
	public ModelAndView downloadExceBanSi(HttpServletRequest request, HttpServletResponse response) {
		
		List<Decentralization> decentralizations = decentralizationDAO.findAll();
		return new ModelAndView("excelViewBanSi", "Decentralizations", decentralizations);
	}
	
	@RequestMapping(value = "/banTheoDon", method = RequestMethod.GET)
	public ModelAndView downloadExcebanTheoDon(HttpServletRequest request, HttpServletResponse response) {

		List<User> users = userDAO.findAll();
		return new ModelAndView("excelViewbanTheoDon", "Users", users);
	}
	@RequestMapping(value = "/thuocDangCungCap", method = RequestMethod.GET)
	public ModelAndView downloadExcethuocDangCungCap(HttpServletRequest request, HttpServletResponse response) {

		List<User> users = userDAO.findAll();
		return new ModelAndView("excelViewthuocDangCungCap", "Users", users);
	}
	@RequestMapping(value = "/dsNhaCungCap", method = RequestMethod.GET)
	public ModelAndView downloadExcedsNhaCungCap(HttpServletRequest request, HttpServletResponse response) {

		List<User> users = userDAO.findAll();
		return new ModelAndView("excelViewdsNhaCungCap", "Users", users);
	}
	@RequestMapping(value = "/dsKhachHang", method = RequestMethod.GET)
	public ModelAndView downloadExcedsKhachHang(HttpServletRequest request, HttpServletResponse response) {

		List<User> users = userDAO.findAll();
		return new ModelAndView("excelViewdsKhachHang", "Users", users);
	}
	@RequestMapping(value = "/danhThu", method = RequestMethod.GET)
	public ModelAndView downloadExcedanhThu(HttpServletRequest request, HttpServletResponse response) {

		List<User> users = userDAO.findAll();
		return new ModelAndView("excelViewdanhThu", "Users", users);
	}
	@RequestMapping(value = "/nkBanHang", method = RequestMethod.GET)
	public ModelAndView downloadExcenkBanHang(HttpServletRequest request, HttpServletResponse response) {

		List<User> users = userDAO.findAll();
		return new ModelAndView("excelViewnkBanHang", "Users", users);
	}
	@RequestMapping(value = "/nhapThem", method = RequestMethod.GET)
	public ModelAndView downloadExcelnhapThem(HttpServletRequest request, HttpServletResponse response) {

		List<User> users = userDAO.findAll();
		return new ModelAndView("excelViewnhapThem", "Users", users);
	}
	@RequestMapping(value = "/hetHan", method = RequestMethod.GET)
	public ModelAndView downloadExcehetHan(HttpServletRequest request, HttpServletResponse response) {

		List<User> users = userDAO.findAll();
		return new ModelAndView("excelViewhetHan", "Users", users);
	}
	@RequestMapping(value = "/top100Thuoc", method = RequestMethod.GET)
	public ModelAndView downloadExceltop100Thuoc(HttpServletRequest request, HttpServletResponse response) {

		List<User> users = userDAO.findAll();
		return new ModelAndView("excelViewtop100Thuoc", "Users", users);
	}
	
}
