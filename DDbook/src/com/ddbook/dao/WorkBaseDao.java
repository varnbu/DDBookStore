package com.ddbook.dao;

import java.sql.*;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

//   需要进行事务操作时继承这个类，不需要事务操作的用BaseDao
public class WorkBaseDao {
    private  Connection conn;
    public void setConn(Connection conn){
        this.conn = conn;
    }
    /**
     * 查找多个对象
     *
     * @param sqlString
     * @param clazz
     * @return
     */
    public List query(String sqlString, Class clazz) {
        List beans = null;
        try {
            QueryRunner qRunner = new QueryRunner();
            beans
                    = (List) qRunner.query(
                            conn,
                            sqlString,
                            new BeanListHandler(clazz));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            DbUtils.closeQuietly(conn);
        }
        return beans;
    }

    /**
     * 查找对象
     *
     * @param sqlString
     * @param clazz
     * @return
     */
    public Object get(String sqlString, Class clazz) {
        List beans = null;
        Object obj = null;
        try {
            QueryRunner qRunner = new QueryRunner();
            beans
                    = (List) qRunner.query(
                            conn,
                            sqlString,
                            new BeanListHandler(clazz));
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            DbUtils.closeQuietly(conn);
        }
        if (beans != null && !beans.isEmpty()) { //注意这里
            obj = beans.get(0);
        }
        return obj;
    }

    /**
     * 执行更新的sql语句,插入,修改,删除
     *
     * @param sqlString
     * @return
     */
    public boolean update(String sqlString, Object[] params) throws SQLException {
            boolean flag = false;
            QueryRunner qRunner = new QueryRunner();
            int i = qRunner.update(conn, sqlString, params);
            if (i > 0) {
                flag = true;
            }
         return flag;
    }
    public void closeConn(Connection conn){
        DbUtils.closeQuietly(conn);
    }
}
