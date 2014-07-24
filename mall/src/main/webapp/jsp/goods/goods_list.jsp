<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<metacharset="UTF-8">
<title>관리자 메인화면</title>
<link rel="stylesheet" type="text/css" href="./css/admin.css" />
<link rel="stylesheet" type="text/css" href="./css/bbs.css" />

<script>
function searchCategory() {
	var find_category=document.getElementById("find_category").valueOf();
	var find_level=document.getElementById("find_level").valueOf();
	var find_name=document.getElementById("find_name").valueOf();
	var limit = document.getElementById ("limit").valueOf();
/* 	if (find_level!="0") { */
		window.location.href="GoodsList.do?category="+find_category.value+"&page=1&level="+find_level.value+"&find_name="+find_name.value+"&limit="+limit.value;
		alert("GoodsList.do?category="+find_category.value+"&page=1&level="+find_level.value+"&find_name="+find_name.value+"&limit="+limit.value);
/* 	} else {
		window.location.href="GoodsList.do?category="+find_category+"&page=1"+"&find_name="+find_name;
	} */
}
</script>
<script>
function GetSelected(){
	var find_category=document.getElementById("find_category").valueOf();
	var find_level=document.getElementById("find_level").valueOf();
	var find_name=document.getElementById("find_name").valueOf();
	var limit = document.getElementById ("limit").valueOf();
	/* if (find_level!="0") { */
		window.location.href="GoodsList.do?category="+find_category.value+"&page=1&level="+find_level.value+"&find_name="+find_name.value+"&limit="+limit.value;
		alert("GoodsList.do?category="+find_category.value+"&page=1&level="+find_level.value+"&find_name="+find_name.value+"&limit="+limit.value);
	/* } else {
		window.location.href="GoodsList.do?category="+find_category.value+"&page=1"+"&find_name="+find_name.value+"&limit="+limit.value;
   } */
}
</script>

</head>
<body>
<!-- outlet_wrap -->
<div id="outlet_wrap">
<!-- 관리자 메인 ui -->
<div id="aMain_wrap">
<!-- 관리자 상단 -->
<div id="aMain_header">
<!-- 회사 로고 -->
<div id="aMain_logo">
<a href="admin_main.do" onfocus="this.blur();">
<img src="./images/admin/admin_logo.gif" />
</a>
</div>
<!-- 상단 메뉴 -->
<div id ="divStore"  ></div>
<div id="aMain_menu">
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
</div>
<!-- 관리자 상단 우측메뉴 -->
<div id="aMain_right">
<form method="post" action="MemberLogout.do">
<h3 class="aMain_title">
 ${admin_name}님 로그인을 환영합니다!
 <input type="submit" value="로그아웃" class="input_b" />
</h3>
</form>
</div>
</div>

<div class="clear"></div>

