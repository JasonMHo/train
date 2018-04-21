package cn.train.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.train.entity.Traininfo;
import cn.train.service.TrainService;
import net.sf.json.JSONObject;

/*
 * @ Copyright (c) Create by JASON  Date:2018-04-17  All rights reserved.
 *
 * @ class description：火车信息控制
 *
 */
@Controller
public class TrainController {
	@Resource
	@Qualifier("trainService")
	private TrainService trainService;
	
	//火车信息列表的请求处理
	@RequestMapping("backend/trainList.html")
	public String totrainListPage(Model model,HttpSession session){
		
		Object userObj = session.getAttribute("user");
		if(userObj != null){
			List<Traininfo> trainList;
			try {
				trainList = trainService.getTraininfoList();
				model.addAttribute("trainList", trainList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "backend/trainList";
		}else{
			return "redirect:/";
		}
	}
	
	//添加火车信息的请求处理
	@RequestMapping(value="backend/addTrain.html",method=RequestMethod.POST)
	public String addTrainPage(HttpSession session,Traininfo addTraininfo){
		
		Object userObj = session.getAttribute("user");
		if(userObj != null){
			try {
				trainService.addTraininfo(addTraininfo);
				System.out.println(addTraininfo.getArrival_station()+"\n\n\n");
				System.out.println(addTraininfo.getMile()+"\n\n\n");
				System.out.println(addTraininfo.getTrain_no()+"\n\n\n");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "redirect:/backend/trainList.html";
		}else{
			return "redirect:/";
		}
	}
	
	//火车信息详情的请求处理
	@RequestMapping(value="backend/getTrain.html", produces = {"text/html;charset=UTF-8"})
	@ResponseBody
	public Object getTrain(@RequestParam(value="id",required=false) String id){
		String cjson = "";
		if(null == id || "".equals(id)){
			return "nodata";
		}else{
			try {
				Traininfo train = new Traininfo();
				train = trainService.getTraininfoDetail(Integer.parseInt(id));
				JSONObject jo = JSONObject.fromObject(train);
				cjson = jo.toString();
				
			}  catch (Exception e) {
				e.printStackTrace();
				return "failed";
			}
		}
		return cjson;
	}
	
	//删除火车信息的请求处理
	@RequestMapping("delete.html")
	@ResponseBody
	public String doDeleteTraininfo(Model model,@RequestParam String trainNos){
		
		int flag = 0;
		if(null != trainNos && !"".equals(trainNos)){
			String[] selectTrainNos = trainNos.split(" ");
			try {
				flag = trainService.deleteTraininfoByids(selectTrainNos);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(flag > 0){
			return "success";
		}else{
			return "failed";
		}
	}

}


