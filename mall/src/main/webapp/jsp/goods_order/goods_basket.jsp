<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../include/admin_header.jsp" %>
<html>
<head>
<title>쇼핑몰</title>
<link rel="stylesheet" type="text/css" href="./css/basket.css" />
</head>
<body>
<div id="baskList_wrap">
<!-- <table width="960" cellspacing="0" cellpadding="0" border="0" align="center"> -->
	
<!-- 장바구니 -->
        <h3 class="baskList_title">장바구니</h3>
		<form action="./OrderStart.do" name="basketform" method="post"><!-- 주문시작 -->
		<input type="hidden" name="order" value="basket"><!-- 장바구니에서 주문으로 넘어가는 파라미터 -->
		<table id="baskList_t">
			<tr>
				<th width="10%" align="center"><font size="2">번호</font></th>
				<th width="15%" align="center"><font size="2">사진</font></th>
				<th width="20%" align="center"><font size="2">제품명</font></th>
				<th width="10%" align="center"><font size="2">수량</font></th>
				<th width="10%" align="center"><font size="2">가격</font></th>
				<th width="25%" align="center"><font size="2">날짜</font></th>				
				<th width="10%" align="center"><font size="2">취소</font></th>
			</tr>
			<c:if test="${!empty blist}">
			<c:forEach var="list" items="${blist}">
			   <tr>
			   <td>${list.basket_num}</td>&nbsp;&nbsp;&nbsp;&nbsp;
			   <td><img src="./upload/${list.goods_image}" width=50 height=50>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			   <td>${list.goods_name}</td>
<%-- 			   <td align="center">${list.basket_goods_num}</td> --%>
<%-- 			   <td>${list.basket_member_id}&nbsp;&nbsp;&nbsp;&nbsp;</td> --%>
			   <td>${list.basket_goods_amount}</td>
			   <td>${list.goods_price_amount}</td>
			   <td>${fn:substring(list.basket_date,0,10)}</td>&nbsp;&nbsp;
			   <td>
				<a href="BasketDel.do?basket_num=${list.basket_num}" onclick="return confirm('취소하시겠습니까?')">취소</a>
				</td>
			</tr>
			   </c:forEach>
			</c:if>
		</table>
		
		<!-- <table width="80%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="2" bgcolor="94d7e7"></td>
			</tr>
		</table>
		<br> -->
		
		<table class="buygo">
			<tr>
			<td align="center">
			<c:if test="${!empty blist}">
				<a href="javascript:basketform.submit()">
				[구매하기]
				</a>
			</c:if>
			<c:if test="${empty blist}">
				<a href="#" onclick="javascript:alert('주문할 상품이 없습니다.')">
				[구매하기]
				</a>
			</c:if>
			<c:if test="${empty goods_num}">
				<a href="./GoodsList.do?page=${page}">
				[계속 쇼핑하기]
				</a>
			</c:if>
			<c:if test="${!empty goods_num}">
				<a href="./GoodsDetail.do?goods_num=${goods_num}">
				 [계속 쇼핑하기]
				</a>
			</c:if>
			</td>
			</tr>
		</table>
		</form>
		<!-- 장바구니 -->


<!-- </table> -->
</div>
<div class="clear"></div>
<!-- footer -->
<%@ include file="../../include/admin_footer.jsp" %>
</body>
</html>