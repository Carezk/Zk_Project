package com.dao;

import java.util.List;

import com.entiy.Discussion;
import com.entiy.News;


public interface PageSer {
	
	/**
	 * 分页查询新闻
	 * @param page_num
	 * @param page_news
	 * @return
	 */
	public List<News> selectNews(int page_num,int page_news);
	/**
	 * 带主题id分页查询新闻
	 * @param page_num
	 * @param page_news
	 * @param themeId
	 * @return
	 */
	public List<News> selectNews(int page_num,int page_news,int themeId);
	/**
	 * 分页查询留言内容
	 * @param page_num 当前页数
	 * @param page_dis 每页显示
	 * @param newsId 新闻id
	 * @return
	 */
	public List<Discussion> selectDis(int page_num,int page_dis,int newsId);
	

}
