package com.naver.action;

import org.springframework.stereotype.Controller;

import com.naver.dao.OrderDAO;

@Controller
public class OrderAction {

	private OrderDAO orderService;

	public void setOrderService(OrderDAO orderService) {
		this.orderService = orderService;
	}
	
	
}
