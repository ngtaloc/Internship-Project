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
import com.plumpc.entity.PrescriptionByPharmacy;
import com.plumpc.utils.HibernateUtils;
@Service
@Transactional
public class PrescriptionByPharmacyDAOImpl implements PrescriptionByPharmacyDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<PrescriptionByPharmacy> findAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql ="FROM PrescriptionByPharmacy";
		//Session session = factory.getCurrentSession();
		TypedQuery<PrescriptionByPharmacy> query = session.createQuery(hql, PrescriptionByPharmacy.class);
		List<PrescriptionByPharmacy> list = query.getResultList();
		return list;
	}

	@Override
	public PrescriptionByPharmacy findById(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//Session session = factory.getCurrentSession();
		PrescriptionByPharmacy entity = session.find(PrescriptionByPharmacy.class, id);
		return entity;
	}

	@Override
	public PrescriptionByPharmacy create(PrescriptionByPharmacy entity) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//Session session = factory.getCurrentSession();
		session.save(entity);
		tx.commit();
		return entity; 
	}

	@Override
	public PrescriptionByPharmacy delete(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//Session session = factory.getCurrentSession();
		PrescriptionByPharmacy entity = session.find(PrescriptionByPharmacy.class, id);
		session.delete(entity);
		tx.commit();
		return entity;
	}

	@Override
	public boolean update(PrescriptionByPharmacy entity) {
		//Session session = factory.getCurrentSession();
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(entity);
			tx.commit();
		} catch (Exception e) {
			return false;
		}
		
		return true;
	}
	
	
	@Override
	public List<PrescriptionByPharmacy> findByKeywords(String keywords) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM PrescriptionByPharmacy d WHERE d.Name LIKE:kw OR d.patientId LIKE:kw OR d.symptom LIKE:kw";
		TypedQuery<PrescriptionByPharmacy> query = session.createQuery(hql, PrescriptionByPharmacy.class);
		query.setParameter("kw", "%"+keywords+"%");
		List<PrescriptionByPharmacy> list = query.getResultList();
		return list;
	}


}
