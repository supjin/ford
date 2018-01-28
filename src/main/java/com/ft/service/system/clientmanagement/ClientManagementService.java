package com.ft.service.system.clientmanagement;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.util.PageData;


@Service("clientmanagementService")
public class ClientManagementService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("ClientManagementMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("ClientManagementMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("ClientManagementMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ClientManagementMapper.datalistPage", page);
	}
	/*
	*列表
	*/
	public List<PageData> listAllFactory(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ClientManagementMapper.listAllFactory", pd);
	}
	/*
	*列表
	*/
	public List<PageData> listAllName(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ClientManagementMapper.listAllName", pd);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ClientManagementMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ClientManagementMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ClientManagementMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

