package com.DaoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.NewsDao;
import com.entiy.News;

/**    
 * @author zk  
 * @date 2018年8月2日  
 */
public class NewsDaoImpl extends DBUtils implements NewsDao{

	ResultSet rs = null;
	/**
	 * 获取基本新闻方法
	 * @param sql
	 * @param param
	 * @return
	 */
	public List<News> getNews(String sql,Object[] param){
		List<News> list = new ArrayList<News>();
		rs = super.executeQuerySQL(sql, param);
		try {
			while(rs.next()){
				News n = new News();
				n.setId(rs.getInt("id"));					//新闻id
				n.setThemeId(rs.getInt("themeId"));			//主题id
				n.setTheme(rs.getString("theme"));			//主题名称
				n.setTitle(rs.getString("title"));			//新闻标题
				n.setAuthor(rs.getString("author"));		//新闻作者
				n.setDigest(rs.getString("digest"));		//新闻摘要
				n.setArticle(rs.getString("article"));		//文章内容
				n.setDate(rs.getString("date"));			//时间
				n.setPhotoName(rs.getString("photoName"));	//图片地址	
				n.setToFront(rs.getString("toFront"));		//控制字段
				list.add(n);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return list;
	}
	
	/**
	 * 获取新闻条数
	 */
	public int countNews() {
		int i = 0;
		String sql = "select count(id) count from news";
		rs = super.executeQuerySQL(sql, null);
		try {
			while(rs.next()){
				i = rs.getInt("count");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	/**
	 * 根据主题id获取新闻条数
	 */
	public int countSomeNews(int themeId) {
		int i = 0;
		String sql = "select count(id) count from news where themeId=?";
		Object[] param ={themeId};
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
	
	/**
	 * 删除新闻方法
	 */
	public int delnews(int newsId){
		String sql = "delete from news where id=?";
  		Object[] param = {newsId};
  		int i = super.executeSQL(sql, param);
		return i;
	}
	
	/**
	 * 模糊查询方法带主题id
	 */
	public List<News> getAnyNews(int tid, String str) {
		List<News> list = new ArrayList<News>();
		String sql = "select * from news where themeId = ? and title like ?";
		Object[] param = {tid,"%"+str+"%"};
		list = this.getNews(sql, param);
		return list;
	}
	
	/**
	 * 模糊查询方法
	 */
	public List<News> getAnyNews(String str) {
		String sql = "select * from news where title like ?";
		Object[] param = {"%"+str+"%"};
		List<News> list = this.getNews(sql, param);
		return list;
	}

	/**
	 * 根据主题id获取新闻
	 */
	public List<News> getAnyNews(int tid) {
		String sql = "select * from news where themeId=?";
		Object[] param = {tid};
		List<News> list = this.getNews(sql, param);
		return list;
	}

	/**
	 * 查询所有新闻
	 */
	public List<News> getAllnews() {
		String sql = "select * from news";
		List<News> list = this.getNews(sql, null);
		return list;
	}
	
	/**
	 * 获取一条新闻
	 */
	public News getOne(int nid) {
		News n = new News();
		String sql = "select * from news where id=?";
		Object[] param = {nid};
		rs = super.executeQuerySQL(sql, param);
		try {
			while(rs.next()){
				n.setId(rs.getInt("id"));
				n.setThemeId(rs.getInt("themeId"));
				n.setTheme(rs.getString("theme"));
				n.setTitle(rs.getString("title"));
				n.setAuthor(rs.getString("author"));
				n.setDigest(rs.getString("digest"));
				n.setArticle(rs.getString("article"));
				n.setDate(rs.getString("date"));
				n.setPhotoName(rs.getString("photoName"));
				n.setToFront(rs.getString("toFront"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			super.closeAll();
		}
		return n;
	}

	/**
	 * 添加新闻
	 */
	public int addNews(News news) {
		int num = 0;
		String sql = "insert into news(theme,themeId,title,author,digest,article,date,photoName) values(?,?,?,?,?,?,now(),?)";
		Object[] param = {news.getTheme(),news.getThemeId(),news.getTitle(),news.getAuthor(),news.getDigest(),news.getArticle(),news.getPhotoName()};
		num = super.executeSQL(sql, param);
		return num;
	}
	
	/**
	 * 修改新闻
	 */
	public int updateNews(News n,int nid){
		int num = 0;
		String sql = "update news set theme=?,themeId=?,title=?,author=?,digest=?,article=?,photoName=? where id=?";
		Object[] param = {n.getTheme(),n.getThemeId(),n.getTitle(),n.getAuthor(),n.getDigest(),n.getArticle(),n.getPhotoName(),nid};
		num = super.executeSQL(sql, param);
		return num;
	}
	
	/**
	 * 查询推送新闻
	 */
	public List<News> getHot(){
		List<News> list = new ArrayList<News>();
		String sql = "select * from news where toFront='1' order by rand() limit 4";
		list = this.getNews(sql, null);
		return list;
	}

	/**
	 * 修改新闻控制
	 */
	public int toFront(News n,int nid) {
		int num = 0;
		String sql = "update news set toFront=? where id=?";
		Object[] param = {n.getToFront(),nid};
		num = super.executeSQL(sql, param);
		return num;
	}

}
