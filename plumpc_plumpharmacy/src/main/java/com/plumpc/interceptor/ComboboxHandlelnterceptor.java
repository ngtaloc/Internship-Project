package com.plumpc.interceptor;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;
import com.plumpc.dao.CountingUnitsDAO;
import com.plumpc.dao.CustomerDAO;
import com.plumpc.dao.DecentralizationDAO;
import com.plumpc.dao.DrugClassificationDAO;
import com.plumpc.entity.Customer;
import com.plumpc.service.HomeService;
import com.plumpc.service.impl.APIServiceImpl;

public class ComboboxHandlelnterceptor implements HandlerInterceptor{
	
	private HomeService homeService;
	
	@Autowired
	CustomerDAO customerDao;
	
	@Autowired
	DecentralizationDAO decentralizationDAO;
	
	@Autowired
	CountingUnitsDAO coutingUnitsDao;
	@Autowired
	DrugClassificationDAO drugClassificationDAO;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		ArrayList<Customer> listC = new  ArrayList<Customer>(customerDao.findAll());
		request.setAttribute("cbbcustomer",listC);
		request.setAttribute("cbbdecentralization",decentralizationDAO.findAll());
		request.setAttribute("cbbCountingUnits", coutingUnitsDao.findAll());
		request.setAttribute("cbbDrugClassificationDAO", drugClassificationDAO.findAll());
		
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
