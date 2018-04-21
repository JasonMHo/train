package cn.train.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.train.dao.TrainDao;
import cn.train.entity.Traininfo;
import cn.train.service.TrainService;

/*
 * @ Copyright (c) Create by JASON  Date:2018-04-17  All rights reserved.
 *
 * @ class description：火车信息service实现类，业务处理
 *
 */
@Service("trainService")
public class TrainServiceImpl implements TrainService {
	@Resource 
    private TrainDao trainDao;

	@Override
	public List<Traininfo> getTraininfoList() throws Exception{
		return trainDao.getTraininfoList();
	}

	@Override
	public Traininfo getTraininfoDetail(int trainNo) throws Exception{
		return trainDao.getTraininfoDetail(trainNo);
	}
	
	
	//此方法已支持事务，如果有一个删除不成功就会全部回滚
	@Override
	public int deleteTraininfoByids(String[] selectIds) throws Exception{
		int num = 0;
		for(int i = 0; i < selectIds.length; i++){
			num += trainDao.deleteTraininfoById(Integer.parseInt(selectIds[i]));
		}
		return num;
	}
	
	@Override
	public int addTraininfo(Traininfo trainInfo) throws Exception{
		return trainDao.addTraininfo(trainInfo);
	}
	

}


