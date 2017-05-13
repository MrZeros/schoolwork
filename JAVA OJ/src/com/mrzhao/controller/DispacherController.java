package com.mrzhao.controller;

import java.util.Enumeration;
import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mrzhao.common.Pub;
import com.mrzhao.common.SnowflakeIdWorker;
import com.mrzhao.common.SpringTools;
import com.mrzhao.compile.CompileManager;
import com.mrzhao.entity.CompileInfo;
import com.mrzhao.entity.Problem;
import com.mrzhao.entity.RunningRecord;
import com.mrzhao.entity.User;
import com.mrzhao.entity.UserCompile;
import com.mrzhao.service.CompileService;
import com.mrzhao.service.LoginService;
import com.mrzhao.service.ProblemService;
import com.mrzhao.service.RunningRecordService;
import com.mrzhao.service.UserInfoService;
import com.mrzhao.service.impl.CompileServiceImpl;

@Controller
public class DispacherController{
	@Autowired
	private LoginService loginService;
	@Autowired
	private ProblemService problemService;
	@Autowired
	private UserInfoService userInfoService;
	@Autowired
	private RunningRecordService runningRecordService;
	/**
	 * id 生成器
	 */
	@Autowired
	private SnowflakeIdWorker idWorker;
	/**
	 * 线程池
	 */
	private ExecutorService threadPool= Executors.newCachedThreadPool();
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
		HttpSession session=req.getSession();
		session.setAttribute("userInfo", user);
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
	public ModelAndView mappingUserList(HttpServletRequest req,
			HttpServletResponse resp){
		List<User> userList = userInfoService.queryUserList();
		ModelAndView mod=new ModelAndView("userList");
		mod.addObject("user", userList);
		return mod;
	}
	@RequestMapping("saveUser.do")
	public String saveUser(HttpServletRequest req,
										HttpServletResponse resp){
		String username = req.getParameter("name");
		String phone=req.getParameter("phone");
		String account = req.getParameter("account");
		String passwd = req.getParameter("passwd");
		String email = req.getParameter("email");
		String isadmin = req.getParameter("isadmin");

		User user = new User();
		user.setName(username);
		user.setPhone(phone);
		user.setAccount(account);
		user.setPasswd(passwd);
		user.setIsAdmin(isadmin);
		user.setEmail(email);
		user.setRanks(0);
		user.setNlevel(0);

		userInfoService.saveUser(user);

		return "redirect:userList.do";
	}
	@RequestMapping("updateUser.do")
	public String updateUser(HttpServletRequest req,
						   HttpServletResponse resp){
		String username = req.getParameter("name");
		String phone=req.getParameter("phone");
		String account = req.getParameter("account");
		String passwd = req.getParameter("passwd");
		String email = req.getParameter("email");
		String isadmin = req.getParameter("isadmin");
		User user = new User();
		if("是".equals(isadmin)){
			user.setIsAdmin("1");
		}else{
			user.setIsAdmin("0");
		}
		user.setName(username);
		user.setPhone(phone);
		user.setAccount(account);
		user.setPasswd(passwd);
		user.setEmail(email);
		user.setRanks(0);
		user.setNlevel(0);

		System.out.println(user+"oooo");
		userInfoService.updateUser(user);

		return "redirect:userList.do";
	}
	@RequestMapping("personInfo.do")
	public ModelAndView mappingPersonInfo(HttpServletRequest req,HttpServletResponse resp){
		String account=req.getParameter("account");
		User userinfo = userInfoService.queryByAccount(account);
		System.out.println(userinfo);
		ModelAndView mod=new ModelAndView("personInfo");
		mod.addObject("user", userinfo);
		return mod;
	}
	@RequestMapping("updateUserInfo.do")
	public String updateUserInfo(HttpServletRequest req,HttpServletResponse resp){
		String username = req.getParameter("name");
		String phone=req.getParameter("phone");
		String account = req.getParameter("account");
		User user = new User();
		user.setAccount(account);
		user.setPhone(phone);
		user.setName(username);
		System.out.println(user);
		userInfoService.updateUserInfo(user);
		return "redirect:personInfo.do?account="+account;
	}
	@RequestMapping("updatePassword.do")
	public String updatePassword(HttpServletRequest req,HttpServletResponse resp){
		String oldPassword = req.getParameter("oldPassword");
		String newPasswoed1=req.getParameter("newPasswoed1");
		String name = req.getParameter("name");
		String account = req.getParameter("account");

		User user = new User();
		user.setName(name);
		user.setPasswd(newPasswoed1);
		System.out.println(user);
		userInfoService.updatePassword(user);
		return "redirect:personInfo.do?account="+account;
	}	
	@RequestMapping("deleteUser.do")
	public String deleteUser(HttpServletRequest req,HttpServletResponse resp){
		String account = req.getParameter("account");

		User user = new User();
		user.setAccount(account);
		System.out.println(user);
		userInfoService.deleteUser(user);
		return "redirect:userList.do";
	}
	@RequestMapping("changepwd.do")
	public ModelAndView mappingChangepwd(HttpServletRequest req,HttpServletResponse resp){
		String account=req.getParameter("account");
		User userinfo = userInfoService.queryByAccount(account);
		System.out.println(userinfo);
		ModelAndView mod=new ModelAndView("changepwd");
		mod.addObject("user", userinfo);
		return mod;
	}

