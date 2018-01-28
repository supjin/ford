package com.ft.service.system.productmangement;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.util.PageData;


@Service("productmangementService")
public class ProductMangementService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("ProductMangementMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("ProductMangementMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("ProductMangementMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ProductMangementMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ProductMangementMapper.listAll", pd);
	}
	/*
	*列表(全部)
	*/
	public List<PageData> listAllName(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ProductMangementMapper.listAllName", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ProductMangementMapper.findById", pd);
	}
	/*
	* 通过code获取数据
	*/
	public PageData findByCode(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ProductMangementMapper.findByCode", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ProductMangementMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

