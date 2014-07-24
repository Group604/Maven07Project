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

<div id="head_search">
    	<form>
       <select name="find_category" id="find_category" size="1">
      	 <c:forEach var="ls" items="${clist}">
			<option value="${ls.categoryname}">${ls.categorydesc}</option>
		 </c:forEach>
	   </select>농도:
      <select name="find_level" id="find_level" size="1">
		 <c:forEach var="lv" items="${lvlist}">
		    <option value="${lv.level_no}">${lv.level_desc}</option>
		</c:forEach>
	  </select>
	  <input name="input" type="text" class="main_input">
	  <input name="search" type="button" value="검 색" class="btn1">
        </form>
    </div>

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

<div class="clear"></div>