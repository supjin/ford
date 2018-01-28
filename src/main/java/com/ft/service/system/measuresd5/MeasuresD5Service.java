package com.ft.service.system.measuresd5;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.util.PageData;


@Service("measuresd5Service")
public class MeasuresD5Service {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("MeasuresD5Mapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("MeasuresD5Mapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("MeasuresD5Mapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("MeasuresD5Mapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("MeasuresD5Mapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("MeasuresD5Mapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("MeasuresD5Mapper.deleteAll", ArrayDATA_IDS);
	}
	
}

