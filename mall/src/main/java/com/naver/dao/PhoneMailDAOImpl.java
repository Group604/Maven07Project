package com.naver.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.naver.model.PhoneMailBean;

public class PhoneMailDAOImpl implements PhoneMailDAO{

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}//setter DI

	public List<PhoneMailBean> getPhoneList() {
		return sqlSession.selectList("PhoneMail.phone_list");
	}//전화번호 앞 번호 리스트	

	public List<PhoneMailBean> getEmailList() {
		return sqlSession.selectList("PhoneMail.email_list");
	}//email도메인 리스트
	
}
