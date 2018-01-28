package com.ft.util;
/**
 * 
 * <p>Title: 分页接口</p>
 * <p>Description: </p>
 * <p>Company: Artopcq </P>
 * @author Dana
 * @date 2017年6月17日 上午8:49:04
 * @version V1.0
 *
 */
public abstract interface Paginable {

	public abstract int getTotalCount();

	public abstract int getTotalPage();

	public abstract int getPageSize();

	public abstract int getPageNo();

	public abstract boolean isFirstPage();

	public abstract boolean isLastPage();

	public abstract int getNextPage();

	public abstract int getPrePage();

}
