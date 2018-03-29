package com.lucas.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lucas.bean.Msg;
import com.lucas.bean.User;
import com.lucas.services.UserServices;

@Controller
public class UserController {

	@Autowired
	UserServices userServices;
	
	@RequestMapping("/user")
	@ResponseBody
	public Msg getUserWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn){
		PageHelper.startPage(pn, 5);
		List<User> user=userServices.getAll();
		PageInfo page = new PageInfo(user,5);
		return Msg.success().addExtend("pageInfo",page);
	}
	@RequestMapping(value="/deleteUser/{uid}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteUserWithJson(@PathVariable String uid){
		boolean b=userServices.deleteUser(uid);
		if(b){
			return Msg.success();
		}
		return Msg.fail();
	}
	@RequestMapping(value="/updateUser/{uid}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg modifyWithJson(User user){
		boolean b=userServices.modifyUser(user);
		if(b){
			return Msg.success();
		}
		return Msg.fail();
	}
}
