<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<script src="./js/jquery.js"></script>
<script src="./js/member.js"></script>
<title>쇼핑몰</title>
</head>
<body>
<table width="960" cellspacing="0" cellpadding="0" border="0"
	align="center">
<tr>
	<td colspan=2 align=right>
	<!-- 주문 페이지 -->
	<form name="m" action="./OrderAdd.do" method="post"  >
	<input type="hidden" name="ordertype" value="${ordertype}">
	 <c:if test="${ordertype.equals('goods')}">
	<input type="hidden" name="goods_num" value="${goods_info.goods_num}">
	<input type="hidden" name="goods_name" value="${goods_info.goods_name}">
	<input type="hidden" name="goods_amount" value="${goods_info.goods_amount}">
	<input type="hidden" name="goods_color" value="${goods_info.goods_color}">
	<input type="hidden" name="goods_size" value="${goods_info.goods_size}">
	<input type="hidden" name="goods_price" value="${goods_info.goods_price}">
	</c:if>
	
	<input type="hidden" name="member_id" value="${member_id}">
	<!-- 주문 상세내역 -->
	<table border=0 cellspacing=1 cellpadding=0 width=80%>
		<tr>
			<p align=left><b><font size=2>주문 상세내역</font></b></p>
		</tr>
		<tr align=center height=20>
		<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">사진</td>
		<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">상품명</td>
		<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">수량</td>
		<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">색깔</td>
		<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">사이즈</td>
		<td style="font-family: Tahoma; font-size: 8pt; font-weight: bold;">가격</td>
		</tr>
		<tr>
			<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
		</tr>
		<c:if test="${ordertype.equals('goods')}">
		<c:forEach var="list" items="${basketlist}">
		<tr align=center height=20>
		<td style="font-family: Tahoma; font-size: 7pt;"><img
			src="./upload${list.goods_image}" width=50 height=50></td>
	    <td style="font-family: Tahoma; font-size: 7pt;">${list.goods_name}</td>
	    <td style="font-family: Tahoma; font-size: 7pt;">${list.basket_goods_amount}</td>
	    <td style="font-family: Tahoma; font-size: 7pt;">${list.goods_image}</td>
	    <td style="font-family: Tahoma; font-size: 7pt;">${list.basket_goods_num}</td>
	    <td style="font-family: Tahoma; font-size: 7pt;">${list.goods_price_amount}</td>
		</tr>
		<tr>
			<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
		</tr>
		</c:forEach>
		</c:if>
		
		<c:if test="${ordertype.equals('basket')}">
		<c:forEach var="list" items="${basketlist}">
		
		<tr align=center height=20>
		<td style="font-family: Tahoma; font-size: 7pt;">
			<img src="./upload/${goods_image}" width=50 height=50>
		</td>
		<td style="font-family: Tahoma; font-size: 8pt;" >
			${goods_name}
		</td>
		<td style="font-family: Tahoma; font-size: 8pt;" >
			${basket_goods_amount}
		</td>
		<td style="font-family: Tahoma; font-size: 8pt;" >
			${bakset_goods_color}
		</td>
		<td style="font-family: Tahoma; font-size: 8pt;" >
			${basket_goods_size}
		</td>
		<td style="font-family: Tahoma; font-size: 8pt;" >
			${basket_goods_price}
		</td>
		</tr>
		<tr>
			<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
		</tr>
		</c:forEach>
		</c:if>
	</table>

	<table width=80% border=0 cellpadding="0" cellspacing="1">
		<tr>
			<td height=10>
			<td>
		</tr>
		<tr>
			<td height=10>
			<td>
		</tr>
		<tr>
			<td><b><font size=2>주문자 정보</font></b></td>
		</tr>
		<tr>
			<td style="font-family: Tahoma; font-size: 8pt;" width=80 height=24 bgcolor="f7f7f7" name="member_name">이름</td>
			<td width=320 height=24>
				<font size=2>${member.member_name}</font>
			</td>
		</tr>
		<tr>
			<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
		</tr>
		<tr>
			<td style="font-family: Tahoma; font-size: 8pt;" height=24 bgcolor="f7f7f7" name="member_phone">휴대폰</td>
			<td width=320 height=24>
				<font size=2>${member.member_phone01}-${member.member_phone02}-${member.member_phone03}</font>
			</td>
		</tr>
		<tr>
			<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
		</tr>
		<tr>
			<td style="font-family: Tahoma; font-size: 8pt;" height=24 bgcolor="f7f7f7" name="member_email">이메일 주소</td>
			<td width=320 height=24>
				<font size=2>${member.member_emailid}@${member.member_emaildomain}</font>
			</td>
		</tr>
		<tr>
			<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
		</tr>
	</table>

	<table width=80% border=0 cellpadding="0" cellspacing="1">
		<tr>
			<td height=10>
			<td>
		</tr>
		<tr>
			<td height=10>
			<td>
		</tr>
		<tr>
			<td><b><font size=2>배송지 정보</font></b></td>
		</tr>
		<tr height=20>
			<td style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">받는사람</td>
			<td style="font-family: Tahoma; font-size: 8pt;">
				<input type="text" name="order_rceive_name" size=12 value="${member.member_name}">
			</td>
		</tr>
		<tr>
			<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
		</tr>

		<tr>
			<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
		</tr>
		
		<tr>
					<th>우편번호</th>
					<td>
					<input name="member_zip" id="join_zip" size="3" maxlength="3" value="${member.member_zip}" onclick="post_search();" />-
					<input name="member_zip2" id="join_zip2" size="3" maxlength="3" value="${member.member_zip2}" class="box" onclick="post_search();" /> 
					<input type="button" value="우편검색"class="input_b" onclick="post_check();" /></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="member_addr" id="join_addr" size="40" class="box" value="${member.member_addr}"/></td>
				</tr>
				<tr>
					<th>나머지 주소</th>
					<td><input name="member_addr2" id="join_addr2" size="36" class="box" value="${member.member_addr2}"/></td>
				</tr>
			<tr>
				<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
			</tr>
			<tr>
				<td style="font-family: Tahoma; font-size: 8pt;" height=24 bgcolor="f7f7f7">연락처</td>
					<td style="font-family: Tahoma; font-size: 8pt;"><input name="order_receive_mobile" value="${member.member_phone01}-${member.member_phone02}-${member.member_phone03}">
				</td>
			</tr>	

		<tr>
			<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
		</tr>
		<tr height=20>
			<td style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">기타 요구사항</td>
			<td style="font-family: Tahoma; font-size: 8pt;">
			<textarea name="order_memo" cols=60 rows=12></textarea>
			</td>
		</tr>
		<tr>
			<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
		</tr>
	</table>

	<table width=80% border=0 cellpadding="0" cellspacing="1">
		<tr>
			<td height=10>
			<td>
		</tr>
		<tr>
			<td height=10>
			<td>
		</tr>
		<tr>
			<td><b><font size=2>결제 정보</font></b></td>
		</tr>
		<tr>
			<td style="font-family: Tahoma; font-size: 8pt;" width=200 height=24 bgcolor="f7f7f7">입금자명(온라인입금일 경우) :</td>
			<td width=320 height=24>
			<input type="text" name="order_trade_payer"
				size=20 value="${member.member_name}">
			</td>
		</tr>
		<tr>
			<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
		</tr>
		<tr>
			<td align=center style="background-color: #F0F0F0; height: 1px;"
				colspan=6>
				<input type=submit value="주문">&nbsp;
				<input type=button value="취소">
			</td>
		</tr>
	</table>
	</form>
	<!-- 주문 페이지 -->
	</td>
</tr>
</table>
</body>
</html>