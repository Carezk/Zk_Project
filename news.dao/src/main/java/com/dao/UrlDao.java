package com.dao;

import java.util.List;

import com.entiy.Url;


/**    
 * @author zk  
 * @date 2018年8月2日  
 */
public interface UrlDao {
	public List<Url> getUrl(String sql,Object[] param); //查询外链
	public List<Url> getAll(); //查询所有外链
}
