package com.ft.service.system.attachment;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.util.PageData;


@Service("attachmentService")
public class AttachmentService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("AttachmentMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("AttachmentMapper.delete", pd);
	}
	/*
	* 删除
	*/
	public void deleteProcess(PageData pd)throws Exception{
		dao.delete("AttachmentMapper.deleteProcess", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("AttachmentMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("AttachmentMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("AttachmentMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AttachmentMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("AttachmentMapper.deleteAll", ArrayDATA_IDS);
	}

	public void updatefile(PageData pd) throws Exception {
		//删除
		String PROCESS_ID = pd.getString("PROCESS_ALL_ID");//每一步都传当前步骤的ID
		
		PageData pda = pd;
		
		pda.put("PROCESSID", PROCESS_ID);
		dao.delete("AttachmentMapper.deleteProcess", pda);
		
		// 将新的附件保存
		String accessory = pd.get("ATTACHMENT_URL").toString();
		String[] array = accessory.split(";");
		if (StringUtils.isNotBlank(accessory)) {
			for (String str : array) {
				PageData pds = new PageData(1);
				String realName = str.substring(0, str.indexOf(":"));
				String serverName = str.substring(str.indexOf(":") + 1,
						str.length());
				pds.put("ATTACHMENT_NAME", realName);
				pds.put("ATTACHMENT_URL", serverName);
				pds.put("ATTACHMENT_ID", this.getUUID());
				pds.put("PROCESSID", PROCESS_ID);
				pds.put("CLIENT_PROBLEM_COLLECTION_ID",
				pd.getString("CLIENT_PROBLEM_COLLECTION_ID"));
				dao.save("AttachmentMapper.save", pds);
			}
		}
		//增加
	}
	
	public static String getUUID() {  
        return UUID.randomUUID().toString().replace("-", "");  
    } 
}

