package com.ft.service.system.process_one;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.util.PageData;


@Service("process_oneService")
public class Process_oneService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("Process_oneMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("Process_oneMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("Process_oneMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Process_oneMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Process_oneMapper.listAll", pd);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAllName(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Process_oneMapper.listAllName", pd);
	}
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Process_oneMapper.findById", pd);
	}
	
	/*
	* 通过事件id获取数据
	*/
	public PageData findBysjid(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Process_oneMapper.findBysjid", pd);
	}
	
	
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Process_oneMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

