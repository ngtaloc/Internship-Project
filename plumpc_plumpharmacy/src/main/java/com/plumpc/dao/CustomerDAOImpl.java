package com.plumpc.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plumpc.entity.Customer;
import com.plumpc.entity.Drug;
import com.plumpc.utils.HibernateUtils;
@Service
@Transactional
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Customer> findAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM Customer";
		TypedQuery<Customer> query = session.createQuery(hql, Customer.class);
		List<Customer> list = query.getResultList();
		return list;
	}

	@Override
	public Customer findById(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Customer customer = session.find(Customer.class, id);
		return customer;
	}

	@Override
	public Customer create(Customer customer) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(customer);
		tx.commit();
		return customer;
	}

	@Override
	public Customer delete(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Customer customer = session.find(Customer.class, id);
		session.delete(customer);
		tx.commit();
		return customer;
	}

	@Override
	public boolean update(Customer customer) {
		try {
			Session session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			session.update(customer);
			tx.commit();
		} catch (Exception e) {
			return false;
		}

		return true;
	}
	
	@Override
	public List<Customer> findByKeywords(String keywords) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM Customer d WHERE d.name LIKE:kw OR d.phone LIKE:kw OR d.address LIKE:kw";
		TypedQuery<Customer> query = session.createQuery(hql, Customer.class);
		query.setParameter("kw", "%"+keywords+"%");
		List<Customer> list = query.getResultList();
		return list;
	}
	

}
