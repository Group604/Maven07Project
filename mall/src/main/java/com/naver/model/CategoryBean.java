package com.naver.model;

public class CategoryBean {

	/* 카테고리 */
	private String categoryname;
	private String categorydesc;
	/* 농도 레벨 */
	private int level_no;
	private String level_desc;
	
	
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public String getCategorydesc() {
		return categorydesc;
	}
	public void setCategorydesc(String categorydesc) {
		this.categorydesc = categorydesc;
	}
	
	public int getLevel_no() {
		return level_no;
	}
	public void setLevel_no(int level_no) {
		this.level_no = level_no;
	}
	public String getLevel_desc() {
		return level_desc;
	}
	public void setLevel_desc(String level_desc) {
		this.level_desc = level_desc;
	}
	
	
	
}
