<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../include/admin_header.jsp" %>
<html>
<head>
<script src="./js/jquery.js"></script>
<script src="./js/member.js"></script>
<link rel="stylesheet" type="text/css" href="./css/order.css" />
<title>쇼핑몰</title>
</head>
<body>
<div id="OrderList_wrap">

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
			<p class="OrderList_title" >주문 상세내역</p>
	<table id="OrderList_t">
		
		<tr>
				<th width="10%">순번</th>
				<th width="10%">제품번호</th>
				<th width="15%">사진</th>
				<th width="20%">제품명</th>
				<th width="10%">수량</th>
				<th width="10%">가격</th>			
				<th width="10%">취소</th>
			</tr>
		<c:if test="${ordertype.equals('goods')}">
		<c:forEach var="list" varStatus="status" items="${basketlist}">
		<tr>
		<td>${status.count}</td>
		<td>${list.basket_goods_num}</td>
		<td><img
			src="./upload${list.goods_image}" width=50 height=50></td>
	    <td>${list.goods_name}</td>
	    <td>${list.basket_goods_amount}</td>
	    <td>${list.goods_price_amount}</td>
	    <td><input type="checkbox" name="ischecked"></td>
		</tr>
		</c:forEach>
		</c:if>
		
		<c:if test="${ordertype.equals('basket')}">
		<c:forEach var="list" varStatus="status" items="${basketlist}">
		
		<tr>
			<td>${status.count}</td>
		    <td>${list.basket_goods_num}</td>
			<td><img src="./upload/${list.goods_image}" width=50 height=50></td>
			<td>${list.goods_name}</td>
		    <td>${list.basket_goods_amount}</td>
		    <td>${list.goods_price_amount}</td>
		    <td><input type="checkbox" name="ischecked"></td>
		</tr>
		</c:forEach>
		</c:if>
	</table>
	<table id="OrderInfo_t">
		<tr>
			<th colspan=3>주문자 정보</th>
		</tr>
		<tr>
			<th style="font-family: Tahoma; font-size: 8pt;" height=24 bgcolor="f7f7f7">이름</th>
			<td name="member_name">${member.member_name}</td>
		</tr>
		<tr>
			<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
		</tr>
		<tr>
			<th style="font-family: Tahoma; font-size: 8pt;" height=24 bgcolor="f7f7f7">휴대폰</th>
			<td name="member_phone">${member.member_phone01}-${member.member_phone02}-${member.member_phone03}</td>
		</tr>
		<tr>
			<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
		</tr>
		<tr>
			<th style="font-family: Tahoma; font-size: 8pt;" height=24 bgcolor="f7f7f7" name="member_email">이메일 주소</th>
			<td>
				${member.member_emailid}@${member.member_emaildomain}
			</td>
		</tr>
		<tr>
			<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
		</tr>
	</table>

	<table id="ReceiveInfo_t">
		<tr>
			<th colspan=3 >배송지 정보</th>
		</tr>
		<tr height=20>
			<th style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">받는사람</th>
			<td style="font-family: Tahoma; font-size: 8pt;">
				<input type="text" name="order_rceive_name" size=12 value="${member.member_name}">
			</td>
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
				<th style="font-family: Tahoma; font-size: 8pt;" height=24 bgcolor="f7f7f7">연락처</th>
					<td style="font-family: Tahoma; font-size: 8pt;"><input name="order_receive_mobile" value="${member.member_phone01}-${member.member_phone02}-${member.member_phone03}">
				</td>
			</tr>	

		<tr>
			<td style="background-color: #F0F0F0; height: 1px;" colspan=6>
		</tr>
		<tr>
			<th style="font-family: Tahoma; font-size: 8pt;" width=130 height=24 bgcolor="f7f7f7">기타 요구사항</th>
			<td style="font-family: Tahoma; font-size: 8pt;">
			<textarea name="order_memo" cols=60 rows=6></textarea>
			</td>
		</tr>
	</table>

	<table cellspacing="1">
		<tr>
			<td><b><font size=2>결제 정보</font></b></td>
		</tr>
		<tr>
			<td style="font-family: Tahoma; font-size: 8pt; font-weight:bold" width=200 height=24 bgcolor="f7f7f7">입금자명(온라인입금일 경우) :</td>
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

</table><!-- OrderList_t -->
</div><!-- OrderList_wrap -->
<div class="clear"></div>
<!-- footer -->
<%@ include file="../../include/admin_footer.jsp" %>
</body>
</html>