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
import com.plumpc.entity.Invoice;
import com.plumpc.utils.HibernateUtils;
@Service
@Transactional
public class InvoiceDAOImpl implements InvoiceDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Invoice> findAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql ="FROM Invoice";
		//Session session = factory.getCurrentSession();
		TypedQuery<Invoice> query = session.createQuery(hql, Invoice.class);
		List<Invoice> list = query.getResultList();
		return list;
	}

	@Override
	public Invoice findById(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//Session session = factory.getCurrentSession();
		Invoice entity = session.find(Invoice.class, id);
		return entity;
	}

	@Override
	public Invoice create(Invoice entity) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//Session session = factory.getCurrentSession();
		session.save(entity);
		tx.commit();
		return entity; 
	}

	@Override
	public Invoice delete(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//Session session = factory.getCurrentSession();
		Invoice entity = session.find(Invoice.class, id);
		session.delete(entity);
		tx.commit();
		return entity;
	}

	@Override
	public boolean update(Invoice entity) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//Session session = factory.getCurrentSession();
		try {
			session.update(entity);
			tx.commit();
		} catch (Exception e) {
			return false;
		}
		
		return true;
	}
	

	
	@Override
	public List<Invoice> findtime(long form,long to) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql ;
		if(form>to) {
			hql="FROM Invoice i WHERE i.initializationTime BETWEEN "+to+" AND "+form;
		}else {
			hql="FROM Invoice i WHERE i.initializationTime BETWEEN "+form+" AND "+to;
		}
		//Session session = factory.getCurrentSession();
		TypedQuery<Invoice> query = session.createQuery(hql, Invoice.class);
		List<Invoice> list = query.getResultList();
		return list;
		}

	@Override
	public List<Invoice> findByKeywords(String keywords) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM Invoice d WHERE d.user LIKE:kw OR d.note LIKE:kw OR d.customerId LIKE:kw OR d.invoiceClassification LIKE:kw OR d.initializationTime LIKE:kw ";
		TypedQuery<Invoice> query = session.createQuery(hql, Invoice.class);
		query.setParameter("kw", "%"+keywords+"%");
		List<Invoice> list = query.getResultList();
		return list;
	}


}
