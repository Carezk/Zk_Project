package com.DaoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.UserDao;
import com.entiy.User;

/**    
 * @author zk  
 * @date 2018年8月2日  
 */
public class UserDaoImpl extends DBUtils implements UserDao{

	ResultSet rs = null;
	/**
	 * 查询用户
	 */
	public List<User> getUsers(String sql, Object[] param) {
		List<User> list = new ArrayList<User>();
		rs = super.executeQuerySQL(sql, param);
		try {
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setRoot(rs.getString("root"));
				list.add(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			super.closeAll();
		}
		return list;
	}

	/**
	 * 验证用户名密码
	 */
	public boolean YesUser(String name, String password) {
		boolean reg = false;
		String sql = "select * from user where name=? and password = ?";
		Object[] param = {name,password};
		rs = super.executeQuerySQL(sql, param);
		try {
			while(rs.next())
			reg = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return reg;
	}

	/**
	 * 查询是够存在此用户
	 */
	public boolean isUser(String name) {
		boolean reg = false;
		String sql = "select * from user where name=?";
		Object[] param = {name};
		rs = super.executeQuerySQL(sql, param);
		try {
			while(rs.next()){
				reg = true;
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally{
			super.closeAll();
		}
		return reg;
	}

	/**
	 * 添加用户方法
	 */
	public int addUser(User u) {
		int num = 0;
		String sql = "insert into user(name,password) values(?,?)";
		Object[] param = {u.getName(),u.getPassword()};
		num = super.executeSQL(sql, param);
		return num;
	}

}
