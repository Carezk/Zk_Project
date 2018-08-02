package com.DaoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.ThemeDao;
import com.entiy.Theme;

/**    
 * @author zk  
 * @date 2018年8月2日  
 */
public class ThemeDaoImpl extends DBUtils implements ThemeDao{

	ResultSet rs = null;
	/**
	 * 查询主题
	 */
	public List<Theme> getTheme(String sql,Object[] param){
		List<Theme> list = new ArrayList<Theme>();
		rs = super.executeQuerySQL(sql, param);
		try {
			while(rs.next()){
				Theme t = new Theme();
				t.setId(rs.getInt("id"));
				t.setName(rs.getString("name"));
				list.add(t);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return list;
	}
	
	
	/**
	 * 取得所有主题
	 */
	public List<Theme> getAlltheme() {
		String sql = "select * from theme";
		List<Theme> list = this.getTheme(sql, null);
		return list;
	}

	/**
	 * 取得一个主题
	 */
	public List<Theme> getAnytheme(int tid) {
		String sql = "select * from theme where id=?";
		Object[] param = {tid};
		List<Theme> list = this.getTheme(sql, param);
		return list;
	}
	
	/**
	 * 取得主题名
	 */
	public String getThemeName(int tid){
		String name = "";
		String sql = "select name from theme where id=?";
		Object[] selectparam = {tid};
		rs = super.executeQuerySQL(sql, selectparam);
		try {
			while(rs.next()){
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			// TODO 锟皆讹拷锟斤拷傻锟�catch 锟斤拷
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return name;
	}

	/**
	 * 根据name查找主题
	 */
	public boolean themeName(String tname) {
		boolean reg = false;
		String sql = "select * from theme where name=?";
		Object[] param = {tname};
		rs = super.executeQuerySQL(sql, param);
		try {
			while(rs.next()){
				reg = true;
			}
		} catch (SQLException e) {
			// TODO 锟皆讹拷锟斤拷傻锟�catch 锟斤拷
			e.printStackTrace();
		} finally{
			super.closeAll();
		}
		return reg;
	}

	/**
	 * 添加主题
	 */
	public int addTheme(Theme t) {
		int num = 0;
		String sql = "insert into theme(name) values(?)";
		Object[] param = {t.getName()};
		num = super.executeSQL(sql, param);
		return num;
	}


	/**
	 * 删除主题
	 */
	public int delTheme(int tid) {
		int num = 0;
		String sql = "delete from theme where id=?";
		Object[] param = {tid};
		num = super.executeSQL(sql, param);
		return num;
	}


	/**
	 * 更新主题
	 */
	public int updateTheme(Theme t) {
		int num = 0;
		String sql = "update theme set name=? where id=?";
		Object[] param = {t.getName(),t.getId()};
		num = super.executeSQL(sql, param);
		return num;
	}

}
