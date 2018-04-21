package cn.train.service;

import java.util.List;

import cn.train.entity.Traininfo;


/*
 * @ Copyright (c) Create by JASON  Date:2018-04-17  All rights reserved.
 *
 * @ class description：火车信息service接口
 *
 */

public interface TrainService {
	
	public List<Traininfo> getTraininfoList() throws Exception;
	
	public Traininfo getTraininfoDetail(int trainNo) throws Exception;
	
	public int deleteTraininfoByids(String[] selectIds) throws Exception;
    
    public int addTraininfo(Traininfo trainInfo) throws Exception;
    
	
}


