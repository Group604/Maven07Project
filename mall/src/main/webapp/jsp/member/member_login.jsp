<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<metacharset="UTF-8">
<title>관리자 메인화면</title>
<link rel="stylesheet" type="text/css" href="./css/index.css" />
<link rel="stylesheet" type="text/css" href="./css/bbs.css" />
<link rel="stylesheet" type="text/css" href="./css/member.css" />

<link href="css/main4.5-2.css" rel="stylesheet" type="text/css">
<link href="css/basic-jquery-slider.css" rel="stylesheet" type="text/css" media="screen">
<script type="text/javascript" src="scripts/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="scripts/basic-jquery-slider.js"></script>
<script>
function searchCategory() {
	var find_category=document.getElementById("find_category").valueOf();
	var find_level=document.getElementById("find_level").valueOf();
	var find_name=document.getElementById("find_name").valueOf();
	var limit = document.getElementById ("limit").valueOf();

		window.location.href="Index.do?category="+find_category.value+"&page=1&level="+find_level.value+"&find_name="+find_name.value+"&limit="+limit.value;
		alert("Index.do?category="+find_category.value+"&page=1&level="+find_level.value+"&find_name="+find_name.value+"&limit="+limit.value);
}
</script>
<script>
function GetSelected(){
	var find_category=document.getElementById("find_category").valueOf();
	var find_level=document.getElementById("find_level").valueOf();
	var find_name=document.getElementById("find_name").valueOf();
	var limit = document.getElementById ("limit").valueOf();

		window.location.href="Index.do?category="+find_category.value+"&page=1&level="+find_level.value+"&find_name="+find_name.value+"&limit="+limit.value;
		alert("Index.do?category="+find_category.value+"&page=1&level="+find_level.value+"&find_name="+find_name.value+"&limit="+limit.value);

		window.location.href="Index.do?category="+find_category.value+"&page=1"+"&find_name="+find_name.value+"&limit="+limit.value;

}

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

<div id="outer_wrap"><!-- outer_wrap -->

<div id="aMain_wrap"><!-- aMain_wrap ui -->

<header><!-- 관리자 상단 -->

<!-- 상단 메뉴 -->
<div id="aMain_logo"><img src="images/admin/admin_logo.png" alt="adminlogo" width="76" height="67"> </div><!-- 로고 -->

	<div id="head_link">
		<ul>
			<li><a href="MemberLogin.do" onfocus="this.blur();">로그인</a>
			</li>
			<li><a href="MemberJoin.do" onfocus="this.blur();">회원가입</a>
			</li>
			<li><a href="BasketList.do" onfocus="this.blur();">장바구니</a>
			</li>
			<li><a href="Customer.do" onfocus="this.blur();">고객센터</a>
			</li>
			<li><a href="OrderList.do" onfocus="this.blur();">주문배송</a></li>
			<li><a href="AdminLogin.do" class="no_line" onfocus="this.blur();" style="font-weoght:8">Admin</a>
			</li>
			<br>
		</ul>
	</div>

<br>


</header><!-- header 종료 -->

<div class="clear"></div>

<aside><!-- aside 시작 -->
<nav>
	<ul>
	    <li><h3>커피구분</h3>
	       <ul>
             <li><a href="list_page.php">컵 사이즈</a></li>
             <li><a href="#">커피 강도</a></li>
             <li><a href="#">주요아로마</a></li>
             <li><a href="#">제품군</a></li>
       	  </ul>
         </li>    
	   <li><h3>커피머신</h3>
	      <ul>
		     <li><a href="#">라티시마</a></li>
             <li><a href="#">시티즈</a></li>
             <li><a href="#">픽시</a></li>
             <li><a href="#">U(유)</a></li>
             <li><a href="#">inissia</a></li>
          </ul>
        </li>

     </ul>
     
