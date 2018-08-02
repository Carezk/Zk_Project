package com.entiy;

import java.sql.Connection;
import java.sql.ResultSet;

/**    
 * @author zk  
 * @date 2018年8月2日  
 */
public interface BaseDao {
	public Connection getConnection();
	public void closeAll();
	public ResultSet executeQuerySQL(String preparedSql, Object[] param);
	public int executeSQL(String preparedSql, Object[] param);
}
