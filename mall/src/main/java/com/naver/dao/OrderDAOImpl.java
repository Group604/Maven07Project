package com.naver.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.naver.model.OrderBean;

public class OrderDAOImpl implements OrderDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}//setter DI

	/* 주문예정 상품 수 */
	public int getOrderCount(String member_id) {
		return sqlSession.selectOne("Order.order_cnt",member_id);
	}
	/* 회원주문상품 리스트 가져오기 */
	public List<OrderBean> getOrderList(String member_id) {
		return sqlSession.selectList("Order.order_list", member_id);
	}

	/* 회원주문 추가 */
	public int addOrder(List<OrderBean> olist) {
	    return sqlSession.insert("Order.oder_ins", olist);
	}


}
