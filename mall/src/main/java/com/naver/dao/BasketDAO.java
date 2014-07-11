package com.naver.dao;

import org.springframework.web.bind.annotation.ModelAttribute;

import com.naver.model.BasketBean;

public interface BasketDAO {

	BasketBean getBasketList(String member_id);//해당 고객아이디로 바스켓 조회

	BasketBean getBasketGoods(BasketBean bg); //해당아이디의 장바구니 내 해당상품조회

	int addQuantity(BasketBean bg);//상품수량 추가

	int insGoods(BasketBean bg);//상품신규추가


}