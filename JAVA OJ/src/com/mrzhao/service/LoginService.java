package com.mrzhao.service;

import org.springframework.stereotype.Service;

import com.mrzhao.entity.User;

public interface LoginService {
	public String login(User user);
}
