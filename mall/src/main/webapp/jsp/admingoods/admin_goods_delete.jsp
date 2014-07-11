<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>상품 삭제</title>
</head>
<body>
<form name="deleteForm" action="AdminGoodsDeleteOk.do?goods_num=${goods_num}" method="post">
<table border=1>
<tr>
	<td>
		<font size=2>Admin 비밀번호: </font>
	</td>
	<td>
		<input id="Admin_pass" name="Admin_pass" type="password">
	</td>
</tr>
<tr>
	<td colspan=2 align=center>
		<a href="javascript:deleteForm.submit()">삭제</a>
		&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">돌아가기</a>
	</td>
</tr>
</table>
</form>
</body>
</html>