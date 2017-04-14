package com.mrzhao.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mrzhao.entity.User;
import com.mrzhao.service.LoginService;

@Controller
public class DispacherController{
	@Autowired
	private LoginService loginService;
	@RequestMapping("login.do")
	public ModelAndView handleRequest(HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		String account=req.getParameter("UserName");
		String password=req.getParameter("Password");
		User user=new User(account, password);
		System.out.println("user is "+user);
		String s=loginService.login(user);
		ModelAndView mod=new ModelAndView("index");
		mod.addObject("user", user);
		System.out.println(req.getContextPath());
		return mod;
	}
	/**
	 * 映射所有题库页面
	 * @param req
	 * @param resp
	 * @return
	 */
	@RequestMapping("allRepository.do")
	public String mappingProblems(HttpServletRequest req,
			HttpServletResponse resp){
		
		return "allRepository";
	}
	@RequestMapping("userList.do")
	public String mappingUserList(HttpServletRequest req,
			HttpServletResponse resp){
		
		return "userList";
	}
//	@RequestMapping("login.do")
//	@ResponseBody
//	public String toLogin(HttpServletRequest req,HttpServletResponse resp){
//		String account=req.getParameter("account");
//		String passwd=req.getParameter("passwd");
//		User user=new User(account, passwd);
//		System.out.println("user is "+user);
//		String s=loginService.login(user);
//		String contextPath=req.getContextPath();
//		String addr=req.getLocalAddr();
//		String port=req.getLocalPort()+"";
//		StringBuffer url=new StringBuffer("http://"+addr+":"+port+contextPath+"/");
//		url.append("success".equals(s)?"test/index.jsp":"");
//		System.out.println(url.toString());
//		return url.toString();
//	}
}
