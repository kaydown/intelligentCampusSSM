package com.service.impl;

import com.dao.UserMapper;
import com.model.User;
import com.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public User findUserByUsernameAndPwdAndRole(String uname, String pwd,String role) {
        return userMapper.findUserByUsernameAndPwdAndRole(uname,pwd ,role);
    }

    @Override
    public List<User> findUserAll(String role) {
        return userMapper.findUserAll(role);
    }

    @Override
    public User findSingleUser(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addUser(User obj) {
        return userMapper.insertSelective(obj);
    }

    @Override
    public int updateUser(User obj) {
        return userMapper.updateByPrimaryKeySelective(obj);
    }

    @Override
    public int deleteUser(Integer id) {
        return userMapper.deleteByPrimaryKey(id);
    }
}
