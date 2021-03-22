package com.plumpc.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plumpc.entity.PrescriptionWholesale;
import com.plumpc.utils.HibernateUtils;
@Service
@Transactional
public class PrescriptionWholesaleDAOimpl implements PrescriptionWholesaleDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<PrescriptionWholesale> findAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM PrescriptionWholesale";
		TypedQuery<PrescriptionWholesale> query = session.createQuery(hql, PrescriptionWholesale.class);
		List<PrescriptionWholesale> list = query.getResultList();
		return list;
	}

	@Override
	public PrescriptionWholesale findById(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		PrescriptionWholesale PrescriptionWholesale = session.find(PrescriptionWholesale.class, id);
		tx.commit();
		return PrescriptionWholesale;
	}

	@Override
	public PrescriptionWholesale create(PrescriptionWholesale prescriptionWholesale) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(prescriptionWholesale);
		tx.commit();
		return prescriptionWholesale;
	}

	@Override
	public PrescriptionWholesale delete(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		PrescriptionWholesale prescriptionWholesale = session.find(PrescriptionWholesale.class, id);
		session.delete(prescriptionWholesale);
		return prescriptionWholesale;
	}

	@Override
	public boolean update(PrescriptionWholesale prescriptionWholesale) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(prescriptionWholesale);
			tx.commit();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
}
