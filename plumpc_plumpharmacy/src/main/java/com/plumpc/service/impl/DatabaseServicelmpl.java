package com.plumpc.service.impl;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.plumpc.service.DatabaseService;


@Service
public class DatabaseServicelmpl implements DatabaseService {
	@Override
	public Connection getConnct(){
        Connection connection = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=quan_ly_cua_hang_thuoc;user=sa;password=sa;useUnicode=true;characterEncoding=UTF-8");
            System.out.println("Kết nối thành công!");
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Kết nối thất bại!"+e.getMessage());
        }
        return connection;
    }

}
