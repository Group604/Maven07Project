<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>쇼핑몰</title>
<script type="text/javascript" src="./js/jquery.js"></script>
<script>
function searchCategory(find_category,find_level,find_name) {
	if (find_level!="0") {
		window.location.href="GoodsList.do?category="+find_category+"&page=1&level="+find_level+"&find_name="+find_name;
	} else {
		window.location.href="GoodsList.do?category="+find_category+"&page=1"+"&find_name="+find_name;
	}
}
</script>
<!-- <script>
function find_check(){
	 if($.trim($("#find_name").val())==""){
		 alert("검색어를 입력하세요!");
		 $("#find_name").val("").focus();
		 return false;
	 }
}
</script> -->

<script>
function GetSelected(){
	var find_category=document.getElementById("find_category");
	var find_level=document.getElementById("find_level").valueOf();
	var find_name=document.getElementById("find_name").valueOf();
	var limit = document.getElementById ("limit");
	if (find_level!="0") {
		window.location.href="GoodsList.do?category="+find_category.value+"&page=1&level="+find_level.value+"&find_name="+find_name.value+"&limit="+limit.value;
	} else {
		window.location.href="GoodsList.do?category="+find_category.value+"&page=1"+"&find_name="+find_name.value+"&limit="+limit.value;
   }
}
</script>
</head>
<body>	
<form action="GoodsList.do" >	
<div width="960" align="center" border="1">
<!-- 	<table width="960" align="center" border="1"> -->
	
	<div style="margin-left:600px" >
	<select name="limit" id="limit">
	   		<option value="3">3</option>
	   		<option value="5" selected="selected">5</option>
	   		<option value="7">7</option>
	   		<option value="10">10</option>		
	  </select>
	  <input type="button" name="limitb" id="limitb" value="페이지" onclick="GetSelected();"/>
	  <!-- <input type="submit" value="페이징"> -->
	 </div> 
	 
	<!-- <td colspan=2> -->
	<table width=900px height="460" border="0" align="center">
	 
		<tr>
		<td valign="top">
		<!-- 상품 리스트 -->
		<table border="0">
		<tr>	   
		   <c:choose> 
				<c:when test="${empty glist}"><%--상품목록이 없으면 --%>
					<tr>
					<td width="700" height="300" align="center">
					 없습니다.
					</td>
					</tr>
				</c:when>
				
				<c:otherwise> <%--상품목록이 있으면 --%>
				<c:forEach var="item" items="${glist}">
				<td width="180" valign="top" >
				<br>
				<div align="center">
					<a href="GoodsDetail.do?goods_num=${item.goods_num}&page=${page}">
			
			 	<img src="./upload/${fn:trim(item.goods_image)}" width="100" height="100" border="1"/><%--이미지 파일 --%>
			 	<br/>${item.goods_name}<br/>
				</a>
				<br/><b>${item.goods_price}원</b>
				</div>
				
				<br>
				</td>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</tr>
		</table>
		<!-- 상품 리스트 -->
		</td>
		</tr>
		<tr>
		<td height="20" colspan="4" align="center">		
		<!-- 페이징 -->
	<!-- 페이징 추가 -->
	<div id="list_paging">
	  <!-- 검색후 페이징 -->
	  <c:if test="${(!empty find_field) && (!empty find_name)}">
			<c:if test = "${page <= 1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test = "${page > 1 }">
			<a href="GoodsList.do?page=${page-1}&find_category=${find_category}&find_level=${find_level}&find_name=${find_name}">[이전]</a>&nbsp;
			</c:if>	
			
			
			<c:forEach  var="a" begin = "${startpage}" end = "${endpage}" step = "1">
			 	<c:if test = "${a == page}">
					<${a}>
				</c:if>
				
                <c:if test = "${a != page}">
				 <a href="GoodsList.do?page=${a}&find_category=${find_category}&find_level=${find_level}&find_name=${find_name}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>	
			
			
			<c:if test = "${page >= maxpage}">
			 [다음]
			</c:if>
			<c:if test = "${page < maxpage }">
			 <a href="GoodsList.do?page=${page+1}&find_category=${find_category}&find_level=${find_level}&find_name=${find_name}">[다음]</a>
			</c:if>
	      </c:if>
	  <!-- 검색후 페이징 끝 -->
	  	      
	      <!-- 검색전 페이징 -->
    <c:if test="${(empty find_field) && (empty find_name)}">
	      	<c:if test = "${page <= 1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test = "${page > 1 }">
			<a href="GoodsList.do?page=${page-1}">[이전]</a>&nbsp;
			</c:if>	
			
			
			<c:forEach  var="a" begin = "${startpage}" end = "${endpage}" step = "1">
			 	<c:if test = "${a == page}">
			 	<!-- 해당 쪽번호가 선택된 경우 실행 -->
					<${a}>
				</c:if>
				
                <c:if test = "${a != page}">
                <!-- 해당 쪽번호가 선택 안된 경우 실행 -->
				 <a href="GoodsList.do?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>	
			
			
			<c:if test = "${page >= maxpage}">
			 [다음]
			</c:if>
			<c:if test = "${page < maxpage }">
			 <a href="GoodsList.do?page=${page+1}">[다음]</a>
			</c:if>
	    </c:if>
	    <!-- 검색전 페이징(쪽나누기) 끝 -->
	</div>	
		
		<!-- 검색폼 추가 -->
   <div id="list_find">
    <table id="list_f">
     <tr>
      <th>카테고리:
      <select name="find_category" id="find_category" size="1">
      	 <c:forEach var="ls" items="${clist}">
			<option value="${ls.categoryname}">${ls.categorydesc}</option>
		 </c:forEach>
	   </select>농도:
      <select name="find_level" id="find_level" size="1">
		 <c:forEach var="lv" items="${lvlist}">
		    <option value="${lv.level_no}">${lv.level_desc}</option>
		</c:forEach>
	  </select>
			
      <input type="text" name="find_name" id="find_name" size="16"  value="${find_name}" class="box"/>
      <input type="submit" value="검색" class="input_b"/><br/><br/>
      </th>
      <a href="BasketList.do?admin_id=${admin_id}">장바구니<br/><br/>
     </tr>
    </table>
   </div>
   <tr>
   <td>
   <!-- 검색폼 추가 끝 -->
   
		</td>
		</tr>
		</table>
<!-- 		</td> -->

<!-- 	</table> -->
<!-- </td> -->
</div>
	</form>

</body>
</html>