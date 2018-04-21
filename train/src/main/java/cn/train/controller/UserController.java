package cn.train.controller;


import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.train.common.JsonDateValueProcessor;
import cn.train.entity.User;
import cn.train.service.UserService;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/*
 * @ Copyright (c) Create by JASON  Date:2018-04-20  All rights reserved.
 *
 * @ class description：用户控制
 *
 */
@Controller
public class UserController {
	
	@Resource
	@Qualifier("userService")
	private UserService userService;
	
	//用户列表的请求处理
	@RequestMapping("backend/userList.html")
	public String toUserListPage(Model model,HttpSession session){
		
		Object userObj = session.getAttribute("user");
		if(userObj != null){
			List<User> userList;
			try {
				userList = userService.getUserList();
				model.addAttribute("userList", userList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "backend/userList";
		}else{
			return "redirect:/";
		}
	}
	
	//用户详情的请求处理
	@RequestMapping(value = "backend/getUser.html", produces = {"text/html;charset=UTF-8"})
	@ResponseBody
	public Object getUserDetail(@RequestParam(value="id",required=false) String id){
		String cjson = "";
		if(null == id || "".equals(id)){
			return "nodata";
		}else{
			try {
				User user = new User();
				user = userService.getUserById(Integer.parseInt(id));
				
				//user对象里有日期，所有有日期的属性，都要按照此日期格式进行json转换（对象转json）
				JsonConfig jsonConfig = new JsonConfig();
				JsonDateValueProcessor jdvp = new JsonDateValueProcessor("yyyy-MM-dd");
				jsonConfig.registerJsonValueProcessor(Date.class, jdvp);
				JSONObject jo = JSONObject.fromObject(user,jsonConfig);
				cjson = jo.toString();
				
			} catch (Exception e) {
				e.printStackTrace();
				return "failed";
			}
		}
		return cjson;
	}
}


