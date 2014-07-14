package com.naver.dao;

import java.util.List;

import com.naver.model.OrderBean;

public interface OrderDAO {

	int getOrderCount(String member_id);//회원주문내역 상품수

	List<OrderBean> getOrderList(String member_id);//회원주문상품리스트 가져오기

	int addOrder(List<OrderBean> olist);//회원주무내역 추가
	

}
