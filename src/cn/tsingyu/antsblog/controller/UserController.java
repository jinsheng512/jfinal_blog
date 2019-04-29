package cn.tsingyu.antsblog.controller;

import cn.tsingyu.antsblog.model.User;
import cn.tsingyu.antsblog.util.MD5Util;

import com.jfinal.core.Controller;

public class UserController extends Controller{
	public void login(){
		render("login.jsp");
	}
	public void register(){
		render("register.jsp");
	}
	public void runRegis(){
		User user = getModel(User.class);
		String uname = getPara("uname").trim();
		String pwd = getPara("pwd").trim();
		
		user.set("uname", uname);
		user.set("pwd", MD5Util.getMD5(pwd));
		user.set("role", 1);
		boolean r = false;
		try{
			r = user.save();
			if(r){
				setAttr("msg", "恭喜哈，注册成功了,现在为您跳转到首页");
				setSessionAttr("uname", uname);
				setAttr("redirectPage", "");
			}else{
				setAttr("msg", "糟糕，注册失败了，现在为您跳转回注册页");
				setAttr("redirectPage", "user/register");
			}
		}catch(Exception e){
			e.printStackTrace();
			String exceptionMsg=e.getMessage();
			if(exceptionMsg.contains("uname") && exceptionMsg.contains("Duplicate")){
				setAttr("msg", "糟糕，用户名："+uname+" 被别人抢啦，换一个试试吧，现在为您跳转回注册页");
				setAttr("redirectPage", "user/register");
			}
		}
		render("/view/common/msg.jsp");
	}
	public void runLogin(){
		String uname = getPara("uname").trim();
		String pwd = getPara("pwd").trim();
		User user = User.dao.login(uname, MD5Util.getMD5(pwd));
	    if(user!=null) {
	    	setAttr("msg", "登录成功,现在为您跳转到首页");
			setSessionAttr("uname", uname);
			setSessionAttr("uid",user.get("id"));
			setAttr("redirectPage", "/antsblog");
	    }else{
	    	setAttr("msg", "登录失败,现在为您跳转到登录页");
			setAttr("redirectPage", "/antsblog");
	    }
	    render("/view/common/msg.jsp");
	}
	public void logout(){
		getSession().removeAttribute("uname");
		setAttr("msg", "您已退出登录,现在为您跳转到首页");
		setAttr("redirectPage", "/antsblog");
		render("/view/common/msg.jsp");
	}
}
