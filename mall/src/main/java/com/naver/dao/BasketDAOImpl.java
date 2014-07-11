package com.naver.dao;

import org.apache.ibatis.session.SqlSession;

import com.naver.model.BasketBean;

public class BasketDAOImpl implements BasketDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}//setter DI

	/* 장바구니 조회 */
	public BasketBean getBasketList(String member_id) {
		return sqlSession.selectOne("Basket.basket_list", member_id);
	}

	public BasketBean getBasketGoods(BasketBean bg) {
		return (BasketBean) sqlSession.selectOne("Basket.basket_item", bg);	
	}

	/* 장바구니 상품 수량 */
	public int addQuantity(BasketBean bg) {
		return sqlSession.update("Basket.basket_add", bg);
	}

	/* 장바구니 상품 추가 */
	public int insGoods(BasketBean bg) {
		return sqlSession.insert("Basket.basket_ins", bg);
	}


}
