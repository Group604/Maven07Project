package com.naver.dao;

import java.util.List;

import com.naver.model.GoodsBean;

public interface AdminGoodsDAO {

	List<GoodsBean> getGoodsList();//상품리스트 조회

	int insertGoods(GoodsBean b);//상품등록

	GoodsBean getGoodsCont(int goods_num);//상품정보 가져오기

	int updateGoods(GoodsBean b);//상품수정

	int delGoods(int goods_num);//상품삭제
	
}
