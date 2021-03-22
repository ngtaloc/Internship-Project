package com.plumpc.utils;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;


public class HibernateUtils {
	public static SessionFactory getSessionFactory() {
		try {
			
			Configuration configuration = new Configuration();
			configuration.configure("META-INF/hibernate.cfg.xml");
			
			return configuration.buildSessionFactory();
		} catch (Exception e) {
			System.out.println("Loi hibernate");
			e.printStackTrace();
		}
		return null;
	}
	//META-INF/hibernate.cfg.xml
}
