<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../include/admin_header.jsp" %>

<link rel="stylesheet" type="text/css" href="./css/admin.css" />
<script>
	function goodsmodify(goods_num) {
		$url = "AdminGoodsContent.do?goods_num=" + goods_num + "&state=edit";
		open(
				$url,
				"confirm",
				"toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=450px,height=300");

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
				"toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=650px,height=600");
	}
</script>
</head>
<body>

			<!-- 관리자 상단 우측메뉴 -->
			<%-- <div id="aMain_right">
				<form method="post" action="MemberLogout.do">
					<h3 class="aMain_title">
						${admin_name}님 로그인을 환영합니다! <input type="submit" value="로그아웃"
							class="input_b" />
					</h3>
				</form>
			</div> --%>


		<div class="clear"></div>

		<!-- 관리자 메인내용 -->
		<div id="aMain_cont">
			<form name=goodsform method="post">
			<input type="hidden" name="admin_id" value="${admin_id}"/>
				<div id="agList_wrap">
					<div class="agList_title" align="center">상품목록</div>
					<div class="agList_count" >리스트카운트:${listcount}</div>
					<div class="aglink" align=right>
						<a href="AdminGoodsAdd.do">상품등록</a>
					</div>
					<%--상품등록 --%>
					<!-- 상품 목록 -->
					<table id="agList_t" border="1">
						<tr>
							<th width="5%">번호</th>
							<th width="10%">카테고리</th>
							<th width="15%">사진</th>
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
									<td align="center">${g.goods_category}</td>
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
		<div class="clear"></div>
		<!-- 관리자 하단 부분 -->
<!-- 		<div id="aMain_footer"> -->
		
<!-- footer -->
<%@ include file="../../include/admin_footer.jsp" %>
</body>
</html>