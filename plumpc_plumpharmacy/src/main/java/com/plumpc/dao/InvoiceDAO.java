package com.plumpc.dao;

import java.util.List;


import com.plumpc.entity.Invoice;

public interface InvoiceDAO {
	List<Invoice> findAll();
	Invoice findById(String id);
	Invoice create(Invoice invoice);
	Invoice delete(String id);
	boolean update(Invoice invoice);
	List<Invoice> findtime(long form,long to);
	List<Invoice> findByKeywords(String keywords);

}
