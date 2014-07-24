<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../include/admin_header.jsp" %>
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="./css/mjoin.css" />
<script src="./js/jquery.js"></script>
<script src="./js/member.js"></script>
</head>
<body>
	<div id="join_wrap">
		<h2 class="join_title">회원가입</h2>
		<form name="m" method="post" action="MemberJoinOk.do"
			onsubmit="return join_check();">
			<table id="join_t">
				<tr>
					<th>아이디</th>
					<td><input name="member_id" id="join_id" size="14" class="box" /> 
						<input type="button" value="아이디중복체크" class="input_cb" onclick="id_check();" width="20" /> <br /> 
						<span id="idcheck"></span> 
						<%--한줄 블록영역을 지정할 때는 span태그를 사용함. --%>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="member_pwd" id="join_pwd" size="14" class="box" /></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="member_pwd2" id="join_pwd2" size="14" class="box" /></td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td><input name="member_name" id="join_name" size="14" class="box" /></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>
					<input name="member_zip" id="join_zip" size="3" maxlength="3" class="box" onclick="post_search();" />-
					<input name="member_zip2"id="join_zip2" size="3" maxlength="3" class="box" onclick="post_search();" /> 
					<input type="button" value="우편검색"class="input_b" onclick="post_check();" /></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="member_addr" id="join_addr" size="40" class="box" /></td>
				</tr>
				<tr>
					<th>나머지 주소</th>
					<td><input name="member_addr2" id="join_addr2" size="36" class="box" /></td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td><select name="member_phone01" class="box">
							<c:forEach var="p" items="${phone}">
								<option value="${p.phone_number}">${p.phone_number}</option>
							</c:forEach>
					</select>-<input name="member_phone02" id="join_phone02" size="4"
						maxlength="4" class="box" />- <input name="member_phone03"
						id="join_phone03" size="4" maxlength="4" class="box" /></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input name="member_emailid" id="mail_id" size="14" class="box" />@
					    <input name="member_emaildomain" id="mail_domain" size="12" class="box" readonly/>
						<%-- 입력박스에 readonly 속성을 지정하면 읽기만 가능 --%>
						 <select name="mail_list" onchange="domain_list();" class="box">
							<c:forEach var="mail" items="${email}">
								<option value="${mail.email_domain}">${mail.email_domain}</option>
							</c:forEach>
					</select></td>
				</tr>
			</table>
			<div id="join_menu">
				<input type="submit" value="가입" class="input_b" /> 
				<input type="reset" value="취소" class="input_b" onclick="$('#join_id').focus();" />
			</div>
		</form>
	</div>
<!-- footer -->	
<footer>
        <ul>
            <li><a href="#">회사소개</a></li>
            <li><a href="#">이용약관</a></li>
            <li><a href="#">개인정보취급방침</a></li>
            <li><a href="#">광고/이벤트 문의</a></li>
            <li><a href="#">고객만족센터</a></li>
            <li class="no_line"><a href="#">찾아오시는길</a></li>
        </ul>
        <div class="clear"></div>
        <a href="./"><img src="images/foot_img.png" width="68" height="62" alt="footimg"></a>
        <div id="foot_note">
	          고객상담 전화주문:02-704-1711 사업자등록번호 :220-95-00629  대표이사: 홍길동  통신판매업 서울 제 000000호<br>
	          개인정보관리책임자:admin 분쟁조정기관표시 : 소비자보호원, 전자거래분쟁중재위원회<br>
	          이메일주소무단수집거부 help@themall.com<br>
	          Copyright (c) 2014 themall Corp. All right Reserved.
        </div>
</footer>  

</div><!-- aMain_wrap 끝 -->
<!-- 스티키 윈도우내용  -->
<div id="sticky">
	<ul>
    	<li><a href="#"><img src="images/facebook_icon.png" width="24" height="24"> 페이스북</a></li>
        <li><a href="#"><img src="images/twitter_icon.png" width="24" height="24"> 트위터</a></li>
        <li><a href="#"><img src="images/rss_icon.png" width="24" height="24"> RSS 피드</a></li>        
	</ul>
    <div class="recent">
	    <h3>최근 본 상품 </h3>
        <ul>
        	<li><img src="images/products/book/html5_icon.jpg" width="75" height="95"></li>
            <li><img src="images/products/book/jquery_icon.jpg" width="75" height="95"></li>
         </ul> 	
    </div>

</div><!-- outlet_wrap -->
</body>
</html>

</body>
</html>