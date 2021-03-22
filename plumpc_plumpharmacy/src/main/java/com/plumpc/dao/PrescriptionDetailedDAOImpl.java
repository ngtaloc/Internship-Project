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
import com.plumpc.entity.PrescriptionDetailed;
import com.plumpc.utils.HibernateUtils;
@Service
@Transactional
public class PrescriptionDetailedDAOImpl implements PrescriptionDetailedDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private DrugDAO drugDAO;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<PrescriptionDetailed> findAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql ="FROM PrescriptionDetailed";
		//Session session = factory.getCurrentSession();
		TypedQuery<PrescriptionDetailed> query = session.createQuery(hql, PrescriptionDetailed.class);
		List<PrescriptionDetailed> list = query.getResultList();
		return list;
	}

	@Override
	public PrescriptionDetailed findById(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//Session session = factory.getCurrentSession();
		PrescriptionDetailed entity = session.find(PrescriptionDetailed.class, id);
		return entity;
	}

	@Override
	public PrescriptionDetailed create(PrescriptionDetailed entity) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//Session session = factory.getCurrentSession();
		session.save(entity);
		tx.commit();
		return entity; 
	}

	@Override
	public PrescriptionDetailed delete(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//Session session = factory.getCurrentSession();
		PrescriptionDetailed entity = session.find(PrescriptionDetailed.class, id);
		session.delete(entity);
		tx.commit();
		return entity;
	}

	@Override
	public boolean update(PrescriptionDetailed entity) {
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
	
	
	

}
