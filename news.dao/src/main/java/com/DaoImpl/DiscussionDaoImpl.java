package com.DaoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.DiscussionDao;
import com.entiy.Discussion;


/**    
 * @author zk  
 * @date 2018年8月2日  
 */
public class DiscussionDaoImpl extends DBUtils implements DiscussionDao {

	ResultSet rs = null;
	public List<Discussion> getDis(String sql, Object[] param) {
		List<Discussion> list = new ArrayList<Discussion>();
		rs = super.executeQuerySQL(sql, param);
		try {
			while(rs.next()){
				Discussion d = new Discussion();
				
				d.setId(rs.getInt("id"));
				
				d.setNewsId(rs.getInt("newsId"));
				d.setName(rs.getString("name"));
				d.setIp(rs.getString("ip"));
				d.setTime(rs.getString("time"));
				d.setContent(rs.getString("content"));
				list.add(d);
			}
		}catch (Exception e) {
			// TODO 锟皆讹拷锟斤拷傻锟�catch 锟斤拷
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return list;
	}

	public int countSomeDis(int newsId) {
		int i = 0;
		String sql = "select count(id) count from discussion where newsId=?";
		Object[] param ={newsId};
		rs = super.executeQuerySQL(sql, param);
		try {
			while(rs.next()){
				i = rs.getInt("count");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public int deldis(int newsId) {
		String Dsql = "delete from discussion where newsId=?";
  		Object[] Dparam = {newsId};
  		int i = super.executeSQL(Dsql, Dparam);
		return i;
	}

	public int delAnyDis(int id) {
		String sql = "delete from discussion where id=?";
		Object[] param ={id};
		int i = super.executeSQL(sql, param);
		return i;
	}

	public List<Discussion> getSomeDis(int nid) {
		String sql = "select * from discussion where newsId=?";
		Object[] param = {nid};
		List<Discussion> list = this.getDis(sql, param);
		return list;
	}

	public int addDis(Discussion dis) {
		int num = 0;
		String sql = "insert into discussion(newsId,name,ip,time,content) values(?,?,?,now(),?)";
		Object[] param = {dis.getNewsId(),//
				dis.getName(),
				dis.getIp(),
				dis.getContent()};
		num = super.executeSQL(sql, param);
		return num;
	}

}
