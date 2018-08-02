package com.DaoImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entiy.BaseDao;

/**
 * @author zk
 * @date 2018年8月2日
 */
public class DBUtils implements BaseDao {

	private Connection connection = null;
	private PreparedStatement pstm = null;
	private ResultSet rs = null;

	private final static String DRIVER = "com.mysql.jdbc.Driver";
	private final static String URL = "jdbc:mysql://localhost:3306/qqq?characterEncoding=utf8";
	private final static String user = "root";
	private final static String password = "1234";

	public Connection getConnection() {
		try {
			Class.forName(DRIVER);
			connection = DriverManager.getConnection(URL, user, password);
			//System.out.println("连接数据库成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	public void closeAll() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstm != null) {
			try {
				pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public ResultSet executeQuerySQL(String preparedSql, Object[] param) {
		connection = getConnection();
		try {
			pstm = connection.prepareStatement(preparedSql);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					pstm.setObject(i + 1, param[i]); // 为预编译sql设置参数
				}
			}
			rs = pstm.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}// 执行SQL语句
		return rs;
	}

	public int executeSQL(String preparedSql, Object[] param) {
		int num = 0;
		/* 处理SQL,执行SQL */
		try {
			connection = getConnection(); // 得到数据库连接
			pstm = connection.prepareStatement(preparedSql); // 得到PreparedStatement对象
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					pstm.setObject(i + 1, param[i]); // 为预编译sql设置参数
				}
			}
			// System.out.println(preparedSql);
			num = pstm.executeUpdate(); // 执行SQL语句
		} catch (Exception e) {
			e.printStackTrace(); // 处理SQLException异常
		} finally {
			this.closeAll();
		}
		return num;
	}
}
