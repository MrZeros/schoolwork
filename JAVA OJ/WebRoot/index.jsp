<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>java在线评测系统</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="./layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="./global.css" media="all">
	<link rel="stylesheet" type="text/css" href="./css/adminstyle.css" media="all">
</head>
<body>
<div class="layui-layout layui-layout-admin" id="layui_layout">
	<!-- 顶部区域 -->
	<div class="layui-header header header-demo">
		<div class="layui-main">
		    <!-- logo区域 -->
			<div class="admin-logo-box">
				<a class="logo" href="#" title="logo"><img src="./images/logo.png" alt=""></a>
				<div class="larry-side-menu">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</div>
			</div>
            <!-- 顶级菜单区域 -->
            <div class="layui-larry-menu">
                <ul class="layui-nav clearfix">
                	
	                	<form class="layui-form" action=""> 
	                		
	                		<div class="layui-form-item" style="position:relative;top:10px">   
	                			<li style="float:left">          		                		
	      									<input type="text" name="username" lay-verify="required" placeholder="题号/题目名称" autocomplete="off" class="layui-input"> 
	      								</li>
	      								<li style="float:left">
	      									<input type="submit" class="layui-btn layui-btn-normal layui-btn-radius" value="搜索"/>
	      								</li>
	      							</div>  	      																	
	                	</form>                 	        
                </ul>
            </div>
            <!-- 右侧导航 -->
            <ul class="layui-nav larry-header-item">
							<li class="layui-nav-item">
								<a href="login.html">
		                        <i class="iconfont icon-exit"></i>
								退出</a>
							</li>
            </ul>
		</div>
	</div>
	<!-- 左侧侧边导航开始 -->
	<div class="layui-side layui-side-bg layui-larry-side" id="larry-side">
        <div class="layui-side-scroll" id="larry-nav-side" lay-filter="side">
		<div class="user-photo">
			<a class="img" title="我的头像" >
				<img src="images/user.jpg" class="userimg1"></a>
			<p>${user.account }</p>
		</div>
		<!-- 左侧菜单 -->
		<ul class="layui-nav layui-nav-tree">
			<!-- 个人信息 -->
			<li class="layui-nav-item">
				<a href="javascript:;">
					<i class="iconfont icon-jiaoseguanli" ></i>
					<span>我的面板</span>
					<em class="layui-nav-more"></em>
				</a>
				<dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;" data-url="personInfo.html">
                            <i class="iconfont icon-geren1" data-icon='icon-geren1'></i>
                            <span>个人信息</span>
                        </a>
                    </dd>
                    <dd>
                        <a href="javascript:;" data-url="changepwd.html">
                            <i class="iconfont icon-iconfuzhi01" data-icon='icon-iconfuzhi01'></i>
                            <span>修改密码</span>
                        </a>
                    </dd>
                    <dd>
                        <a href="javascript:;" data-url="myloginfo.html">
                            <i class="iconfont icon-piliangicon" data-icon='icon-piliangicon'></i>
                            <span>日志信息</span>
                        </a>
                    </dd>
                </dl>
			</li>
			<!-- 用户管理 -->
			<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-jiaoseguanli2" ></i>
					   <span>用户管理</span>
					   <em class="layui-nav-more"></em>
					</a>
					    <dl class="layui-nav-child">
					    	<dd>
					    		<a href="javascript:;" data-url="${contextpath }/JAVA OJ/userList.do">
					    		   <i class="iconfont icon-yonghu1" data-icon='icon-yonghu1'></i>
					    		   <span>用户列表</span>
					    		</a>
					    	</dd>
					    	<dd>
					    		<a href="javascript:;">
					    		   <i class="iconfont icon-jiaoseguanli4" data-icon='icon-jiaoseguanli4'></i>
					    		   <span>角色列表</span>
					    		</a>
					    	</dd>
					    	<dd>
					    		<a href="javascript:;">
					    		   <i class="iconfont icon-quanxian2" data-icon='icon-quanxian2'></i>
					    		   <span>菜单管理</span>
					    		</a>
					    	</dd>
					    	<dd>
					    		<a href="javascript:;" data-url="https://github.com/larryqin/larrycms">
					    		   <i class="iconfont icon-yonghu1" data-icon='icon-yonghu1'></i>
					    		   <span>Github下载</span>
					    		</a>
					    	</dd>
					    </dl>
			    </li>
			<!-- 内容管理 -->
			<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-wenzhang1" ></i>
					   <span>题库管理</span>
					   <em class="layui-nav-more"></em>
					</a>
					   <dl class="layui-nav-child">
					   	   <dd>
					    		<a href="javascript:;" data-url="problemsList.html">
					    		   <i class="iconfont icon-lanmuguanli" data-icon='icon-lanmuguanli'></i>
					    		   <span>所有题库</span>
					    		</a>
					    	</dd>
					    	<dd>
					    		<a href="javascript:;">
					    		   <i class="iconfont icon-wenzhang2" data-icon='icon-wenzhang2'></i>
					    		   <span>入门题库</span>
					    		</a>
					    	</dd>
					    	<dd>
					    		<a href="javascript:;">
					    		   <i class="iconfont icon-icon1" data-icon='icon-icon1'></i>
					    		   <span>普及题库</span>
					    		</a>
					    	</dd>
					    	<dd>
					    		<a href="javascript:;">
					    		   <i class="iconfont icon-word" data-icon='icon-word'></i>
					    		   <span>提高题库</span>
					    		</a>
					    	</dd>					    						    	
					   </dl>
			   </li>
			
                 <!-- 天梯 -->
				<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-m-members" ></i>
					   <span>天梯</span>
					   <em class="layui-nav-more"></em>
					</a>
					<dl class="layui-nav-child">
              <dd>
             	   <a href="javascript:;">
          					<i class="iconfont icon-zhuti"  data-icon='icon-zhuti'></i>
          					<span>青铜</span>
           			 </a>
              </dd>
              <dd>
             	   <a href="javascript:;">
          					<i class="iconfont icon-zhuti"  data-icon='icon-zhuti'></i>
          					<span>白银</span>
           			 </a>
              </dd>
              <dd>
             	   <a href="javascript:;">
          					<i class="iconfont icon-zhuti"  data-icon='icon-zhuti'></i>
          					<span>黄金</span>
           			 </a>
              </dd>
              <dd>
             	   <a href="javascript:;">
          					<i class="iconfont icon-zhuti"  data-icon='icon-zhuti'></i>
          					<span>钻石</span>
           			 </a>
              </dd>
               <dd>
             	   <a href="javascript:;">
          					<i class="iconfont icon-zhuti"  data-icon='icon-zhuti'></i>
          					<span>大师</span>
           			 </a>
              </dd>
                    
           </dl>
				</li>
				
				<li class="layui-nav-item">
					<a href="javascript:;">
					   <i class="iconfont icon-shengchengbaogao" ></i>
					   <span>在线考试</span>
					   <em class="layui-nav-more"></em>
					</a>
					   
				</li>
		</ul>
	    </div>
	</div>

	<!-- 左侧侧边导航结束 -->
	<!-- 右侧主体内容 -->
	<div class="layui-body" id="larry-body" style="bottom: 0;border-left: solid 2px #1AA094;">
		<div class="layui-tab layui-tab-card larry-tab-box" id="larry-tab" lay-filter="demo" lay-allowclose="true">
			<ul class="layui-tab-title">
				<li class="layui-this" id="admin-home"><i class="iconfont icon-diannao1"></i><em>题库</em></li>
				
			</ul>
			<div class="layui-tab-content" style="min-height: 150px; ">
				<div class="layui-tab-item layui-show" >
					<iframe class="larry-iframe" data-id='0' src="${contextpath }/JAVA OJ/allRepository.do"></iframe>
				</div>
				
			</div>
		</div>

        
	</div>
	<!-- 底部区域 -->
	<div class="layui-footer layui-larry-foot" id="larry-footer">
		<div class="layui-mian">
		    <div class="larry-footer-left">
		    	author QQ Email：1173283125@qq.com
		    </div>
		    <p class="p-admin">
		    	<span>2017 &copy;</span>
		    	Write by zeevor. 版权所有
		    	前端框架layui，下载地址：www.layui.com
		    </p>
		</div>
	</div>
</div>
<!-- 加载js文件-->
	<script type="text/javascript" src="./layui/layui.js"></script> 
	<script type="text/javascript" src="./js/larry.js"></script>
	<script type="text/javascript" src="./js/index.js"></script>

<!-- 菜单控件 -->
<!-- <div class="larry-tab-menu">
	<span class="layui-btn larry-test">刷新</span>
</div> -->
<!-- iframe框架刷新操作 -->
<!-- <div id="refresh_iframe" class="layui-btn refresh_iframe">刷新</div> -->
<div style="display:none;"></div>
</body>
</html>
