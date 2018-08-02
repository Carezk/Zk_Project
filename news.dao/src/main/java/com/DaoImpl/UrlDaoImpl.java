package com.DaoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.UrlDao;
import com.entiy.Url;

/**    
 * @author zk  
 * @date 2018年8月2日  
 */
public class UrlDaoImpl extends DBUtils implements UrlDao {

	ResultSet rs = null;
	/**
	 * 获得URL基本方法
	 */
	public List<Url> getUrl(String sql,Object[] param) {
		List<Url> list = new ArrayList<Url>();
		rs = super.executeQuerySQL(sql, param);
		try {
			while(rs.next()){
				Url u = new Url();
				u.setId(rs.getInt("id"));			//id		
				u.setName(rs.getString("name"));	//url名称	
				u.setUrl(rs.getString("url"));		//url地址
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
	 *	获得所有URL
	 */
	public List<Url> getAll() {
		String sql = "select * from url";
		List<Url> list = this.getUrl(sql, null);
		return list;
	}

}
