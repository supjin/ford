package com.ft.service.system.process_five;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.util.PageData;


@Service("process_fiveService")
public class Process_fiveService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("Process_fiveMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("Process_fiveMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("Process_fiveMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Process_fiveMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Process_fiveMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Process_fiveMapper.findById", pd);
	}
	
	/*
	* 通过事件id获取数据
	*/
	public PageData findByD5Id(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Process_fiveMapper.findByD5Id", pd);
	}
	
	
	
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Process_fiveMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

