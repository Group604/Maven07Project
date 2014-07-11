package com.naver.dao;

import java.util.List;

import com.naver.model.NewzipcodeBean;

public interface ZipcodeDAO {

	List<NewzipcodeBean> list(String search);
	
	
}

