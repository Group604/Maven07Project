<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>쇼핑몰</title>
<script type="text/javascript" src="./js/jquery.js"></script>
<script>
function goodsmodify(goods_num){
	$url="AdminGoodsContent.do?goods_num="+goods_num+"&state=edit";
	open($url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=450px,height=300");
	/* document.goodsform.action="./AdminGoodsModify.do?goods_num="+goods_num;
	document.goodsform.submit();	 */
}

function admingoodsdelete(goods_num){
	var url="AdminGoodsContent.do?goods_num="+goods_num+"&state=del";
	window.open(url,"confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=450px,height=300");
}
 function admingoodsContent(goods_num){
	/* document.goodsform.action="./AdminGoodsContent.do?goods_num="+goods_num;
	document.goodsform.submit();	 */
	 var url="AdminGoodsContent.do?goods_num="+goods_num+"&state=cont";
	open(url,"confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=450px,height=300");
}
</script>
</head>
<body>
<table width="960" cellspacing="0" cellpadding="0" border="0"
	color="gray" align="center">
	<tr>
		<td colspan=2>
		<!-- 상품 목록 -->
		<table border="0" width="80%">
			<tr>
				<td height="22" bgcolor="#6699FF">
					<p align="center">
						<font size=2>상품목록</font>
					</p>
				</td>
			</tr>
			<tr>
				<td>
				<p align="right">
					<font size=2>
						<a href="AdminGoodsAdd.do">상품등록</a><%--상품등록 --%>
					</font>
				</p>
				</td>
			</tr>
			
	<c:if test="${!empty list}">
	<c:forEach var="g" items="${list}">		
			
			
			<tr>
			<td>
			<form name=goodsform method="post">
			<table border="1">
			<tr>
				<th width="50">
				<p align="center"><font size=2>번호</font></p>
				</th>
				<th width="141">
				<p align="center"><font size=2>카테고리</font></p>
				</th>
				<th width="100">
				<p align="center"><font size=2>사진</font></p>
				</th>
				<th width="141">
				<p align="center"><font size=2>상품명</font></p>
				</th>
				<th width="141">
				<p align="center"><font size=2>단가</font></p>
				</th>
				<th width="80">
				<p align="center"><font size=2>수량</font></p>
				</th>
				<th width="241">
				<p align="center"><font size=2>등록일자</font></p>
				</th>
				<th width="100">
				<p align="center"><font size=2>&nbsp;</font></p>
				</th>
			</tr>

			<tr>
			<td>
			<p align="center">
				${g.goods_num}
			</p>
			</td>
			<td>
			<p align="center">
				<font size=2>
				${g.goods_category}
				</font>
			</p>
			</td>
			<td>
			<p align="center"><img src="./upload/${g.goods_image}" width="50" height="50" border="0"></p>
			</td>
			<td>
			<p align="center">
			<%-- <a href="./AdminGoodsContent.do?goods_num=${g.goods_num}&state=cont"><font size=2> ${g.goods_name}</font></a> --%>
			<a href="javascript:admingoodsContent(${g.goods_num});"><font size=2> ${g.goods_name}</font></a>
			</p>
			</td>
			<td>
			<p align="center">
				${g.goods_price}
			</p>
			</td>
			<td>
			<p align="center">
			   ${g.goods_amount}
			</p>
			</td>
			<td>
			<p align="center">
				<font size=2>
				${g.goods_date}
				</font>
			</p>
			</td>
			<td>
			<p align="center">
			<a href="javascript:admingoodsdelete(${g.goods_num});"><font size=2>삭제</font></a>/
			
			<a href="javascript:goodsmodify(${g.goods_num});"><font size=2>수정</font></a>
			</p>
			</td>
			</tr>
			</table>
			</c:forEach>
			</td>
			</tr>
			</c:if>
			</form>
		</table>
		<!-- 상품 목록 -->
		</td>
	</tr>
</table>
</body>
</html>