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
import com.plumpc.entity.Patient;
import com.plumpc.utils.HibernateUtils;
@Service
@Transactional
public class PatientDAOImpl implements PatientDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	@Override
	public List<Patient> findAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql ="FROM Patient";
		//Session session = factory.getCurrentSession();
		TypedQuery<Patient> query = session.createQuery(hql, Patient.class);
		List<Patient> list = query.getResultList();
		return list;
	}

	@Override
	public Patient findById(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//Session session = factory.getCurrentSession();
		Patient entity = session.find(Patient.class, id);
		return entity;
	}

	@Override
	public Patient create(Patient entity) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//Session session = factory.getCurrentSession();
		session.save(entity);
		tx.commit();
		return entity; 
	}

	@Override
	public Patient delete(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//Session session = factory.getCurrentSession();
		Patient entity = session.find(Patient.class, id);
		session.delete(entity);
		tx.commit();
		return entity;
	}

	@Override
	public boolean update(Patient entity) {
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
	public List<Patient> findByKeywords(String keywords) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM Patient d WHERE d.Name LIKE:kw";
		TypedQuery<Patient> query = session.createQuery(hql, Patient.class);
		query.setParameter("kw", "%"+keywords+"%");
		List<Patient> list = query.getResultList();
		return list;
	}


}
