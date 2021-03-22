package com.plumpc.dao;
import java.util.List;

import com.plumpc.entity.PrescriptionDetailed;
import com.plumpc.entity.PrescriptionRetail;


public interface PrescriptionRetailDAO {
	List<PrescriptionRetail> findAll();
	PrescriptionRetail findById(String id);
	PrescriptionRetail create(PrescriptionRetail prescriptionretail);
	PrescriptionRetail delete(String id);
	boolean update(PrescriptionRetail prescriptionretail);
	List<PrescriptionRetail> findByIdInvoice(String idInvoice);
	List<PrescriptionDetailed> getAllDetailedByInvoiceId(String idInvoice);
	
}
