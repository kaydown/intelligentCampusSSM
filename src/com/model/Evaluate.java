package com.model;

import java.util.Date;

public class Evaluate {
	private Integer evaluateid;

	private Integer userid;

	private String username;

	private String content;

	private Date addtime;

	private String date;

	public Integer getEvaluateid() {
		return evaluateid;
	}

	public void setEvaluateid(Integer evaluateid) {
		this.evaluateid = evaluateid;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public Date getAddtime() {
		return addtime;
	}

	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date == null ? null : date.trim();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}