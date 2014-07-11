package com.naver.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.naver.model.GoodsBean;

public class GoodsDAOImpl implements GoodsDAO{

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}//setter DI

	/* 검색 전 후 카운트 */
	public int getListCount(GoodsBean gb) {
		return this.sqlSession.selectOne("Goods.goods_count",gb);
	}
	
	/* 검색 전 후 목록 */ 
	public List<GoodsBean> getGoodsList(GoodsBean gb) {
		return sqlSession.selectList("Goods.goods_list", gb);
	}

	/* 상품 정보 */
	public GoodsBean getGoodsCont(int goods_num) {
		return sqlSession.selectOne("Goods.goods_cont", goods_num);
	}
	

}
