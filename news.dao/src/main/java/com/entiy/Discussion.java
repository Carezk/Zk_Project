package com.entiy;

/**    
 * @author zk  
 * @date 2018年8月2日  
 */
public class Discussion {


	private int id;             
	private int newsId;			//新闻id
	private String name;		//评论者姓名
	private String ip;			//ip地址
	private String time;		//评论时间
	private String content;		//评论内容
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNewsId() {
		return newsId;
	}
	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
    public Discussion() {
		// TODO Auto-generated constructor stub
	}
	public Discussion(int id, int newsId, String name, String ip, String time,
			String content) {
		super();
		this.id = id;
		this.newsId = newsId;
		this.name = name;
		this.ip = ip;
		this.time = time;
		this.content = content;
	}
    
    
}
