package com.service;

import java.util.List;

import com.model.User;

public interface UserService {

	User findUserByUsernameAndPwdAndRole(String uname, String pwd ,String role);

	List<User> findUserAll(String role);

	User findSingleUser(Integer id);

	int addUser(User obj);

	int updateUser(User obj);

	int deleteUser(Integer id);
}
