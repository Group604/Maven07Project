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
<div id="aMain_cont">
<!-- <h2 class="aMainCont_title"></h2> -->
<div id="gbList_wrap" >
<form action="Index.do" onsubmit="searchCategory();">	
<div width="960" height="900" margin="auto" align="center" >
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
	<!-- <table width=775px height="900px" border="1" align="center"> -->
	 

		<!-- 상품 리스트 -->
					<table id="gbList_t">
						<tr>
							<th width="5%">번호</th>
							<th width="8%">카테고리</th>
							<th width="7%">농도</th>
							<th width="10%">사진</th>
							<th width="20%">상품명</th>
							<th width="5%">단가</th>
							<th width="5%">수량</th>
							<th width="15%">등록일자</th>
							<th width="10%">수정/삭제</th>
						</tr>
						<hr/>

		   <c:choose> 
				<c:when test="${empty glist}"><%--상품목록이 없으면 --%>
					<tr>
					<td width="700" height="300" align="center">
					 없습니다.
					</td>
					</tr>
				</c:when>
				
				<c:otherwise> <%--상품목록이 있으면 --%>
				<c:forEach var="g" items="${glist}">
								<tr>
									<td align="center">${g.goods_num}</td>
									<td align="center">
									<select name="goods_category" size="1" disabled>
							         <c:forEach var="ls" items="${clist}">
							         <option value="${ls.categoryname}" <c:if test="${g.goods_category==ls.categoryname}">selected</c:if>>${ls.categorydesc}</option>
							         </c:forEach>
									</select>
								    </td>
			
									<td align="center">
									<select name="goods_level" size="1" disabled>
										<c:forEach var="lv" items="${lvlist}">
										 <option value="${lv.level_no}" <c:if test="${lv.level_no==g.goods_level}">selected</c:if>>${lv.level_desc}</option>
										</c:forEach>
									</select>
									</td>
									
									<td align="center"><img src="./upload/${g.goods_image}"
										width="50" height="50" border="1"></td>
									<td align="center"><a
										href="javascript:admingoodsContent(${g.goods_num});">${g.goods_name}</a>
									</td>
									<td align="center">${g.goods_price}</td>
									<td align="center">${g.goods_amount}</td>
									<td align="center">${fn:substring(g.goods_date,0,10)}</td>
									<td align="center"><a
										href="javascript:admingoodsdelete(${g.goods_num});"><font
											size=2>삭제</font></a>/ <a
										href="javascript:goodsmodify(${g.goods_num});"><font
											size=2>수정</font></a></td>
								</tr>
							</c:forEach>
				</c:otherwise>
			</c:choose>

		</table>
		<!-- 상품 리스트 -->

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
			<a href="Index.do?page=${page-1}&find_category=${find_category}&find_level=${find_level}&find_name=${find_name}">[이전]</a>&nbsp;
			</c:if>	
			
			
			<c:forEach  var="a" begin = "${startpage}" end = "${endpage}" step = "1">
			 	<c:if test = "${a == page}">
					<${a}>
				</c:if>
				
                <c:if test = "${a != page}">
				 <a href="Index.do?page=${a}&find_category=${find_category}&find_level=${find_level}&find_name=${find_name}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>	
			
			
			<c:if test = "${page >= maxpage}">
			 [다음]
			</c:if>
			<c:if test = "${page < maxpage }">
			 <a href="Index.do?page=${page+1}&find_category=${find_category}&find_level=${find_level}&find_name=${find_name}">[다음]</a>
			</c:if>
	      </c:if>
	  <!-- 검색후 페이징 끝 -->
	  	      
	      <!-- 검색전 페이징 -->
    <c:if test="${(empty find_field) && (empty find_name)}">
	      	<c:if test = "${page <= 1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test = "${page > 1 }">
			<a href="Index.do?page=${page-1}">[이전]</a>&nbsp;
			</c:if>	
			
			
			<c:forEach  var="a" begin = "${startpage}" end = "${endpage}" step = "1">
			 	<c:if test = "${a == page}">
			 	<!-- 해당 쪽번호가 선택된 경우 실행 -->
					<${a}>
				</c:if>
				
                <c:if test = "${a != page}">
                <!-- 해당 쪽번호가 선택 안된 경우 실행 -->
				 <a href="Index.do?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>	
			
			
			<c:if test = "${page >= maxpage}">
			 [다음]
			</c:if>
			<c:if test = "${page < maxpage }">
			 <a href="Index.do?page=${page+1}">[다음]</a>
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
      <a href="BasketList.do?member_id=${member_id}">장바구니<br/><br/>
     </tr>
    </table>
   </div>
  <!--  <tr>
   <td>
   검색폼 추가 끝
   
		</td>
		</tr> -->
		<!-- </table> -->

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