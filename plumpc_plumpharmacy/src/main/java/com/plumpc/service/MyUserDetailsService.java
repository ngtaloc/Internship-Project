package com.plumpc.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.plumpc.dao.DecentralizationDAO;
import com.plumpc.dao.UserDAO;
import com.plumpc.entity.Decentralization;


@Service
public class MyUserDetailsService implements UserDetailsService {
  @Autowired
  private UserDAO userDAO;
  @Autowired
  private DecentralizationDAO decentralizationDAO;
  
  public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
	  System.out.println("Username: " + username);
	  
    com.plumpc.entity.User user = userDAO.findUserName(username);
    System.out.println("User: " + user.getName());
   
    if (user == null) {
    	
    	System.out.println("user null");
    	
      return null;
    }
    boolean enabled = true;
    boolean accountNonExpired = true;
    boolean credentialsNonExpired = true;
    boolean accountNonLocked = true;

	Decentralization decentralization =	decentralizationDAO.findById(user.getDecentralization());	
	List<GrantedAuthority> authorities = new ArrayList<>();
	authorities.add(new SimpleGrantedAuthority(decentralization.getName()));
	
	System.out.println(decentralization.getName());
	
    return new User(username, user.getPassword(), authorities) ;
  }
}