<!-- 관리자 메인내용 -->
<div id="aMain_cont">
<!-- <h2 class="aMainCont_title"></h2> -->
<div id="gbList_wrap" >
<form action="GoodsList.do" onsubmit="searchCategory();">	
<div width="960" align="center" border="1">
<!-- 	<table width="960" align="center" border="1"> -->
	
	<div style="margin-left:600px" >
	<select name="limit" id="limit">
	   		<option value="3">3</option>
	   		<option value="5" selected="selected">5</option>
	   		<option value="7">7</option>
	   		<option value="10">10</option>		
	  </select>
	  <input type="button" name="limitb" id="limitb" value="페이지" onclick="GetSelected();"/>
	  <!-- <input type="submit" value="페이징"> -->
	 </div> 
	 
	<!-- <td colspan=2> -->
	<table width=920px height="420" border="0" align="center">
	 
		<tr>
		<td valign="top">
		<!-- 상품 리스트 -->
		<table border="0">
		<tr>	   
		   <c:choose> 
				<c:when test="${empty glist}"><%--상품목록이 없으면 --%>
					<tr>
					<td width="700" height="300" align="center">
					 없습니다.
					</td>
					</tr>
				</c:when>
				
				<c:otherwise> <%--상품목록이 있으면 --%>
				<c:forEach var="item" items="${glist}">
				<td width="180" valign="top" >
				<br>
				<div align="center">
					<a href="GoodsDetail.do?goods_num=${item.goods_num}&page=${page}">
			
			 	<img src="./upload/${fn:trim(item.goods_image)}" width="100" height="100" border="1"/><%--이미지 파일 --%>
			 	<br/>${item.goods_name}<br/>
				</a>
				<br/><b>${item.goods_price}원</b>
				</div>
				
				<br>
				</td>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</tr>
		</table>
		<!-- 상품 리스트 -->
		</td>
		</tr>
		<tr>
		<td height="20" colspan="4" align="center">		
		<!-- 페이징 -->
	<!-- 페이징 추가 -->
	<div id="list_paging">
	  <!-- 검색후 페이징 -->
	  <c:if test="${(!empty find_field) && (!empty find_name)}">
			<c:if test = "${page <= 1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test = "${page > 1 }">
			<a href="GoodsList.do?page=${page-1}&find_category=${find_category}&find_level=${find_level}&find_name=${find_name}">[이전]</a>&nbsp;
			</c:if>	
			
			
			<c:forEach  var="a" begin = "${startpage}" end = "${endpage}" step = "1">
			 	<c:if test = "${a == page}">
					<${a}>
				</c:if>
				
                <c:if test = "${a != page}">
				 <a href="GoodsList.do?page=${a}&find_category=${find_category}&find_level=${find_level}&find_name=${find_name}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>	
			
			
			<c:if test = "${page >= maxpage}">
			 [다음]
			</c:if>
			<c:if test = "${page < maxpage }">
			 <a href="GoodsList.do?page=${page+1}&find_category=${find_category}&find_level=${find_level}&find_name=${find_name}">[다음]</a>
			</c:if>
	      </c:if>
	  <!-- 검색후 페이징 끝 -->
	  	      
	      <!-- 검색전 페이징 -->
    <c:if test="${(empty find_field) && (empty find_name)}">
	      	<c:if test = "${page <= 1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test = "${page > 1 }">
			<a href="GoodsList.do?page=${page-1}">[이전]</a>&nbsp;
			</c:if>	
			
			
			<c:forEach  var="a" begin = "${startpage}" end = "${endpage}" step = "1">
			 	<c:if test = "${a == page}">
			 	<!-- 해당 쪽번호가 선택된 경우 실행 -->
					<${a}>
				</c:if>
				
                <c:if test = "${a != page}">
                <!-- 해당 쪽번호가 선택 안된 경우 실행 -->
				 <a href="GoodsList.do?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>	
			
			
			<c:if test = "${page >= maxpage}">
			 [다음]
			</c:if>
			<c:if test = "${page < maxpage }">
			 <a href="GoodsList.do?page=${page+1}">[다음]</a>
			</c:if>
	    </c:if>
	    <!-- 검색전 페이징(쪽나누기) 끝 -->
	</div>	
		
		<!-- 검색폼 추가 -->
   <div id="list_find">
    <table id="list_f">
     <tr>
      <th>카테고리:
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
			
      <input type="text" name="find_name" id="find_name" size="16"  value="${find_name}" class="box"/>
      <input type="submit" value="검색" class="input_b" /><br/><br/>
      </th>
      <a href="BasketList.do?admin_id=${admin_id}">장바구니<br/><br/>
     </tr>
    </table>
   </div>
   <tr>
   <td>
   <!-- 검색폼 추가 끝 -->
   
		</td>
		</tr>
		</table>
<!-- 		</td> -->

<!-- 	</table> -->
<!-- </td> -->
</div>
	</form>
	</div>
</div>


<div class="clear"></div>
<!-- 관리자 하단 부분 -->
<!-- <div id="aMain_footer">
<h5 class="afooter_title">
서울시 마포구 대흥동 중앙빌딩....TEL)02-999-9999
</h5> -->
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
        <a href="./"><img src="imgs/foot_img.gif" width="147" height="62" alt="SENOP"></a>
        <div id="foot_note">
	          고객상담 전화주문:1577-1111 사업자등록번호 :106-11-123456  대표이사: 양용석  통신판매업 서울 제 000000호<br>
	          개인정보관리책임자:ugpapa 분쟁조정기관표시 : 소비자보호원, 전자거래분쟁중재위원회<br>
	          이메일주소무단수집거부 help@senopbiz.com<br>
	          Copyright (c) 20111 Senop Corp. All right Reserved.
        </div>
</footer>  






<!-- </div> -->
</div>
<!-- 스티키 윈도우내용  -->
<div id="sticky">
	<ul>
    	<li><a href="#"><img src="imgs/facebook_icon.png" width="24" height="24"> 페이스북</a></li>
        <li><a href="#"><img src="imgs/twitter_icon.png" width="24" height="24"> 트위터</a></li>
        <li><a href="#"><img src="imgs/rss_icon.png" width="24" height="24"> RSS 피드</a></li>        
	</ul>
    <div class="recent">
	    <h3>최근 본 상품 </h3>
        <ul>
        	<li><img src="imgs/products/book/html5_icon.jpg" width="75" height="95"></li>
            <li><img src="imgs/products/book/jquery_icon.jpg" width="75" height="95"></li>
         </ul> 	
        
    </div>
</div>
</div><!-- outlet_wrap -->
</body>
</html>