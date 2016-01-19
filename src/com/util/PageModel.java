package com.util;

import java.util.List;

public class PageModel<T> {

	private List<T> list;

	private int pageSize = 1;// 每页显示条数

	private int totalRecords;// 总记录数

	@SuppressWarnings("unused")
	private int firstResult;// 从第几条数据开始查找

	private int pageNo = 1;// 当前第几页

	// 获得总数据数
	public int getListSize() {
		return list.size();
	}

	// 获取总页数
	public int getTotalPages() {
		if ((this.totalRecords + this.pageSize - 1) / this.pageSize < 1) {
			return 1;
		}
		return (this.totalRecords + this.pageSize - 1) / this.pageSize;
	}

	// 最后一页
	public int getBottomPage() {
		return this.getTotalPages();
	}

	// 第一页
	public int getFirstPage() {
		return 1;
	}

	// 上一页
	public int getPrePage() {
		if (this.pageNo <= 1) {
			return 1;
		}
		return this.pageNo - 1;
	}

	// 下一页
	public int getNextPage() {
		if (this.pageNo >= this.getBottomPage()) {
			return this.getBottomPage();
		}
		return this.pageNo + 1;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getFirstResult() {
		return (this.pageNo - 1) * this.pageSize;
	}

	public void setFirstResult(int firstResult) {
		this.firstResult = firstResult;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
}

