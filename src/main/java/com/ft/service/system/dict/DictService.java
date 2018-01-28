package com.ft.service.system.dict;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ft.dao.DaoSupport;
import com.ft.entity.Dict;
import com.ft.util.PageData;




@Service("dictService")
public class DictService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	/*
	*列表(全部)
	*/
	public List<PageData> getList(String type)throws Exception{
		return (List<PageData>)dao.findForList("DictMapper.getList", type);
	}
	
	
	/*
	*列表(全部)
	*/
	public List<Dict> findAllList()throws Exception{
		return (List<Dict>)dao.findForList("DictMapper.findAllList", null);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> getAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("DictMapper.getAll", pd);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> selectByTypeAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("DictMapper.selectByTypeAll", pd);
	}
	
}

