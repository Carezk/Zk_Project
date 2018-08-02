package com.dao;

import java.util.List;

import com.entiy.Theme;


/**    
 * @author zk  
 * @date 2018年8月2日  
 */
public interface ThemeDao {
	public abstract List<Theme> getTheme(String sql,Object[] param);    
	public List<Theme> getAlltheme(); 									
	public List<Theme> getAnytheme(int tid); 							
	public String getThemeName(int tid);								
	public boolean themeName(String tname);								
	public int addTheme(Theme t);										
	public int delTheme(int tid);									
	public int updateTheme(Theme t);		
}
