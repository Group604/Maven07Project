<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>
<head>
<title>쇼핑몰</title>
<script>
function isBuy(goodsform) {
	
	var amount=document.goodsform.amount.value;
		
	var isbuy=confirm("구매하시겠습니까?");
	if(isbuy==true) {
		goodsform.action="OrderStart.do?order=goods&amount="+amount;
		goodsform.submit();
	} else {
		return;
	}
}

function isBasket(basketform) {
	var amount=document.goodsform.amount.value;
	
	var isbuy=confirm("장바구니에 저장하시겠습니까?");
	
	if(isbuy==true) {
		basketform.action="BasketAdd.do?goods_num="+${gb.goods_num}+"&amount="+amount;
		basketform.submit();
	} else {
		return;
	}
}

function count_change(temp){
	var test=document.goodsform.amount.value;
	if(temp==0){
		test++;
	}else if(temp==1){
		if(test> 1) test--;
	}
	
	document.goodsform.amount.value=test;
}
</script>
</head>
<body>
<table width="960" cellspacing="0" cellpadding="0" border="0"
	align="center">
	<tr>
		<td colspan=2 align=center><!-- 상품 내용 -->
		<form name="goodsform" action="#" method="post">
	    <input type="hidden" name="goods_num" value="${gb.goods_num}">
		<table width="600" border="0" align="center">
		<tr>
			<td height="60" colspan="2">상 세 보 기</td>
		</tr>
		<tr>
			<td width="202" height="123" align="center" valign="middle">
			<img src="./upload/${fn:trim(gb.goods_image)}" width="150" height="150"/>
			</td>
			<td width="481" align="center" valign="middle">
			<table width="340" height="200" border="0">
				<tr>
					<td colspan="4" align="center" height="50">
						<b>${gb.goods_name}</b>
					</td>
				</tr>
				<tr>
					<td>판매가격 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</td>
					<td colspan="3">${gb.goods_price} 원</td>
				</tr>
				<tr>
					<td rowspan="2">수량
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
					</td>
					<td width="58" rowspan="2">
						<input name="amount" type="text" style="text-align: right" value="1"	size="4" />
					</td>
					<td valign="bottom">
						<div align="center">
							<a href="JavaScript:count_change(0)">▲</a>
						</div>
					</td>
					<td width="69" rowspan="2" align="left">개</td>
				</tr>
				<tr>
					<td valign="top">
						<div align="center">
							<a href="JavaScript:count_change(1)">▼</a>
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" colspan="4" height="30" valign="middle">
						남은수량(${gb.goods_amount})개
					</td>
				</tr>
				<tr>
					<td colspan="4">카테고리&nbsp;&nbsp;&nbsp;&nbsp; 
						<select name="goods_category" size="1" disabled="disabled">
			         <c:forEach var="ls" items="${clist}">
			         <option value="${ls.categoryname}" <c:if test="${gb.goods_category==ls.categoryname}">selected</c:if> readonly="true">${ls.categorydesc}</option>
			        </c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan="4">농도&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="goods_level" size="1" disabled="disabled" >
			         <c:forEach var="ls" items="${vlist}">
			         <option value="${ls.level_no}" <c:if test="${gb.goods_level==ls.level_no}">selected</c:if>>${ls.level_desc}</option>
			        </c:forEach>
					</select>

				
						<%-- <select name="color" size="1">
							<option value="">-----------------</option>
							<c:forTokens var="lv" items="${level}">
								<option value="${fn:trim(color)}">
									${fn:trim(color)}
								</option>
							</c:forTokens>
						</select> --%>
					</td>
				</tr>
				<tr>
					<td height="50" colspan="4">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4">
						<a href="javascript:isBuy(goodsform);">
						[구매하기]
						</a> 
						<a href="javascript:isBasket(goodsform);">
						[장바구니 담기]
						</a>
						<a href="./GoodsList.do?page=${page}">
						[계속 쇼핑하기]
						</a>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td align="center"></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">
			
			</td>
		</tr>
		</table>
		</form><!-- 상품 구매 메뉴 끝 -->
		<!-- 상품 내용 -->
		<table width="700" height="300" align="enter">
			<tr>
				<td align="center">
				<div>${gb.goods_content}</div>
				</td>
			</tr>
		</table>
		<br><br>
		<table width="200" border="0" align="center">
			<tr align="left">
				<td colspan="3">
				<c:forEach var="itemimg" items="${requestScope.contentImage}">
					<img src="./upload/${fn:trim(itemimg)}" />
				</c:forEach></td>
			</tr>
		</table>
		<!-- 상품 내용 끝 --></td>
	</tr>
</table>
</body>
</html>