<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<metacharset="UTF-8">
<title>관리자 메인화면</title>
<link rel="stylesheet" type="text/css" href="./css/admin.css" />
<link rel="stylesheet" type="text/css" href="./css/member.css" />
<link rel="stylesheet" type="text/css" href="./css/bbs.css" />
<script src="./js/jquery.js"></script>
<script>
	function login_check() {
		if ($.trim($("#login_id").val()) == "") {
			alert("로그인 아이디를 입력하세요!");
			$("#login_id").val("").focus();
			return false;
		}
		if ($.trim($("#login_pwd").val()) == "") {
			alert("로그인 비번을 입력하세요!");
			$("#login_pwd").val("").focus();
			return false;
		}
	}
	
	//비번찾기
	function pwd_find(){
		$url="PwdFind.do";//jQuery변수에 공지창 경로 파일명을 저장
		window.open($url,"비번찾기","width=300px,height=300px,scrollbars=yes");
	}
	/* 자바스크립트에서 window객체의 open(공지창 경로 파일명,공지창이름,공지창 속성)
	 * 메서드는 폭이 300,높이가 300픽셀,스크롤바가 생성되는 새로운 공지창을 만들어준다.
	 */

	 //아이디 찾기
	 function openConfirmId(loginform){	
			$url="MemberFind.do";
			window.open($url, "confirm","width=450px,height=300px,scrollbars=yes");
		}
</script>

</head>
<body>
	<!-- 관리자 메인 ui -->
	<div id="aMain_wrap">
		<!-- 관리자 상단 -->
		<div id="aMain_header">
			<!-- 회사 로고 -->
			<div id="aMain_logo">
				<a href="admin_main.do" onfocus="this.blur();"> <img
					src="./images/admin/admin_logo.gif" />
				</a>
			</div>
			<!-- 상단 메뉴 -->
			<!-- <div id="aMain_menu">
				<ul>
					<li><a href="admin_bbs_list.do" onfocus="this.blur();">자료실</a>
					</li>
					<li><a href="admin_board_list.do" onfocus="this.blur();">게시판</a>
					</li>
					<li><a href="admin_member_list.do" onfocus="this.blur();">회원관리</a>
					</li>
					<li><a href="admin_gongji_list.do" onfocus="this.blur();">공지사항</a>
					</li>
				</ul>
			</div> -->
			<!-- 관리자 상단 우측메뉴 -->
			<div id="aMain_right">
				<div id="login_wrap">
		<form method="post" action="MemberLoginOk.do" onsubmit="return login_check();">
			<table id="login_t">
				<tr>
					<th>아이디</th>
					<td>
					<input name="member_id" id="login_id" size="14" class="box" tabindex="1"/>
					</td>
					<th colspan="2">
					<input type="submit" value="로그인" class="input_s" />
					</th>
				</tr>
				<tr>
					<th>비번</th>
					<td>
					<input type="password" name="member_pwd" id="login_pwd" size="14" class="box" tabindex="2" />
					</td>
					</th>
				</tr>
			</table>
			<div id="login_menu">
			<input type="button" value="아이디찾기" class="input_b"onclick="openConfirmId(this.form)" />
			<input type="button" value="비번찾기" class="input_b" onclick="pwd_find();" />
			<input type="button" value="회원가입" class="input_b" onclick="location='MemberJoin.do'"/>
			</div>
		</form>
	</div>
			</div>
		</div>

		<div class="clear"></div>
		<!-- 관리자 메인내용 -->

	         <div>
	           <p>
	           . .
	           . .
	           . .
	           . .
	           . .
	           . .
	           </p>
	         </div>
	         
			<!-- 관리자 하단 부분 -->
		<div id="aMain_footer">
			<h2 class="afooter_title">서울시 마포구 대흥동 중앙빌딩....TEL)02-999-9999</h2>
		</div>

	</div>
</body>
</html>
