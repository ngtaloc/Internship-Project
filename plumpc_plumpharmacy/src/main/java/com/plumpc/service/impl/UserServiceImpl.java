package com.plumpc.service.impl;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.plumpc.entity.User;

public class UserServiceImpl {
	DatabaseServicelmpl serviceDB = new DatabaseServicelmpl();
	
	// hàm đăng nhập
	// kiểm tra có user trong db sau đó mới bắt đầu kiểm tra pass
	
	public static String getMd5(String input) 
    { 
        try { 
  
            // Static getInstance method is called with hashing MD5 
            MessageDigest md = MessageDigest.getInstance("MD5"); 
  
            // digest() method is called to calculate message digest 
            //  of an input digest() return array of byte 
            byte[] messageDigest = md.digest(input.getBytes()); 
  
            // Convert byte array into signum representation 
            BigInteger no = new BigInteger(1, messageDigest); 
  
            // Convert message digest into hex value 
            String hashtext = no.toString(16); 
            while (hashtext.length() < 32) { 
                hashtext = "0" + hashtext; 
            } 
            return hashtext; 
        }  
  
        // For specifying wrong message digest algorithms 
        catch (NoSuchAlgorithmException e) { 
            throw new RuntimeException(e); 
        } 
    } 
	// format  yyyy-mm-dd
	public  Date strToDate(String dateStr) {
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");  
		
		try {
		    return dateFormat.parse(dateStr);
		    
		} catch (ParseException e) {
		    return null;
		}
	    
	    
	}
}
