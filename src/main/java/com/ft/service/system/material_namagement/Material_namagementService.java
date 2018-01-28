package com.ft.service.system.material_namagement;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.util.PageData;


@Service("material_namagementService")
public class Material_namagementService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("Material_namagementMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("Material_namagementMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("Material_namagementMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Material_namagementMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Material_namagementMapper.listAll", pd);
	}

	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Material_namagementMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Material_namagementMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

