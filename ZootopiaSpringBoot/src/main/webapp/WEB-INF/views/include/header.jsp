<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zootopia</title>

<!-- 구글 웹폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.1/">
<!-- 슬라이드 api -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/header_footer.css">
<link rel="stylesheet" href="css/common.css">
<script src="script/member.js"></script>
<script src="script/jquery-3.7.1.min.js"></script>
<script src="script/community.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

	<script type="text/javascript">
		$(function(){
			$('#fileimage').change(function(){
				var fileName = $(this).val().split('\\').pop();
				$('#filename').text(fileName);
			});

			$('#myButton').click(function(){
				var formselect = $("#fileupForm")[0];	// 지목된 폼을 변수에 저장
				var formdata = new FormData(formselect);	// 전송용 폼객체에 폼과 안의 데이터(이미지)를 저장
				$.ajax({	//
					url:"<%=request.getContextPath() %>/fileup",
					type:"post",
					enctype:"multipart/form-data",
					async:false,
					data:formdata,
					timeout:10000,
					contentType:false,
					processData:false,

					success:function(data) {	// controller 에서 리턴된 해시맵이 data 로 전달됩니다
						if(data.STATUS == 1){
							$("#filename").append("<div>" + data.SAVEIMAGE + "</div>");
							$("#image").val(data.IMAGE);
							$("#saveimage").val(data.SAVEIMAGE);
							$("#filename").append("<img src='images/" + data.SAVEIMAGE + "'height='150'/>");
						}
					},
					error:function() {
						alert("실패");
					}
				});
			});
		});
	</script>

</head>
<body>

<header>
<div class="header-container">
	<div class="logo-menu">
		<div class="logo">
			<a href="/"><img src="/images/logo.svg"></a>
		</div>
		<nav class="navigation">
			<ul>
				<li>
				<a href="zootopia.do?command=contestBoard&category=all&pagenum=1&search=">콘테스트</a>
				<div class="submenuContainer">
					<ul>
						<li><a href="zootopia.do?command=contestBoard&category=all&pagenum=1&search=">All</a></li>
						<li><a href="zootopia.do?command=contestBoard&category=playing&pagenum=1&search=">진행중인 콘테스트</a></li>
						<li><a href="zootopia.do?command=contestBoard&category=accomplished&pagenum=1&search=">완료된 콘테스트</a></li>
						<li><a href="zootopia.do?command=contestBoard&category=wating&pagenum=1&search=">대기중인 콘테스트</a></li>
					</ul>
				</div>
				</li>
				<li><a href="zootopia.do?command=communityBoard">자유게시판</a>
					<div class="submenuContainer">
					<ul>
						<li><a href="zootopia.do?command=communityBoard&pagenum=1">All</a></li>
						<li><a href="zootopia.do?command=communityBoard&kind=1&pagenum=1">고민</a></li>
						<li><a href="zootopia.do?command=communityBoard&kind=2&pagenum=1">자랑</a></li>
						<li><a href="zootopia.do?command=communityBoard&kind=3&pagenum=1">잡담</a></li>
					</ul>
				</div>
				</li>
				<li><a href="zootopia.do?command=qnaList">Q&A</a></li>
			</ul>
		</nav>
	
	</div>

	<div class="login-menu">
		<c:choose>
			<c:when test="${empty loginUser}">
				<a href="loginform">Login</a>
				<a href="joinform">Join</a>
			</c:when>
			<c:otherwise>
				<a href="mypage">${loginUser.nickname}(${loginUser.userid})</a>
				<a href="logout">Logout</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</header>

<div class="wrapper">
<div id="content">


