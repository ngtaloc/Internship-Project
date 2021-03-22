package com.plumpc.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plumpc.entity.Drug;
import com.plumpc.entity.User;
import com.plumpc.utils.HibernateUtils;
@Service
@Transactional
public class UserDAOimpl implements UserDAO{
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<User> findAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM User";
		TypedQuery<User> query = session.createQuery(hql, User.class);
		List<User> list = query.getResultList();
		return list;
	}

	@Override
	public User findById(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		User user = session.find(User.class, id);
		return user;
	}

	@Override
	public User create(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(user);
		return user;
	}

	@Override
	public User delete(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		User user = session.find(User.class, id);
		session.delete(user);
		return user;
	}

	@Override
	public boolean update(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(user);
			tx.commit();
		} catch (Exception e) {
			return false;
		}
		return true;
	}


	@Override
	public User loadUserByUsername(final String userName) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		User user = session.find(User.class, userName);
		return user;
	}
	
	@Override
	public User findUserName(String userName) {
		System.out.println("Find username: " + userName);
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM User d WHERE d.userName LIKE:kw ";
		TypedQuery<User> query = session.createQuery(hql, User.class);
		query.setParameter("kw", userName);
		List<User> list = query.getResultList();
		if (list.isEmpty()) {
			return null;
		};
		return list.get(0);
	}
	
	@Override
	public List<User> findByKeywords(String keywords) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM User d WHERE d.name LIKE:kw OR d.phone LIKE:kw OR d.decentralization LIKE:kw OR d.userName LIKE:kw OR d.note LIKE:kw OR d.address LIKE:kw";
		TypedQuery<User> query = session.createQuery(hql, User.class);
		query.setParameter("kw", "%"+keywords+"%");
		List<User> list = query.getResultList();
		return list;

	}
}
