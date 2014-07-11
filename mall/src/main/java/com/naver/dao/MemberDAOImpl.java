package com.naver.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.naver.model.MemberBean;
import com.naver.model.ZipcodeBean;

public class MemberDAOImpl implements MemberDAO {
	private SqlSession sqlSession;

	// mybatis 쿼리문 실행 변수.

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}// setter DI 설정

	/* 회원 검색 */
	public MemberBean findId(MemberBean member) {
		return sqlSession.selectOne("Member.find_member", member);
	}

	/* 비번 검색 */
	public MemberBean pwd_find(MemberBean pm) {
		return sqlSession.selectOne("Member.pwd_find", pm);
	}

	/* 임시비번수정 */
	public void edit_pm(MemberBean rm) {
		sqlSession.update("Member.pwd_edit", rm);
	}

	/* 회원 체크 */
	public int member_check(MemberBean mb) {
		return sqlSession.selectOne("Member.member_check", mb);
	}

	/* 우편번호 검색+주소 검색 */
	public List<ZipcodeBean> zip(String dong) {
		return sqlSession.selectList("Member.zip_list", dong);
	}

	/* 가입 아이디 중복 체크 */
	public MemberBean idcheck(String join_id) {
		return sqlSession.selectOne("Member.id_check", join_id);
	}

	/* 가입 회원 저장 */
	public void insertMember(MemberBean m) {
		sqlSession.insert("Member.member_in", m);
	}

	/* 로그인 인증 */
	public MemberBean loginCheck(String login_id) {
	  return sqlSession.selectOne("Member.login_check", login_id); 
		
	}

	/* 회원 정보 수정 */
	public int editMember(MemberBean eb) {
		return sqlSession.update("Member.member_edit", eb);
	}

	public int delMember(MemberBean dm) {
		return sqlSession.update("Member.member_del", dm);
	}

	public int IsAdm(String id) {
		return sqlSession.selectOne("Member.is_adm", id);
	}

	/*
	 * public List<PhoneBean> getphoneList() { return
	 * this.sqlSession.selectList("Member.phone_list"); }
	 * 
	 * public List<EmailBean> getemailList() { return
	 * this.sqlSession.selectList("Member.email_list"); }
	 * 
	 * 
	 * 
	 * 우편번호 검색+주소 검색 public List<ZipcodeBean> zip(String dong) { return
	 * sqlSession.selectList("Member.zip_list",dong); }
	 * 
	 * 회원저장 public void insertMember(MemberBean m) {
	 * sqlSession.insert("Member.member_in", m); }
	 * 
	 * 비번 찾기 public MemberBean pwd_find(MemberBean pm) { return
	 * sqlSession.selectOne("Member.pwd_find", pm); //pwd_find는 select 아이디 이름 }
	 * 
	 * 
	 * //로그인 인증 public MemberBean loginCheck(String login_id) { return
	 * sqlSession.selectOne("Member.logincheck", login_id); }
	 * 
	 * //정보수정 public void editMember(MemberBean eb) {
	 * sqlSession.update("Member.mem_edit", eb); }
	 * 
	 * //회원탈퇴 public void delMember(MemberBean dm) {
	 * sqlSession.update("Member.mem_del", dm); }
	 */

}
