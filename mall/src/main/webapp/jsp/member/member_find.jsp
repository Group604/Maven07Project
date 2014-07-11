<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script>
	function formSubmit() {
		var forms = document.getElementById("findform");

		if ((forms.member_name.value == "")
				|| (forms.member_name.value.length <= 1)) {
			alert("이름을 정확히 입력해 주십시오.");
			forms.member_name.focus();
			return false;
		} else if ((forms.member_jumin1.value == "")
				|| (forms.member_jumin1.value.length < 6)) {
			alert("주민등록번호를 정확히 입력해 주십시오.");
			forms.member_jumin1.focus();
			return false;
		} else if ((forms.member_jumin2.value == "")
				|| (forms.member_jumin2.value.length < 7)) {
			alert("주민등록번호를 정확히 입력해 주십시오.");
			forms.member_jumin2.focus();
			return false;
		}

		return true;
	}
</script>
</head>
<body>
	<table width="450px" height="20px">
		<tr>
			<td align="left"><b>아이디 찾기</b></td>
		</tr>
	</table>
	<form action="./MemberFindOk.do" method="post" name="findform"
		onSubmit="return formSubmit();">
		<table width="450px" cellspacing="0" cellpadding="0" border="0">
			<thead>
				<font size="2"> &nbsp;&nbsp;&nbsp;&nbsp; 이름과 주민등록번호를 정확히
					입력해주세요. <br />
				<br />
				<br />
				<br />
				</font>
			</thead>
			<tr>
				<td height="29" bgcolor="#F3F3F3"><font size="2">이름</font></td>
				<td>&nbsp; <input type="text" name="member_name" maxlength="12"
					size="14">
				</td>
			</tr>
			<tr>
				<td colspan="2" height="1"></td>
			</tr>
			<tr>
				<td height="29" bgcolor="#F3F3F3"><font size="2">주민등록번호</font>
				</td>
				<td>&nbsp; <input type="password" name="member_jumin1"
					maxlength="6" size="12"> - <input type="password"
					name="member_jumin2" maxlength="7" size="12">
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding: 10px 0 20px 0" align="center">
					<input type="submit" value="확인">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>