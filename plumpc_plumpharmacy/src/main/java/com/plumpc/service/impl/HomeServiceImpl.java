package com.plumpc.service.impl;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.plumpc.service.DatabaseService;
import com.plumpc.service.HomeService;

@Service
public class HomeServiceImpl implements HomeService {

	@Override
	public List<String> loadMenu() {
		List<String> menus = new ArrayList<>();
		menus.add("Blog java web");
		menus.add("Hướng dẫn học java web");
		menus.add("Liên hệ");
		menus.add("Thanh toán");
		return menus;
	}

	

	
	
	
}