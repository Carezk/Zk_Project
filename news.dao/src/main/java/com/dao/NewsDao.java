package com.dao;

import java.util.List;

import com.entiy.News;


/**    
 * @author zk  
 * @date 2018年8月2日  
 */
public interface NewsDao {
	/**
	 * 新闻基本方法
	 */
	public abstract List<News> getNews(String sql,Object[] param); 
	/**
	 * 获取新闻条数
	 */
	public int countNews();
	/**
	 * 根据主题id查询新闻条数
	 */
	public int countSomeNews(int themeId);
	/**
	 * 根据主题id获取新闻
	 */
	public List<News> getAnyNews(int tid); 	
	/**
	 * 获取所有新闻
	 */
	public List<News> getAllnews(); 
	/**
	 * 根据主题id和查询条件获取新闻
	 */
	public List<News> getAnyNews(int tid,String str);		
	/**
	 * 跟查询条件获取新闻
	 */
	public List<News> getAnyNews(String str);
	/**
	 * 获取一条新闻
	 */
	public News getOne(int nid);	
	/**
	 * 添加新闻
	 * @param news
	 * @return
	 */
	public int addNews(News news);		
	/**
	 * 获取推送新闻
	 */
	public List<News> getHot();	
	/**
	 * 推送新闻方法
	 */
	public int toFront(News n,int nid);	
}
