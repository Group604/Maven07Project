package com.naver.dao;

import java.util.List;

import com.naver.model.CategoryBean;

public interface CategoryDAO {

	List<CategoryBean> getCategoryList();//카테고리 리스트 

	List<CategoryBean> getLevels();//커피농도 리스트
	

}
