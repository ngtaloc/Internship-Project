package com.plumpc.dao;

import java.util.ArrayList;
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
import com.plumpc.entity.PrescriptionRetail;
import com.plumpc.utils.HibernateUtils;
@Service
@Transactional
public class PrescriptionRetailDAOimpl implements PrescriptionRetailDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	PrescriptionDetailedDAO prescriptionDetailedDAO;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<PrescriptionRetail> findAll() {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM PrescriptionRetail";
		TypedQuery<PrescriptionRetail> query = session.createQuery(hql, PrescriptionRetail.class);
		List<PrescriptionRetail> list = query.getResultList();
		return list;
	}

	@Override
	public PrescriptionRetail findById(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		PrescriptionRetail PrescriptionRetail = session.find(PrescriptionRetail.class, id);
		return PrescriptionRetail;
	}

	@Override
	public PrescriptionRetail create(PrescriptionRetail prescriptionRetail) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(prescriptionRetail);
		tx.commit();
		return prescriptionRetail;
	}

	@Override
	public PrescriptionRetail delete(String id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		PrescriptionRetail prescriptionRetail = session.find(PrescriptionRetail.class, id);
		session.delete(prescriptionRetail);
		tx.commit();
		return prescriptionRetail;
	}

	@Override
	public boolean update(PrescriptionRetail prescriptionRetail) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(prescriptionRetail);
			tx.commit();
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	@Override
	public List<PrescriptionRetail> findByIdInvoice(String idInvoice) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "FROM PrescriptionRetail d WHERE d.invoiceId LIKE:kw ";
		TypedQuery<PrescriptionRetail> query = session.createQuery(hql, PrescriptionRetail.class);
		query.setParameter("kw", idInvoice);
		List<PrescriptionRetail> list = query.getResultList();
		return list;
	}
	
	@Override
	public List<PrescriptionDetailed> getAllDetailedByInvoiceId(String idInvoice) {
		List<PrescriptionDetailed> list=new ArrayList<PrescriptionDetailed>();
		
		for(PrescriptionRetail p : findByIdInvoice(idInvoice)) {
			list.add(prescriptionDetailedDAO.findById(p.getId()));
		}
		
		return list;
	}

	

}
