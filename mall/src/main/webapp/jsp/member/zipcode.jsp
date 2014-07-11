<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우편번호 검색</title>
<style type="text/css">
* {
	font-size: 10pt;
}
</style>
</head>
<body>

<form action="." method="get" accept-charset="utf-8">
	도로명: <input type="text" name="search" />
	<button type="submit">검색</button>
</form>

<c:forEach var="zipcode" items="${list}">
	<p>[${zipcode.zipcodeWithDash}] ${zipcode.address}</p>
</c:forEach>

</body>
</html>