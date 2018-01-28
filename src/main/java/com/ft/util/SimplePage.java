package com.ft.util;

import java.io.Serializable;

/**
 * 
 * <p>
 * Title: 分页实现类
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Company: Artopcq
 * </P>
 * 
 * @author Dana
 * @date 2017年6月17日 上午8:50:51
 * @version V1.0
 *
 */
public class SimplePage implements Serializable, Paginable {

	private static final long serialVersionUID = -4887182711670457565L;
	public static final int DEF_COUNT = 20;
	protected int totalCount = 0;
	protected int pageSize = 20;
	protected int pageNo = 1;

	public static int cpn(Integer pageNo) {
		return (pageNo == null) || (pageNo.intValue() < 1) ? 1 : pageNo.intValue();
	}

	public SimplePage() {
	}

	public SimplePage(int pageNo, int pageSize, int totalCount) {
		setTotalCount(totalCount);
		setPageSize(pageSize);
		setPageNo(pageNo);
		adjustPageNo();
	}

	public void adjustPageNo() {
		if (this.pageNo == 1) {
			return;
		}
		int tp = getTotalPage();
		if (this.pageNo > tp)
			this.pageNo = tp;
	}

	public int getPageNo() {
		return this.pageNo;
	}

	public int getPageSize() {
		return this.pageSize;
	}

	public int getTotalCount() {
		return this.totalCount;
	}

	public int getTotalPage() {
		int totalPage = this.totalCount / this.pageSize;
		if ((totalPage == 0) || (this.totalCount % this.pageSize != 0)) {
			totalPage++;
		}
		return totalPage;
	}

	public boolean isFirstPage() {
		return this.pageNo <= 1;
	}

	public boolean isLastPage() {
		return this.pageNo >= getTotalPage();
	}

	public int getNextPage() {
		if (isLastPage()) {
			return this.pageNo;
		}
		return this.pageNo + 1;
	}

	public int getPrePage() {
		if (isFirstPage()) {
			return this.pageNo;
		}
		return this.pageNo - 1;
	}

	public void setTotalCount(int totalCount) {
		if (totalCount < 0)
			this.totalCount = 0;
		else
			this.totalCount = totalCount;
	}

	public void setPageSize(int pageSize) {
		if (pageSize < 1)
			this.pageSize = 20;
		else
			this.pageSize = pageSize;
	}

	public void setPageNo(int pageNo) {
		if (pageNo < 1)
			this.pageNo = 1;
		else
			this.pageNo = pageNo;
	}

}
