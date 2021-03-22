package com.plumpc.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plumpc.entity.CountingUnits;
import com.plumpc.utils.HibernateUtils;
@Service
@Transactional
public class CountingUnitsDAOImpl implements CountingUnitsDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<CountingUnits> findAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM CountingUnits";
		TypedQuery<CountingUnits> query = session.createQuery(hql,CountingUnits.class);
		List<CountingUnits> list = query.getResultList();
		return list;
	}

	@Override
	public CountingUnits findById(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		CountingUnits countingUnits = session.find(CountingUnits.class, id);
		return countingUnits;
	}

	@Override
	public CountingUnits create(CountingUnits countingUnits) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(countingUnits);
		tx.commit();
		return countingUnits;
	}

	@Override
	public CountingUnits delete(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		CountingUnits countingUnits = session.find(CountingUnits.class, id);
		session.delete(countingUnits);
		tx.commit();
		return countingUnits;
	}

	@Override
	public boolean update(CountingUnits countingUnits) {
		try {
			Session session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			session.update(countingUnits);
			tx.commit();
		} catch (Exception e) {
			return false;
		}
		
		return true;
	}

}
