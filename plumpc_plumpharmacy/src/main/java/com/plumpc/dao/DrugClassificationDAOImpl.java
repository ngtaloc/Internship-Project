package com.plumpc.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plumpc.entity.DrugClassification;

@Service
@Transactional
public class DrugClassificationDAOImpl implements DrugClassificationDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<DrugClassification> findAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM DrugClassification";
		TypedQuery<DrugClassification> query = session.createQuery(hql, DrugClassification.class);
		List<DrugClassification> list = query.getResultList();	
		return list;
	}

	@Override
	public DrugClassification findById(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		DrugClassification drugClassification = session.find(DrugClassification.class, id);
		
		return drugClassification;
	}

	@Override
	public DrugClassification create(DrugClassification drugClassification) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(drugClassification);
		tx.commit();
		
		return drugClassification;
	}

	@Override
	public DrugClassification delete(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		DrugClassification drugClassification = session.find(DrugClassification.class, id);
		session.delete(drugClassification);
		tx.commit();
	
		return drugClassification;
	}

	@Override
	public boolean update(DrugClassification drugClassification) {
		try {
			Session session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			session.update(drugClassification);
			tx.commit();
			
		} catch (Exception e) {
			return false;
		}

		return true;
	}

}
