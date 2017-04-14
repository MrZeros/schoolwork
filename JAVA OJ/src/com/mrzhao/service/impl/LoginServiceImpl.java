package com.mrzhao.service.impl;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mrzhao.dao.LoginDao;
import com.mrzhao.entity.User;
import com.mrzhao.service.LoginService;

@Service("loginService")
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginDao userDao;
	
	public String login(User user) {
		int num=userDao.login(user);
		if(num>0){
			return "success";
		}
		return "error";
	}
	
}
