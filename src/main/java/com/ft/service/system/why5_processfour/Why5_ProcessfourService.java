package com.ft.service.system.why5_processfour;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.util.PageData;
import com.ft.util.UuidUtil;


@Service("why5_processfourService")
public class Why5_ProcessfourService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		List<String[]> list = new ArrayList<String[]>();
		String[] type1 =  pd.get("type1").toString().split(",");
		String[] type2 = pd.get("type2").toString().split(",");
		String[] type3=pd.get("type3").toString().split(",");
		list.add(type1);
		list.add(type2);
		list.add(type3);
		int flag = 0;
		PageData pds = new PageData();
		for(String[] s:list){
			flag ++;
			if(flag ==1){
				for(String s1:s){
					pds.put("CLIENT_PROBLEM_COLLECTION_ID", pd.get("CLIENT_PROBLEM_COLLECTION_ID"));
					pds.put("TYPE", 1);
					pds.put("WHY", s1);
					String WHY5_PROCESSFOUR_ID = UuidUtil.get32UUID().toString();
					pds.put("WHY5_PROCESSFOUR_ID", WHY5_PROCESSFOUR_ID);
					dao.save("Why5_ProcessfourMapper.save", pds);
					pds.clear();
				}
			}
			if(flag==2){
				for(String s2:s){
					pds.put("CLIENT_PROBLEM_COLLECTION_ID", pd.get("CLIENT_PROBLEM_COLLECTION_ID"));
					pds.put("TYPE", 2);
					pds.put("WHY", s2);
					String WHY5_PROCESSFOUR_ID = UuidUtil.get32UUID().toString();
					pds.put("WHY5_PROCESSFOUR_ID", WHY5_PROCESSFOUR_ID);
					dao.save("Why5_ProcessfourMapper.save", pds);
					pds.clear();
				}
			}
			if(flag==3){
				for(String s3:s){
					pds.put("CLIENT_PROBLEM_COLLECTION_ID", pd.get("CLIENT_PROBLEM_COLLECTION_ID"));
					pds.put("TYPE", 3);
					pds.put("WHY", s3);
					String WHY5_PROCESSFOUR_ID = UuidUtil.get32UUID().toString();
					pds.put("WHY5_PROCESSFOUR_ID", WHY5_PROCESSFOUR_ID);
					dao.save("Why5_ProcessfourMapper.save", pds);
					pds.clear();
				}
			}
		}
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("Why5_ProcessfourMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		//删除已存在
		dao.delete("Why5_ProcessfourMapper.deleteByProblemId", pd);
		
		List<String> _list1 = (List<String>) pd.get("list1");
		List<String> _list2 = (List<String>) pd.get("list2");
		List<String> _list3 =(List<String>) pd.get("list3");
		
		//遍历list   三种类型   分别存数据
		for (String string : _list1) {
			PageData pds = new PageData();
			pds.put("CLIENT_PROBLEM_COLLECTION_ID", pd.get("CLIENT_PROBLEM_COLLECTION_ID"));
			pds.put("TYPE", 1);
			pds.put("WHY", string);
			String WHY5_PROCESSFOUR_ID = UuidUtil.get32UUID().toString();
			pds.put("WHY5_PROCESSFOUR_ID", WHY5_PROCESSFOUR_ID);
			dao.save("Why5_ProcessfourMapper.save", pds);
		}
		
		for (String string : _list2) {
			PageData pds = new PageData();
			pds.put("CLIENT_PROBLEM_COLLECTION_ID", pd.get("CLIENT_PROBLEM_COLLECTION_ID"));
			pds.put("TYPE", 2);
			pds.put("WHY", string);
			String WHY5_PROCESSFOUR_ID = UuidUtil.get32UUID().toString();
			pds.put("WHY5_PROCESSFOUR_ID", WHY5_PROCESSFOUR_ID);
			dao.save("Why5_ProcessfourMapper.save", pds);
		}
		
		for (String string : _list3) {
			PageData pds = new PageData();
			pds.put("CLIENT_PROBLEM_COLLECTION_ID", pd.get("CLIENT_PROBLEM_COLLECTION_ID"));
			pds.put("TYPE", 3);
			pds.put("WHY", string);
			String WHY5_PROCESSFOUR_ID = UuidUtil.get32UUID().toString();
			pds.put("WHY5_PROCESSFOUR_ID", WHY5_PROCESSFOUR_ID);
			dao.save("Why5_ProcessfourMapper.save", pds);
		}
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("Why5_ProcessfourMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("Why5_ProcessfourMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("Why5_ProcessfourMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("Why5_ProcessfourMapper.deleteAll", ArrayDATA_IDS);
	}

	public List<PageData> findByProblemId(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("Why5_ProcessfourMapper.findByProblemId", pd);
	}
	
}

