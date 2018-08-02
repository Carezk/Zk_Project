package com.entiy;

/**    
 * @author zk  
 * @date 2018年8月2日  
 */
public class Theme {
       private int id;
       private String name;
       
       public Theme() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Theme(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
       
}
