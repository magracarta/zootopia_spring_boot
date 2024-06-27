<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="css/member.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idcheck.jsp</title>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
<div class="id_check_form">
	<h2>ID 중복확인</h2>
	<form name="idCheckForm" action="idcheckform">
		User ID : <input type="text" name="userid" value="${userid}" >
   		<input type="submit" value="검색"> <br><br><br>
	</form>
	<div>
		<c:if test="${result==1}">
			<script type="text/javascript">
				opener.document.joinForm.userid.value="";
				opener.document.joinForm.reid.value="";
			</script>
			${userid}&nbsp;는 이미 사용중인 아이디입니다!
		</c:if>
		<c:if test="${result==-1}">
			${userid}&nbsp;는 사용 가능한 ID입니다!
			<input type="button" value="사용할게요" onClick="idok('${userid}');">
		</c:if>
	</div>
</div>
</body>
</html>