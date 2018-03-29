package com.lucas.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.lucas.bean.User;

@Repository
public interface UserMapper {
	public List<User> getListUser();
	public void insertUser(User user);
	public boolean deleteUser(@Param(value="uid") String uid);
	public boolean modifyUser(User user);
} 
