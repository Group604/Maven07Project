<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>쇼핑몰</title>
</head>
<body>
<table width="960" cellspacing="0" cellpadding="0" border="0" align="center">
	<tr>
		<td colspan=2><!-- 장바구니 -->
		<p align="center">
		<form action="./OrderStart.do" name="basketform" method="post"><!-- 주문시작 -->
		<input type="hidden" name="order" value="basket"><!-- 장바구니에서 주문으로 넘어가는 파라미터 -->
		<table width="80%">
			<tr align=center>
				<th><b>장 바 구 니</b></th>
			</tr>
		
		<!-- <table width="80%" cellpadding="0" cellspacing="0"> -->
			<tr height=26 bgcolor="94d7e7">
				<td height="3" colspan="7" align=right></td>
			</tr>
			<tr bgcolor="#f0f8ff" align="center">
				<td width="5%"><font size="2">번호</font></td>
				<td width="5%"><font size="2">사진</font></td>
				<td width="25%"><font size="2">제품명</font></td>
				<td width="8%"><font size="2">수량</font></td>
				<td width="8%"><font size="2">가격</font></td>
				<td width="8%"><font size="2">취소</font></td>
			</tr>
			<c:if test="${!empty blist}">
			<c:forEach var="list" items="${blist}">
			   <tr>
			   <td>${list.basket_num}</td>&nbsp;&nbsp;&nbsp;&nbsp;
			   <td><img src="./upload/${list.goods_image}" width=50 height=50>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			   <td>${list.goods_name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			   <td>${list.basket_goods_num}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			   <td>${list.basket_member_id}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			   <td>${list.basket_goods_amount}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			   <td>${list.goods_price_amount}&nbsp;&nbsp;&nbsp;&nbsp;</td>
			   <td>${list.basket_date}</td>
			   <td><font size="2">
				<a href="BasketDel.do?basket_num=${list.basket_num}" onclick="return confirm('취소하시겠습니까?')">취소</a>
			</font></td>
			</tr>
			   </c:forEach>
			</c:if>
		</table>
		
		<table width="80%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="2" bgcolor="94d7e7"></td>
			</tr>
		</table>
		<br>
		
		<table width="80%" cellpadding="0" cellspacing="0">
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
		</p>
		</td>
	</tr>
</table>
</body>
</html>