package com.youngpoong.bbs;

import java.sql.Timestamp;

public class bbsDto {
	private int id;
	private String Title;
	private String seleter;
	private String userID;
	private Timestamp date;
	private String Content;
	private int Available;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getSeleter() {
		return seleter;
	}
	public void setSeleter(String seleter) {
		this.seleter = seleter;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public int getAvailable() {
		return Available;
	}
	public void setAvailable(int available) {
		Available = available;
	}

	
}
