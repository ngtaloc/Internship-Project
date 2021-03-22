package com.plumpc.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plumpc.entity.Decentralization;
import com.plumpc.entity.User;
import com.plumpc.utils.HibernateUtils;
@Service
@Transactional
public class DecentralizationDAOImpl implements DecentralizationDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Decentralization> findAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM Decentralization";
		TypedQuery<Decentralization> query = session.createQuery(hql, Decentralization.class);
		List<Decentralization> list = query.getResultList();
		return list;
	}

	@Override
	public Decentralization findById(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Decentralization decentralization = session.find(Decentralization.class, id);
		return decentralization;
	}

	@Override
	public Decentralization create(Decentralization decentralization) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(decentralization);
		tx.commit();
		return decentralization;
	}

	@Override
	public Decentralization delete(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Decentralization decentralization = session.find(Decentralization.class, id);
		session.delete(decentralization);
		tx.commit();
		return decentralization;
	}

	@Override
	public boolean update(Decentralization decentralization) {
		try {
			Session session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			session.update(decentralization);
			tx.commit();
		} catch (Exception e) {
			return false;
		}

		return true;
	}
	
	@Override
	public List<Decentralization> findByKeywords(String keywords) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM Decentralization d WHERE d.name LIKE:kw ";
		TypedQuery<Decentralization> query = session.createQuery(hql, Decentralization.class);
		query.setParameter("kw", "%"+keywords+"%");
		List<Decentralization> list = query.getResultList();
		return list;
	}

}
