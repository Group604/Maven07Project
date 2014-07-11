package com.naver.dao;

import org.apache.ibatis.session.SqlSession;

public class OrderDAOImpl implements OrderDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}//setter DI
}
