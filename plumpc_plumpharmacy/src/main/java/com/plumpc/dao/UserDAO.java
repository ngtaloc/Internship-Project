package com.plumpc.dao;

import java.util.List;


import com.plumpc.entity.User;

public interface UserDAO {
	List<User> findAll();
	User findById(String id);
	public User loadUserByUsername(final String userName);
	User create(User user);
	User delete(String id);
	boolean update(User user);

	User findUserName(String userName);

	List<User> findByKeywords(String keywords);

}
