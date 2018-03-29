package com.lucas.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lucas.bean.User;
import com.lucas.mapper.UserMapper;

@Service
public class UserServices {

	@Autowired
	UserMapper userMapper;
	

	public List<User> getAll(){
		
		return userMapper.getListUser();
	}


	public boolean deleteUser(String uid) {
		// TODO Auto-generated method stub
		return userMapper.deleteUser(uid);
	}


	public boolean modifyUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.modifyUser(user);
	}
}
