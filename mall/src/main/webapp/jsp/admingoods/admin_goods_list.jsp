<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../include/admin_header.jsp" %>
<html>
<head>
<title>쇼핑몰</title>
<link rel="stylesheet" type="text/css" href="./css/admin.css"/>
<link rel="stylesheet" type="text/css" href="./css/bbs.css"/>
<script type="text/javascript" src="./js/jquery.js"></script>
<script>
	function goodsmodify(goods_num) {
		$url = "AdminGoodsContent.do?goods_num=" + goods_num + "&state=edit";
		open(
				$url,
				"confirm",
				"toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=850px,height=650px");

	}

	function admingoodsdelete(goods_num) {
		var url = "AdminGoodsContent.do?goods_num=" + goods_num + "&state=del";
		window
				.open(
						url,
						"confirm",
						"toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=450px,height=300");
	}
	function admingoodsContent(goods_num) {
		var url = "AdminGoodsContent.do?goods_num=" + goods_num + "&state=cont";
		open(
				url,
				"confirm",
				"toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=450px,height=300");
	}
</script>
</head>
<body>
<div id="aMain_cont">
			<form name=goodsform method="post">
				<div id="abList_wrap">
					<div class="abList_title" align="center">상품목록</div>
					<div align="right" border="1">리스트카운트:${listcount}</div>
					<div id="bList_count">
						<a href="AdminGoodsAdd.do">상품등록</a>
					</div>
					<%--상품등록 --%>
					<!-- 상품 목록 -->
					<table id="bList_t" border="1">
						<tr>
							<th width="5%">번호</th>
							<th width="8%">카테고리</th>
							<th width="7%">농도</th>
							<th width="10%">사진</th>
							<th width="15%">상품명</th>
							<th width="5%">단가</th>
							<th width="10%">수량</th>
							<th width="10%">등록일자</th>
							<th width="10%">수정/삭제</th>
						</tr>
						<c:if test="${!empty list}">
							<c:forEach var="g" items="${list}">
								<tr>
									<td align="center">${g.goods_num}</td>
									<td align="center">
									<select name="goods_category" size="1" disabled>
							         <c:forEach var="ls" items="${clist}">
							         <option value="${ls.categoryname}" <c:if test="${g.goods_category==ls.categoryname}">selected</c:if>>${ls.categorydesc}</option>
							         </c:forEach>
									</select>
								    </td>
			
									<td align="center">
									<select name="goods_level" size="1" disabled>
										<c:forEach var="lv" items="${lvlist}">
										 <option value="${lv.level_no}" <c:if test="${lv.level_no==g.goods_level}">selected</c:if>>${lv.level_desc}</option>
										</c:forEach>
									</select>
									</td>
									
									<td align="center"><img src="./upload/${g.goods_image}"
										width="50" height="50" border="1"></td>
									<td align="center"><a
										href="javascript:admingoodsContent(${g.goods_num});">${g.goods_name}</a>
									</td>
									<td align="center">${g.goods_price}</td>
									<td align="center">${g.goods_amount}</td>
									<td align="center">${g.goods_date}</td>
									<td align="center"><a
										href="javascript:admingoodsdelete(${g.goods_num});"><font
											size=2>삭제</font></a>/ <a
										href="javascript:goodsmodify(${g.goods_num});"><font
											size=2>수정</font></a></td>
								</tr>
							</c:forEach>
						</c:if>
					</table>

					<!-- 상품 목록 -->

					<!-- 페이징 추가 -->
					<div id="list_paging">
						<!-- 페이징 -->
						<c:if test="${page <= 1 }">
			[이전]&nbsp;
			</c:if>
						<c:if test="${page > 1 }">
							<a href="AdminGoodsList.do?page=${page-1}">[이전]</a>&nbsp;
			</c:if>


						<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
							<c:if test="${a == page}">
					<${a}>
				</c:if>

							<c:if test="${a != page}">
								<a href="AdminGoodsList.do?page=${a}">[${a}]</a>&nbsp;
				</c:if>
						</c:forEach>


						<c:if test="${page >= maxpage}">
			 [다음]
			</c:if>
						<c:if test="${page < maxpage }">
							<a href="AdminGoodsList.do?page=${page+1}">[다음]</a>
						</c:if>
						<!-- 페이징 끝 -->
						
					</div>
				</div>
			</form>
		</div>
</body>
</html>