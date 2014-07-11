package com.naver.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.naver.model.GoodsBean;

public class AdminGoodsDAOImpl implements AdminGoodsDAO{

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}//setter DI

	public List<GoodsBean> getGoodsList() {
	 return this.sqlSession.selectList("AdminGoods.goods_list");
	}

	//상품 등록
	public int insertGoods(GoodsBean b) {
	 return this.sqlSession.insert("AdminGoods.goods_insert", b);
	}

	//상품 정보 가져오기
	public GoodsBean getGoodsCont(int goods_num) {
	 return this.sqlSession.selectOne("AdminGoods.goods_cont", goods_num);
	}

	//상품 정보 수정
	public int updateGoods(GoodsBean b) {
		return this.sqlSession.update("AdminGoods.goods_update", b);
	}

	//상품 삭제
	public int delGoods(int goods_num) {
		return this.sqlSession.delete("AdminGoods.goods_delete", goods_num);
	}

		
	
}


/*
package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import admin.model.GoodsBean;

import com.member.model.MemberBean;



public class AdminGoodsDAO {
	DataSource ds;
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;

	String GoodsListSql="select * from goods order by goods_num";
	String insertGoodsSql="insert into goods values(goods_no_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate)";
	String GoodsContSql="select * from goods where goods_num=?";
	String GoodsModifySql="update goods set goods_category=?,goods_name=?,goods_price=?,goods_color=?,goods_amount=?,"
					    + "goods_size=?,goods_content=?,goods_best=? where goods_num=?";
	String GoodsDelSql="delete goods where goods_num=?";
	String AdminPassSql="select member_pw from member where member_id='admin'";
	
	public AdminGoodsDAO() {
		try{
			Context initCtx=new InitialContext();
			ds= (DataSource) initCtx.lookup("java:comp/env/jdbc/xe");
		}catch(Exception ex){
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}

	public List<GoodsBean> getGoodsList() {
		  List<GoodsBean> glist=new ArrayList<>();
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(GoodsListSql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				GoodsBean b=new GoodsBean();
				b.setGOODS_NUM(rs.getInt("goods_num"));
				b.setGOODS_CATEGORY(rs.getString("goods_category"));
				b.setGOODS_NAME(rs.getString("goods_name"));
				b.setGOODS_CONTENT(rs.getString("goods_content"));
				b.setGOODS_SIZE(rs.getString("goods_size"));
				b.setGOODS_COLOR(rs.getString("goods_color"));
				b.setGOODS_AMOUNT(rs.getInt("goods_amount"));
				b.setGOODS_PRICE(rs.getInt("goods_price"));
				b.setGOODS_IMAGE(rs.getString("goods_image"));
				b.setGOODS_BEST(rs.getInt("goods_best"));
				b.setGOODS_DATE(rs.getString("goods_date"));
				
				glist.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return glist;
	}

	public int insertGoods(GoodsBean agb) {
		int result=0;
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(insertGoodsSql);
			
			pstmt.setString(1, agb.getGOODS_CATEGORY());
			pstmt.setString(2, agb.getGOODS_NAME());
			pstmt.setString(3, agb.getGOODS_CONTENT());
			pstmt.setString(4, agb.getGOODS_SIZE());
			pstmt.setString(5, agb.getGOODS_COLOR());
			pstmt.setInt(6, agb.getGOODS_AMOUNT());
			pstmt.setInt(7, agb.getGOODS_PRICE());
			pstmt.setString(8, agb.getGOODS_IMAGE());
			pstmt.setInt(9, agb.getGOODS_BEST());
			
			result = pstmt.executeUpdate();
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public GoodsBean getGoodsCont(int no) {
		GoodsBean gb=new GoodsBean();
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(GoodsContSql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()){
				gb.setGOODS_NUM(rs.getInt("goods_num"));
				gb.setGOODS_CATEGORY(rs.getString("goods_category"));
				gb.setGOODS_NAME(rs.getString("goods_name"));
				gb.setGOODS_CONTENT(rs.getString("goods_content"));
				gb.setGOODS_SIZE(rs.getString("goods_size"));
				gb.setGOODS_COLOR(rs.getString("goods_color"));
				gb.setGOODS_AMOUNT(rs.getInt("goods_amount"));
				gb.setGOODS_PRICE(rs.getInt("goods_price"));
				gb.setGOODS_IMAGE(rs.getString("goods_image"));
				gb.setGOODS_BEST(rs.getInt("goods_best"));
				
				return gb;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	//상품수정
	public int modifyGoods(GoodsBean agb) {
		int result = 0;
		
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(GoodsModifySql);
			
			pstmt.setString(1, agb.getGOODS_CATEGORY());
			pstmt.setString(2, agb.getGOODS_NAME());
			pstmt.setInt(3, agb.getGOODS_PRICE());
			pstmt.setString(4, agb.getGOODS_COLOR());
			pstmt.setInt(5, agb.getGOODS_AMOUNT());
			pstmt.setString(6, agb.getGOODS_SIZE());
			pstmt.setString(7, agb.getGOODS_CONTENT());
			pstmt.setInt(8, agb.getGOODS_BEST());
			pstmt.setInt(9, agb.getGOODS_NUM());
			result = pstmt.executeUpdate();
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception ex) {}
		}
		return 0;
	}//modifyGoods()

	//상품삭제
	public int deleteGoods(int no) {
		int result=0;
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(GoodsDelSql);
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public MemberBean getAdminPass() {
		MemberBean mbpass=new MemberBean();
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(AdminPassSql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				mbpass.setMEMBER_PW(rs.getString("member_pw"));
			}
			return mbpass;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
}
*/