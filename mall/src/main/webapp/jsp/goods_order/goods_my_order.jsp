<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>쇼핑몰</title>
</head>
<body>
<div width="960" cellspacing="0" cellpadding="0" border="0" align="center">
<h2>회원 주문내역 보기</h2>


<!-- 회원의 주문내역 보기 -->
<table width="700" border="0" align="center">
<c:if test="${!empty golist}">
<tr>
	<h3>현재 ${member_id}고객님께서 주문하신 내역이 총 ${ordercount}개 있습니다.</h3>
</tr>
 <tr>
	<td height="62" align="center" valign="middle">
	<table width="700" border="1" cellspacing="0" cellpadding="0" bordercolor="#CCCCCC">
		<tr>	
			<th height="20">상품명</th>
			<th>색상/사이즈</th>
			<th>수량</th>
			<th>상품금액</th>
			<th>주문 상태</th>
			<th>주문 날짜</th>
        </tr>
       
<c:forEach var="list" items="${golist}">
<tr>
         <td>${list.order_goods_name} </td> 
         <td>${list.order_goods_color}</td>
         <td>${list.order_goods_amount}</td>
         <td>${list.order_sum_money }</td>
         <td><select name="order_state" size="1" disabled>
			  <c:forEach var="os" items="${order_stat}">
			  	<option value="${os.STAT_NO}" <c:if test="${os.STAT_NO==list.order_status}">selected</c:if>>${os.STAT_DESC}</option>
			  </c:forEach>
			 </select>
	     </td>
         <td>${list.order_date } </td>
</tr>
 </c:forEach>
</table>
</td>
</tr>
</c:if>
<c:if test="${empty golist}">
	<td align=center colspan=6>주문 내역이 없습니다.</td>
</c:if>


<%-- 
		<tr align=center>
			<td height="20"><%=order.getORDER_GOODS_NAME()%></td>
			<td>
				<%=order.getORDER_GOODS_COLOR()%>/
				<%=order.getORDER_GOODS_SIZE()%>
			</td>
			<td><%=order.getORDER_GOODS_AMOUNT()%></td>
			<td><%=order.getORDER_SUM_MONEY()%></td>
			<td>
			<%if (order.getORDER_STATUS() == 0) {%>     대기중
			<%}else if (order.getORDER_STATUS() == 1){%>발송준비
			<%}else if (order.getORDER_STATUS() == 2){%>발송완료
			<%}else if (order.getORDER_STATUS() == 3){%>배송중
			<%}else if (order.getORDER_STATUS() == 4){%>배송완료
			<%}else if (order.getORDER_STATUS() == 5){%>주문취소
			<%}%>
			</td>
			<td><%=order.getORDER_DATE()%></td>
		</tr>
		<%
			}
		%>
		<tr align=center height=20>
			<td colspan=7 style="font-family: Tahoma; font-size: 10pt;">
			<%if (nowpage <= 1) {%>
			[이전]&nbsp;
			<%}else{%>
			<a href="./OrderList.or?page=<%=nowpage-1 %>">[이전]</a>&nbsp;
			<%}%>
			<%
			for (int a = startpage; a <= endpage; a++) {
				if (a == nowpage) {
			%>
			[<%=a%>]
			<%
				}else{
			%>
			<a href="./OrderList.or?page=<%=a %>">[<%=a%>]</a>&nbsp;
			<%	}
			}
			%>
			<%if (nowpage >= maxpage) {%>
			[다음]
			<%}else{%>
			<a href="./OrderList.or?page=<%=nowpage+1 %>">[다음]</a>
			<%}%>
			</td>
		</tr> 
	</table>
	</td>
</tr>
<tr>
	<td height="28">
	<div align="right">총 주문금액 : <%=totalmoney%>원</div>
	</td>
</tr>
<!-- </table> -->

<!-- 회원의 주문내역 보기 -->
<!-- </td>
</tr> --> --%>
<%-- </c:if> --%>
<!-- </table> -->
</div>
</body>
</html>