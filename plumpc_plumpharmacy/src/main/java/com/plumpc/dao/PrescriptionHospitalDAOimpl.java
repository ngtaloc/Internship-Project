package com.plumpc.dao;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.plumpc.entity.PrescriptionHospital;
import com.plumpc.utils.HibernateUtils;
@Service
@Transactional
public class PrescriptionHospitalDAOimpl implements PrescriptionHospitalDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<PrescriptionHospital> findAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM PrescriptionHospital";
		TypedQuery<PrescriptionHospital> query = session.createQuery(hql, PrescriptionHospital.class);
		List<PrescriptionHospital> list = query.getResultList();
		return list;
	}

	@Override
	public PrescriptionHospital findById(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		PrescriptionHospital prescriptionHospital = session.find(PrescriptionHospital.class, id);
		return prescriptionHospital;
	}

	@Override
	public PrescriptionHospital create(PrescriptionHospital prescriptionHospital) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(prescriptionHospital);
		tx.commit();
		return prescriptionHospital;
	}

	@Override
	public PrescriptionHospital delete(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		PrescriptionHospital prescriptionHospital = session.find(PrescriptionHospital.class, id);
		session.delete(prescriptionHospital);
		tx.commit();
		return prescriptionHospital;
	}

	@Override
	public boolean update(PrescriptionHospital prescriptionHospital) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(prescriptionHospital);
			tx.commit();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
}

