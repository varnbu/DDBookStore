package com.ddbook.dao;

import java.sql.*;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.ddbook.util.DBConnection;

public class BaseDao{
	private  Connection conn;
	public Connection getConnection(){
		  conn = DBConnection.getConncetions();
	        return conn;
	}
	
	/**
     * 查找多个对象
     * @param sqlString
     * @param clazz
     * @return
     */
	public boolean batchUpdate(String sql,Object[][] params){
		Connection conn = getConnection();
		QueryRunner qRunner = new QueryRunner();
		int result = 0;
		boolean flag = false;
		try {
			result = qRunner.batch(conn, sql, params).length;
			if(result > 0){
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

    public List query(String sqlString, Class clazz) {
        List beans = null;
        Connection conn = null;
        try {
            conn = getConnection();
            QueryRunner qRunner = new QueryRunner();
            beans =
                (List) qRunner.query(
                    conn,
                    sqlString,
                    new BeanListHandler(clazz));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return beans;
    }
 
    /**
     * 查找对象
     * @param sqlString
     * @param clazz
     * @return
     */
    public Object get(String sqlString, Class clazz) {
        List beans = null;
        Object obj = null;
        Connection conn = null;
        try {
            conn = getConnection();
            QueryRunner qRunner = new QueryRunner();
            beans =
                (List) qRunner.query(
                    conn,
                    sqlString,
                    new BeanListHandler(clazz));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        if(beans!=null && !beans.isEmpty()){ //注意这里
             obj=beans.get(0);
        }
        return obj;
    }
 
    /**
     * 执行更新的sql语句,插入,修改,删除
     * @param sqlString
     * @return
     */
    public boolean update(String sqlString,Object[] params) {
        Connection conn = null;
        boolean flag = false;
        try {
            conn = getConnection();
            QueryRunner qRunner = new QueryRunner();
            int i = qRunner.update(conn,sqlString,params);
            if (i > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
        }
        return flag;
    }


}
