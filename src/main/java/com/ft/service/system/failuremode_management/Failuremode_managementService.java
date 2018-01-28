package com.ft.service.system.failuremode_management;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.util.PageData;


@Service("failuremode_managementService")
public class Failuremode_managementService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("Failuremode_managementMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("Failuremode_managementMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("Failuremode_managementMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Failuremode_managementMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Failuremode_managementMapper.listAll", pd);
	}
	/*
	*列表(全部)
	*/
	public List<PageData> listAllYuan(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Failuremode_managementMapper.listAllYuan", pd);
	}
	/*
	*列表(全部)
	*/
	public List<PageData> listAllName(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Failuremode_managementMapper.listAllName", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Failuremode_managementMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Failuremode_managementMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

