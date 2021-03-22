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
import com.plumpc.utils.HibernateUtils;

@Service
@Transactional
public class DrugDAOImpl implements DrugDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Drug> findAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM Drug";
		TypedQuery<Drug> query = session.createQuery(hql, Drug.class);
		List<Drug> list = query.getResultList();
		return list;
	}

	@Override
	public Drug findById(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Drug drug = session.find(Drug.class, id);
		return drug;
	}

	@Override
	public Drug create(Drug drug) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(drug);
		tx.commit();
		return drug;
	}

	@Override
	public Drug delete(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Drug drug = session.find(Drug.class, id);
		session.delete(drug);
		tx.commit();
		return drug;
	}

	@Override
	public boolean update(Drug drug) {
		try {
			Session session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			session.update(drug);
			tx.commit();
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	@Override
	public List<Drug> findByKeywords(String keywords) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM Drug d WHERE d.name LIKE:kw OR d.note LIKE:kw";
		TypedQuery<Drug> query = session.createQuery(hql, Drug.class);
		query.setParameter("kw", "%"+keywords+"%");
		List<Drug> list = query.getResultList();
		return list;
	}
	

}
