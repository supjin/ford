package com.ft.service.system.measures_message_attachment;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.util.PageData;


@Service("measures_message_attachmentService")
public class Measures_message_attachmentService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("Measures_message_attachmentMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("Measures_message_attachmentMapper.delete", pd);
	}
	/*
	* 删除
	*/
	public void deleted(PageData pd)throws Exception{
		dao.delete("Measures_message_attachmentMapper.deleted", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("Measures_message_attachmentMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Measures_message_attachmentMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Measures_message_attachmentMapper.listAll", pd);
	}
	/*
	*列表(全部)类型
	*/
	public List<PageData> listAllByValue(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Measures_message_attachmentMapper.listAllByValue", pd);
	}
	
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Measures_message_attachmentMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Measures_message_attachmentMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

