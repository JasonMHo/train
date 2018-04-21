package cn.train.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.train.entity.User;
import cn.train.service.UserService;
import net.sf.json.JSONObject;

/*
 * @ Copyright (c) Create by JASON  Date:2018-04-14  All rights reserved.
 *
 * @ class description：登录控制
 *
 */
@Controller
public class LoginController {
	private Logger logger = Logger.getLogger(LoginController.class);
	
	@Resource
	@Qualifier("userService")
	private UserService userService;
	
	//登录请求的处理
	@RequestMapping("login.html")
	@ResponseBody
	public String login(@RequestParam String user,HttpSession session){
		logger.debug("login.html请求执行了*******************"+user.toString());
		
		if(user == null || "".equals(user)){
			return "noData";
		}else{
			JSONObject userObject = JSONObject.fromObject(user);
			
			@SuppressWarnings("static-access")
			User userObj = (User) userObject.toBean(userObject, User.class);
			try {
				if(userService.getLoginUser(userObj) == null){
					return "noUsername";
				}else{
					User _user = userService.getLoginUser(userObj);
					if(_user != null){
						session.setAttribute("user", _user);
						return "success";
					}else{
						return "pwdError";
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				return "failed";
			}
		}
	}
	
	//退出请求的处理
	@RequestMapping("logout.html")
	public String logout(HttpSession session){
		logger.debug("loginout.html请求执行了*******************");
		
		session.removeAttribute("user");
		session.invalidate();
		
		return "redirect:/";
	}
	
	//主页面请求的处理
	@RequestMapping("main.html")
	public ModelAndView toMainPage(Model model,HttpSession session){
		
		Object userObj = session.getAttribute("user");
		if(userObj != null){
			return new ModelAndView("main");
		}else{
			return new ModelAndView("redirect:/");
		}
	}
	
	



}


