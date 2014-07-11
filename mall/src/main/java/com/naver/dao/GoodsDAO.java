package com.naver.dao;

import java.util.List;

import com.naver.model.GoodsBean;

public interface GoodsDAO {

	List<GoodsBean> getGoodsList(GoodsBean gb);//

	int getListCount(GoodsBean gb);//검색 전 후 상품 건수

	GoodsBean getGoodsCont(int goods_num);//상품정보
	

}
