package com.dao;

import java.util.List;

import com.entiy.User;

/**    
 * @author zk  
 * @date 2018年8月2日  
 */
public interface UserDao {
       public List<User> getUsers(String sql,Object[] objects);//查询用户
       public boolean YesUser(String name,String password);//根据用户名和密码查询用户用来验证登录
       public boolean isUser(String name);//查询用户是否存在
       public int addUser(User user);//添加用户
}
