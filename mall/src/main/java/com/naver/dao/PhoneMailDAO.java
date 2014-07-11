package com.naver.dao;

import java.util.List;

import com.naver.model.PhoneMailBean;

public interface PhoneMailDAO {

	List<PhoneMailBean> getPhoneList();//전화번호 리스트

	List<PhoneMailBean> getEmailList();//email 리스트

}
