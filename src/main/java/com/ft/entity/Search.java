package com.ft.entity;

import java.util.Date;

/**
 * 
 * <p>
 * Title: 搜索实体类
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Company: Artopcq
 * </P>
 * 
 * @author Dana
 * @date 2017年6月15日 下午4:11:12
 * @version V1.0
 *
 */
public class Search {
	private String id;
	private String title;
	private Date createDate;
	private String searchType;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

}
