/**
 * 
 */
package com.entiy;

/**    
 * @author zk  
 * @date 2018年8月2日  
 */
public class News {
       
private int id;
	
	/**
	 * 主题id
	 */
	private int themeId;
	
	/**
	 * 主题名称
	 */
	private String theme;
	
	/**
	 * 标题名称
	 */
	private String title;
	
	/**
	 * 作者
	 */
	private String author;
	
	/**
	 * 摘要
	 */
	private String digest;
	
	/**
	 * 文章内容
	 */
	private String article;
	
	/**
	 * 日期
	 */
	private String date;
	
	/**
	 * 图片链接
	 */
	private String photoName;
	
	/**
	 * 控制项
	 */
	private String toFront;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getThemeId() {
		return themeId;
	}

	public void setThemeId(int themeId) {
		this.themeId = themeId;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDigest() {
		return digest;
	}

	public void setDigest(String digest) {
		this.digest = digest;
	}

	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getToFront() {
		return toFront;
	}

	public void setToFront(String toFront) {
		this.toFront = toFront;
	}

	public News(int id, int themeId, String theme, String title, String author,
			String digest, String article, String date, String photoName,
			String toFront) {
		super();
		this.id = id;
		this.themeId = themeId;
		this.theme = theme;
		this.title = title;
		this.author = author;
		this.digest = digest;
		this.article = article;
		this.date = date;
		this.photoName = photoName;
		this.toFront = toFront;
	}
	
	public News() {
		// TODO Auto-generated constructor stub
	}
}
