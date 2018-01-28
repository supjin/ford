package com.ft.service.system.investigate_fujia_table;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.util.PageData;


@Service("investigate_fujia_tableService")
public class Investigate_fujia_tableService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("Investigate_fujia_tableMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("Investigate_fujia_tableMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("Investigate_fujia_tableMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Investigate_fujia_tableMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Investigate_fujia_tableMapper.listAll", pd);
	}
	/*
	*列表(全部)
	*/
	public List<PageData> tpListAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Investigate_fujia_tableMapper.tpListAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Investigate_fujia_tableMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Investigate_fujia_tableMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

