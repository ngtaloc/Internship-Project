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
import com.plumpc.entity.Supplier;
import com.plumpc.utils.HibernateUtils;
@Service
@Transactional
public class SupplierDAOimpl implements SupplierDAO{
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<Supplier> findAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM Supplier";
		TypedQuery<Supplier> query = session.createQuery(hql, Supplier.class);
		List<Supplier> list = query.getResultList();
		return list;
	}

	@Override
	public Supplier findById(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Supplier supplier = session.find(Supplier.class, id);
		return supplier;
	}

	@Override
	public Supplier create(Supplier supplier) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(supplier);
		tx.commit();
		return supplier;
	}

	@Override
	public Supplier delete(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Supplier supplier = session.find(Supplier.class, id);
		session.delete(supplier);
		tx.commit();
		return supplier;
	}

	@Override
	public boolean update(Supplier supplier) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(supplier);
			tx.commit();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	@Override
	public List<Supplier> findByKeywords(String keywords) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM Supplier d WHERE d.phone LIKE:kw OR d.name LIKE:kw";
		TypedQuery<Supplier> query = session.createQuery(hql, Supplier.class);
		query.setParameter("kw", "%"+keywords+"%");
		List<Supplier> list = query.getResultList();
		return list;
	}
	
}
