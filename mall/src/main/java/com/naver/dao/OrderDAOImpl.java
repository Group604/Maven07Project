package com.naver.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.naver.model.BasketBean;
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
/*	public int addOrder(List<OrderBean> olist) {
	    return sqlSession.insert("Order.oder_ins", olist);
	}
*/
	public int addOrder(List<OrderBean> olist) {
		return sqlSession.insert("Order.oder_ins", olist);
	}

	public void addBasket(List<BasketBean> orderlist) {
		sqlSession.insert("Order.order_test",orderlist);
		
	}

	public void addT(List<String> test) {
		sqlSession.insert("Order.tt",test);
		
	}

	public void addtt(String string) {
		sqlSession.insert("Order.ttt", string);
		
	}

	public void addBasket1(BasketBean bb) {
		sqlSession.insert("Order.test", bb);
	}

	public void insOrder(OrderBean orderinfo) {
		sqlSession.insert("Order.oist", orderinfo);		
	}

	public List<Map<Integer, String>> sel_stat() {
	   return sqlSession.selectList("Order.order_stat");
	}


}
