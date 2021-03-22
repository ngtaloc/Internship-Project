package com.plumpc.dao;

import java.util.List;

import com.plumpc.entity.InvoiceClassification;

public interface InvoiceClassificationDAO {
	List<InvoiceClassification> findAll();
	InvoiceClassification findById(String id);
	InvoiceClassification create(InvoiceClassification invoiceClassification);
	InvoiceClassification delete(String id);
	boolean update(InvoiceClassification invoiceClassification);
	List<InvoiceClassification> findByKeywords(String keywords );
}
