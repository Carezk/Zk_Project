package com.DaoImpl;

import java.util.ArrayList;
import java.util.List;

import com.dao.PageSer;
import com.entiy.Discussion;
import com.entiy.News;
public class Service implements PageSer{
	
	NewsDaoImpl ndl = new NewsDaoImpl();
	DiscussionDaoImpl ddl = new DiscussionDaoImpl();
	
	public List<News> selectNews(int page_num,int page_news){
		List<News> list = new ArrayList<News>();
		String sql = "select * from news limit ?,?";
		Object[] param = {((page_num-1)*page_news),page_news};
		list = ndl.getNews(sql, param);
		return list;
	}
	
	
	public List<News> selectNews(int page_num,int page_news,int themeId){
		List<News> list = new ArrayList<News>();
		String sql = "select * from news where themeId=? limit ?,?";
		Object[] param = {themeId,((page_num-1)*page_news),page_news};
		list = ndl.getNews(sql, param);
		return list;
	}
	
	public List<Discussion> selectDis(int page_num,int page_dis,int newsId){
		List<Discussion> list = new ArrayList<Discussion>();
		String sql = "select * from discussion where newsId=? order by id desc limit ?,?";
		Object[] param = {newsId,((page_num-1)*page_dis),page_dis};
		list = ddl.getDis(sql, param);
		return list;
	}
}
