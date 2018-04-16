package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User findUserByUsernameAndPwdAndRole(@Param("uname")String uname, @Param("pwd")String pwd, @Param("role")String role);

	List<User> findUserAll(@Param("role")String role);
}