</nav> 
 <div class="clear"></div>   

    <div id="banner">
      <img src="images/banners/you-have-just-bought-a-machine-mdd.jpg" width="190" height="163">
    </div>
    <div id="notice">
    <h2>공지사항</h2>
        <ul>
            <li><a href="#">여긴 공지사항입니다.</a></li>
            <li><a href="#">여긴 공지사항입니다.</a></li>
            <li><a href="#">여긴 공지사항입니다.</a></li>
            <li><a href="#">여긴 공지사항입니다.</a></li>
            <li><a href="#">여긴 공지사항입니다.</a></li>            
        </ul>
    </div> 
    <!-- <div id="banner">
      <img src="images/banners/slate.jpg" width="190" height="362">
    </div> -->
    <div id="banner">
      <img src="images/banners/custom.jpg" width="190" height="104">
    </div>
    <div id="banner">
      <img src="images/banners/faq.jpg" width="190" height="69">
    </div>
</aside><!-- /aside 종료 -->

<!-- 관리자 메인내용 -->
<article>
<div id="aMain_cont">

<div id="login_wrap">
		<form method="post" action="MemberLoginOk.do" onsubmit="return login_check();">
			<table id="login_t" align="center" margin="auto">
				<tr>
					<th>회원 아이디</th>
					<td>
					<input name="member_id" id="login_id" size="14" class="box" tabindex="1"/>
					</td>
					
				</tr>
				<tr>
					<th>회원 비밀번호</th>
					<td>
					<input type="password" name="member_pwd" id="login_pwd" size="14" class="box" tabindex="2" />
					</td>
					</th>
				</tr>
			<input type="submit" value="로그인" class="input_s" />
			</table>
			
			
			<div id="login_menu">
			<input type="button" value=" 아이디찾기 " class="input_b"onclick="openConfirmId(this.form)" />
			<input type="button" value="비번찾기" class="input_b" onclick="pwd_find();" />
			<input type="button" value="회원가입" class="input_b" onclick="location='MemberJoin.do'"/>
			</div>
		</form>
	</div>



</div>



</article>

<div class="clear"></div>

<footer>
        <ul>
            <li><a href="#">회사소개</a></li>
            <li><a href="#">이용약관</a></li>
            <li><a href="#">개인정보취급방침</a></li>
            <li><a href="#">광고/이벤트 문의</a></li>
            <li><a href="#">고객만족센터</a></li>
            <li class="no_line"><a href="#">찾아오시는길</a></li>
        </ul>
        <div class="clear"></div>
        <a href="./"><img src="images/foot_img.png" width="68" height="62" alt="footimg"></a>
        <div id="foot_note">
	          고객상담 전화주문:02-704-1711 사업자등록번호 :220-95-00629  대표이사: 홍길동  통신판매업 서울 제 000000호<br>
	          개인정보관리책임자:admin 분쟁조정기관표시 : 소비자보호원, 전자거래분쟁중재위원회<br>
	          이메일주소무단수집거부 help@themall.com<br>
	          Copyright (c) 2014 themall Corp. All right Reserved.
        </div>
</footer>  

</div><!-- aMain_wrap 끝 -->
<!-- 스티키 윈도우내용  -->
<div id="sticky">
	<ul>
    	<li><a href="#"><img src="images/facebook_icon.png" width="24" height="24"> 페이스북</a></li>
        <li><a href="#"><img src="images/twitter_icon.png" width="24" height="24"> 트위터</a></li>
        <li><a href="#"><img src="images/rss_icon.png" width="24" height="24"> RSS 피드</a></li>        
	</ul>
    <div class="recent">
	    <h3>최근 본 상품 </h3>
        <ul>
        	<li><img src="images/products/book/html5_icon.jpg" width="75" height="95"></li>
            <li><img src="images/products/book/jquery_icon.jpg" width="75" height="95"></li>
         </ul> 	
    </div>

</div><!-- outlet_wrap -->
</body>
</html>