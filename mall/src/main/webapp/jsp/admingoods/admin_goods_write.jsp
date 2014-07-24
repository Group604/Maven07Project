<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../include/admin_header.jsp" %>
<html>
<head>
<title>쇼핑몰</title>
<link rel="stylesheet" type="text/css" href="./css/admin.css" />
<link rel="stylesheet" type="text/css" href="./css/bbs.css" />
</head>
<body>
<table width="960" cellspacing="0" cellpadding="0" border="0"
	color="gray" align="center">
<tr>
<td colspan=2>
<!-- 상품 등록 -->
<table border="0" width="80%">
<form name="goodsform" action="AdminGoodsAddOk.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="goods_best" value="0">
	<tr> 
		<td>
			<p align="center">
				<span style="font-size: 24pt;">상 품 등 록</span>
			</p>
		</td>
	</tr>
	<tr>
		<table border="1" align="center" width="558">
			<tr>
			<td width="196" height="20">
				<p align="center">
					<font size=2>카테고리</font>
				</p>
			</td>
			<td width="346" height="20">
					<select name="goods_category" size="1">
			         <c:forEach var="ls" items="${clist}">
			         <option value="${ls.categoryname}">${ls.categorydesc}</option>
			        </c:forEach>
				</select>
			</td>
			</tr>
			<tr>
			<td width="196" height="20">
				<p align="center">
					<font size=2>농도</font>
				</p>
			</td>
			<td width="346" height="10">
			<select name="goods_level" id="goods_level" size="1">
		 		<c:forEach var="lv" items="${lvlist}">
		    		<option value="${lv.level_no}">${lv.level_desc}</option>
				</c:forEach>
	  		</select>
	  		</td>
	  		</tr>
			<tr>
			<td>
				<p align="center"><font size=2>상품이름</font></p>
			</td>
			<td><input name="goods_name" id="goods_name" ></td>
		</tr>
		<tr>
			<td>
				<p align="center"><font size=2>판매가</font></p>
			</td>
			<td><input name="goods_price" id="goods_price"></td>
		</tr>
		<tr>
			<td>
				<p align="center"><font size=2>색깔</font></p>
			</td>
			<td><input name="goods_color" id="goods_color"></td>
		</tr>
		<tr>
			<td>
				<p align="center"><font size=2>수량</font></p>
			</td>
			<td><input name="goods_amount" id="goods_amount"></td>
		</tr>
		<tr>
			<td>
				<p align="center"><font size=2>사이즈</font></p>
			</td>
			<td><input name="goods_size" id="goods_size"></td>
		</tr>
		<tr>
			<td width="196">
				<p align="center"><font size=2>제품정보</font></p>
			</td>
			<td width="346">
				<textarea name="goods_content" id="goods_content" cols=50 rows=10></textarea>
			</td>
		</tr>
		<tr>
			<td>
			<p align="center"><font size=2>메인 제품이미지(gif)</font></p>
			</td>
			<td><input type="file" name="file4"></td></tr>
			<!-- <tr>
			<td>
			<p align="center"><font size=2>제품이미지1(gif)</font></p>
			</td>
			<td><input type="file" name="file3"></td></tr>
			<tr>
			<td>
			<p align="center"><font size=2>제품이미지2(gif)</font></p>
			</td>
			<td><input type="file" name="file2"></td></tr>
			<tr>
			<td>
			<p align="center"><font size=2>제품이미지3(gif)</font></p>
			</td>
			<td><input type="file" name="file1"></td>
		</tr> -->
	</table>

</tr>
<tr>
	<td height="75">
	<p align="center"><input type="submit" value="등록">&nbsp;
	<input type="reset" value="다시쓰기"></p>
	</td>
</tr>
</table>
</form>		
<!-- 상품 등록 -->
</td>
</tr>
</table>
</body>
</html>