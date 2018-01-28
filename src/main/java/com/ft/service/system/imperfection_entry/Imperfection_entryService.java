package com.ft.service.system.imperfection_entry;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.util.PageData;


@Service("imperfection_entryService")
public class Imperfection_entryService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("Imperfection_entryMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("Imperfection_entryMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("Imperfection_entryMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Imperfection_entryMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Imperfection_entryMapper.listAll", pd);
	}
	/*
	*列表(全部 TOP 10)
	*/
	public List<PageData> listMost(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Imperfection_entryMapper.listMost", pd);
	}
	/*
	*列表(全部 TOP 10)
	*/
	public List<PageData> listMostNomber(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Imperfection_entryMapper.listMostNomber", pd);
	}
	/*
	*列表(全部 TOP 10)
	*/
	public List<PageData> listMostNonlve(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Imperfection_entryMapper.listMostNonlve", pd);
	}
	/*
	*列表(全部 TOP 10)
	*/
	public List<PageData> listMostProducber(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Imperfection_entryMapper.listMostProducber", pd);
	}
	/*列表(全部 TOP 10)
	*/
	public List<PageData> listMostequiber(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Imperfection_entryMapper.listMostequiber", pd);
	}
	/*列表(全部 TOP 10)
	*/
	public List<PageData> listMosteprocber (PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Imperfection_entryMapper.listMosteprocber", pd);
	}
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Imperfection_entryMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Imperfection_entryMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

