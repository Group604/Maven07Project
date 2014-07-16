package com.naver.dao;

import java.util.List;
import java.util.Map;

import com.naver.model.BasketBean;
import com.naver.model.OrderBean;

public interface OrderDAO {

	int getOrderCount(String member_id);//회원주문내역 상품수

	List<OrderBean> getOrderList(String member_id);//회원주문상품리스트 가져오기

	int addOrder(List<OrderBean> olist);//회원주문내역 추가

	void addBasket1(BasketBean bb);//테스트

	void addT(List<String> test);//테스트 

	void addtt(String string);//

	void insOrder(OrderBean orderinfo);//

	List<Map<Integer, String>> sel_stat();
	

}