	@RequestMapping("tiku.do")
	public String mappingTiku(HttpServletRequest req,HttpServletResponse resp){
		return "tiku";
	}

	@RequestMapping("problemsList.do")
	public String mappingProblemsList(HttpServletRequest req,HttpServletResponse resp){
		List<Problem> all=problemService.findAll();
		req.setAttribute("allProblems", all);
		for (Problem problem : all) {
			problem.setProb_type(transType(problem.getProb_type()));
		}
		return "problemsList";
	}
	@RequestMapping("problem.do")
	public String mappingProblem(HttpServletRequest req,HttpServletResponse resp){
		String id=req.getParameter("id");
		System.out.println(id);
		Problem problem=problemService.findByNo(id);
		problem.setProb_type(transType(problem.getProb_type()));
		double access_num=problem.getAccess_num();
		double submit_num=problem.getSubmit_num();
		double warning_num=problem.getWarning_num();
		double error_num=problem.getError_num();
		double other_num=problem.getOther_num();
		int access_percent=(int) ((access_num/submit_num)*100);
		int warning_percent=(int) ((warning_num/submit_num)*100);
		int error_percent=(int) ((error_num/submit_num)*100);
		int other_percent=(int) ((other_num/submit_num)*100);
		req.setAttribute("problem", problem);
		req.setAttribute("percent", access_percent);
		req.setAttribute("warning_percent", warning_percent);
		req.setAttribute("error_percent", error_percent);
		req.setAttribute("other_percent", other_percent);
		req.setAttribute("other_percent", other_percent);
		req.setAttribute("access_num", access_num/1000.0);
		req.setAttribute("submit_num", submit_num/1000.0);
		return "problem";
	}
	@RequestMapping("running.do")
	public String mappingRunning(HttpServletRequest req,HttpServletResponse resp){
		//1.提交的程序代码
		String code=req.getParameter("contact");
		//2.题号
		String prob_no=req.getParameter("prob_no");
		//3.格式化程序
		String source=Pub.parseXmlToString(code);
//		source=Pub.prepareSource(source);
		System.out.println(source);
		HttpSession session=req.getSession();
		//4.通过session获取用户信息
		User user=(User) session.getAttribute("userInfo");
		//5.初始化编译信息
		CompileInfo compileInfo=new CompileInfo();
		compileInfo.setCompile_no(String.valueOf(idWorker.nextId()));
		compileInfo.setAccount(user.getAccount());
		compileInfo.setSource(source);
		compileInfo.setProb_no(prob_no);
		//6.进入编译线程
		UserCompile uc=new UserCompile(user, compileInfo);
		CompileManager.addCompileInfo(uc);
		CompileManager.notifyCompile();
		//7.
		Problem problem=problemService.findByNo(prob_no);
		problem.setProb_type(transType(problem.getProb_type()));
		req.setAttribute("problem", problem);
		req.setAttribute("id", compileInfo.getCompile_no());
		return "running";
	}
	@RequestMapping("runningLog.do")
	public String mappingRunningLog(HttpServletRequest req,HttpServletResponse resp){
		return "runningLog";
	}
	@ResponseBody
	@RequestMapping("runningInfo.do")
	public RunningRecord runningInfo(HttpServletRequest req,HttpServletResponse resp){
		String id=req.getParameter("id");
		System.out.println("+++++++id="+id);
		RunningRecord record=runningRecordService.findRunningInfoById(id);
		System.out.println("+++++++record="+record);
		return record;
	}
	private String transType(String type){
		String t="";
		if(type.equals("1")){
			return "青铜Bronze";
		}
		if(type.equals("2")){
			return "白银Silver";
		}
		if(type.equals("3")){
			return "黄金Gold";
		}
		if(type.equals("4")){
			return "钻石Diamond";
		}
		if(type.equals("5")){
			return "大师Master";
		}
		return type;
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
