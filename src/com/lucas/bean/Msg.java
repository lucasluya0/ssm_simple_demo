package com.lucas.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {

	//状态码：100-成功   99-失败
	private int code;
	
	//提示信息
	public String message;
	private Map<String,Object> extend=new HashMap<String,Object>();
	
	public static Msg success(){
		Msg msg=new Msg();
		msg.setCode(100);
		msg.setMessage("处理成功");
		return msg;
	}
	public Msg addExtend(String str,Object obj){
		this.getExtend().put(str, obj);
		return this;
	}
	public static Msg fail(){
		Msg msg=new Msg();
		msg.setCode(99);
		msg.setMessage("处理失败");
		return msg;
	}
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
}
