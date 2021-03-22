package com.plumpc.controller;

import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.plumpc.entity.LoginForm;

@Controller
public class LoginController {

	@RequestMapping(value = { "/login", "/" })
	
	public String login(@RequestParam(value = "error", required = false) final String error, final Model model) {
		if (error != null) {
		
			System.out.println(error);
			model.addAttribute("message", "Tên đăng nhập hoặc mật khẩu sai!");
		}
		model.addAttribute("login", new LoginForm());
	
		return "login";
	}

	@RequestMapping("/logout")
	public String logout(final Model model) {
		model.addAttribute("message", "Bạn đã đăng xuất!");
		model.addAttribute("login", new LoginForm());
		return "login";
	}
//	@RequestMapping(value = "/checklogin", method = RequestMethod.POST)
//	public String loginEntity(@ModelAttribute("user") User user) {
//		System.out.println(user.getUserName() + user.getPassword());
//		UserServiceImpl userServiceImpl = new UserServiceImpl();
//
//		User userGet = new User();
//		
//		if(userGet!=null) {
//			System.out.println(userGet.getName()+"-Dang nhap Thanh Cong");
////		    return("main");
//			return("redirect:main");
//			
//		}else {
//			return("login");
//
//		}

}
