package com.dao;

import java.util.List;

import com.entiy.Discussion;
/**    
 * @author zk  
 * @date 2018年8月2日  
 */
public interface DiscussionDao {
	public abstract List<Discussion> getDis(String sql,Object[] param);     //查询评论内容
	public int countSomeDis(int newsId);									//按新闻查询评论数
	public int deldis(int newsId); 											//删除指定新闻id的所有评论
	public int delAnyDis(int id); 											//删除指定的评论
	public abstract List<Discussion> getSomeDis(int nid); 					//根据新闻id查询评论
	public int addDis(Discussion dis);										//添加评论

}
