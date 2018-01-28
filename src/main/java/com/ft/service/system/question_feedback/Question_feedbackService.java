package com.ft.service.system.question_feedback;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.http.conn.scheme.PlainSocketFactory;
import org.springframework.stereotype.Service;

import com.ft.dao.DaoSupport;
import com.ft.entity.Page;
import com.ft.service.system.plan.PlanService;
import com.ft.util.PageData;

import sun.net.www.content.text.plain;

@Service("question_feedbackService")
public class Question_feedbackService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name = "planService")
	private PlanService planService;

	/*
	 * 新增
	 */
	public void save(PageData pd) throws Exception {
		dao.save("Question_feedbackMapper.save", pd);
	}

	/*
	 * 删除
	 */
	public void delete(PageData pd) throws Exception {
		dao.delete("Question_feedbackMapper.delete", pd);
	}

	/*
	 * 修改
	 */
	public void edit(PageData pd) throws Exception {
		dao.update("Question_feedbackMapper.edit", pd);
	}

	/*
	 * 列表
	 */
	// public List<PageData> list(Page page)throws Exception{
	// return
	// (List<PageData>)dao.findForList("Question_feedbackMapper.datalistPage",
	// page);
	// }
	public List<PageData> list(Page page) throws Exception {
		List<PageData> list = (List<PageData>) dao.findForList("Question_feedbackMapper.listAll",page);
		return list;
	}

	/*
	 * 列表(全部)
	 */
	public List<PageData> listAll(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("Question_feedbackMapper.listAll", pd);
	}

	/*
	 * 通过id获取数据
	 */
	public PageData findById(PageData pd) throws Exception {
		return (PageData) dao.findForObject("Question_feedbackMapper.findById", pd);
	}
	/*
	 * 通过问题id获取数据
	 */
	public PageData findByCliId(PageData pd) throws Exception {
		return (PageData) dao.findForObject("Question_feedbackMapper.findByCliId", pd);
	}

	/*
	 * 通过问题id获取数据
	 */
	public List<PageData> findByProblemId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("Question_feedbackMapper.listfindByProblemId", pd);
	}

	/*
	 * 批量删除
	 */
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("Question_feedbackMapper.deleteAll", ArrayDATA_IDS);
	}
	public List<PageData> PutLeftTime(List<PageData > pds,PageData pdproblem) throws Exception{
		List<PageData> pdstmp  = new ArrayList<PageData>();
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd");
		long from  = 0;
		Date todate =(Timestamp) pdproblem.get("OCCURRENCEDATE");
		long to =todate.getTime();
			 from=new Date().getTime();
			
			
			String LEFTTIME1 =new Integer((int) ((to+2*(1000*60*60*24)-from)/(1000*60*60*24))).toString();//2天
			String LEFTTIME2 =new Integer((int) ((to+5*(1000*60*60*24)-from)/(1000*60*60*24))).toString();//5天

			pds.get(0).put( "LEFTTIME", LEFTTIME1);
			pds.get(1).put("LEFTTIME", LEFTTIME2);
		
		
		return pds;
		
	}


}
