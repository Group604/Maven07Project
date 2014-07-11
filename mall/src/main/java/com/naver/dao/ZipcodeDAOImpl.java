package com.naver.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.naver.model.NewzipcodeBean;

public class ZipcodeDAOImpl implements ZipcodeDAO{

	private SqlSession sqlSession;
	//mybatis 쿼리문 실행 변수.
	

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	public List<NewzipcodeBean> list(String search) {
		return sqlSession.selectList("Zipcode.zip_search", search);
	}

	/*public List<Zipcode> list(String search) {
		return sqlSession.selectOne(arg0, arg1);
	}*/
}
