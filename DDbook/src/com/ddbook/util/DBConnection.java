package com.ddbook.util;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DBConnection {
	private static final ComboPooledDataSource ds;
	static{
		ds = new ComboPooledDataSource();
	}
	public static Connection getConncetions(){
		Connection conn=null;
		if(ds!=null){
			try {
				conn = ds.getConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}		
		}	
		return conn;
	}
	
	public static void main(String[] args){
		System.out.println(getConncetions());
		
	}
	
	
	
	
	
	
	
}
