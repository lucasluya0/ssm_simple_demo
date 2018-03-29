package com.lucas.bean;

public class User {

	private String uid;
	private String uname;
	private String upwd;
	private String uemail;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public User(String uid, String uname, String upwd, String uemail) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.upwd = upwd;
		this.uemail = uemail;
	}

	public User(){
		
	}
}
