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
import com.plumpc.entity.InvoiceClassification;
import com.plumpc.utils.HibernateUtils;
@Service
@Transactional
public class InvoiceClassificationDAOImpl implements InvoiceClassificationDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<InvoiceClassification> findAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql ="FROM InvoiceClassification";
	
		TypedQuery<InvoiceClassification> query = session.createQuery(hql, InvoiceClassification.class);
		List<InvoiceClassification> list = query.getResultList();
		return list;
	}

	@Override
	public InvoiceClassification findById(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		
		InvoiceClassification entity = session.find(InvoiceClassification.class, id);
		return entity;
	}

	@Override
	public InvoiceClassification create(InvoiceClassification invoiceClassification) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(invoiceClassification);
		tx.commit();
		return invoiceClassification; 
	}

	@Override
	public InvoiceClassification delete(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		InvoiceClassification entity = session.find(InvoiceClassification.class, id);
		session.delete(entity);
		tx.commit();
		return entity;
	}

	@Override
	public boolean update(InvoiceClassification invoiceClassification) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(invoiceClassification);
			tx.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		
		return true;
	}
	
	@Override
	public List<InvoiceClassification> findByKeywords(String keywords) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM InvoiceClassification i WHERE i.Name LIKE:kw ";
		TypedQuery<InvoiceClassification> query = session.createQuery(hql, InvoiceClassification.class);
		query.setParameter("kw", "%"+keywords+"%");
		List<InvoiceClassification> list = query.getResultList();
		return list;
	}

}
