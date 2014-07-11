<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>상품내용보기</title>
</head>
<body>
<table width="960" color="gray" align="center">
<tr>
	<td colspan=2>
	
	<c:if test="${!empty agb}">

	<tr>
		<td height="331">
		<table border="1" align="center" width="558">
		<tr>
			<td width="196" height="30">
			<p align="center"><font size=2>카테고리</font></p>
			</td>
			
			<td width="346" height="30">
			<select name="goods_category" size="1">
			         <c:forEach var="ls" items="${clist}">
			         <option value="${ls.categorydesc}">${ls.categorydesc}</option>
			        </c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>
			<p align="center"><font size=2>상품이름</font></p>
			</td>
			<td><input type="text" name="goods_name" 
					value="${agb.goods_name}"></td>
		</tr>
		<tr>
			<td>
			<p align="center"><font size=2>판매가</font></p>
			</td>
			<td><input type="text" name="goods_price" 
					value="${agb.goods_price}"></td>
		</tr>
		<tr>
			<td>
			<p align="center"><font size=2>색깔</font></p>
			</td>
			<td><input type="text" name="goods_color" 
					value="${agb.goods_color}"></td>
		</tr>
		<tr>
			<td>
			<p align="center"><font size=2>수량</font></p>
			</td>
			<td><input type="text" name="goods_amount" 
					value="${agb.goods_amount}"></td>
		</tr>
		<tr>
			<td>
			<p align="center"><font size=2>사이즈</font></p>
			</td>
			<td><input type="text" name="goods_size" 
					value="${agb.goods_size}"></td>
		</tr>
		<tr>
			<td>
			<p align="center"><font size=2>인기상품</font></p>
			</td>
			<td><input type="radio" name="goods_best" value=1
			    <c:if test="${agb.goods_best==1}">CHECKED</c:if>>
				<font size=2>예</font>
				<input type="radio" name="goods_best" value=0 
				<c:if test="${agb.goods_best==0}">CHECKED</c:if>>
				<font size=2>아니오</font></td>
		</tr>
		
		<c:if test="${!empty agb.goods_image}">
				<tr>
					<th>첨부파일</th>
					<td>${agb.goods_image}</td>
				</tr>
				<tr>
				<th>첨부한 이미지 보기</th>
				<td>
				<img src="./upload${agb.goods_image}" width="100" height="100" />
				</td>
				</tr>
			</c:if>
			<c:if test="${empty agb.goods_image}">
			<tr>
			<th>첨부파일</th>
			<td>첨부파일 없음</td>
			</tr>
			</c:if>
		
		<tr>
			<td width="196">
			<p align="center"><font size=2>제품정보</font></p>
			</td>
			<td width="346">
				<textarea name="goods_content" cols=50 rows=15>
					"${agb.goods_content}"
				</textarea>
			</td>
		</tr>
		</table>
		</td>
	</tr>
	<tr>
	<th colspan="2">
	<input type="button" value="수정" class="input_b" onclick="location='AdminGoodsContent.do?goods_num=${agb.goods_num}&page=${page}&state=edit'" />
	<input type="button" value="삭제" class="input_b" onclick="location='AdminGoodsContent.do?goods_num=${agb.goods_num}&page=${page}&state=del'" />
	<input type="button" value="목록" class="input_b" onclick="location='AdminGoodsContent.do?page=${page}'" /></th>
	</tr>
			
	<!-- <tr>
		<td height="75">
		<p align="center"><input type="submit" value="수정">&nbsp;
		<input type="reset" value="다시쓰기"></p>
		</td>
	</tr> -->
	</c:if>
	</form>
	</table>
	<!-- 상품 수정 -->
	</td>
</tr>
</table>
</body>
</html>
