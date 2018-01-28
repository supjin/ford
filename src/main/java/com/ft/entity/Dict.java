package com.ft.entity;

public class Dict {
	private static final long serialVersionUID = 1191696896836568009L;

	/**
	 * 普通
	 */
	public static final Integer SPECIAL4COMMON = 1;
	/**
	 * 特殊
	 */
	public static final Integer SPECIAL4ESPECIALLY = 2;

	private String label; // 标签名
	private String value; // 数据值
	private String type; // 类型
	private String remarks;// 描述
	private Integer sort; // 排序

	private Integer special; // 特别用途

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Integer getSpecial() {
		return special;
	}

	public void setSpecial(Integer special) {
		this.special = special;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
}
