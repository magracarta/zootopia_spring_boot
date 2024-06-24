<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

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

</head>
<body>

<header>
<div class="header-container">
	<div class="logo-menu">
		<div class="logo">
			<a href="zootopia.do?command=main"><img src="images/logo.svg"></a>
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
				<a href="zootopia.do?command=loginform">Login</a>
				<a href="zootopia.do?command=joinform">Join</a>
			</c:when>
			<c:otherwise>
				<a href="zootopia.do?command=mycontest">${loginUser.nickname}(${loginUser.userid})</a>
				<a href="zootopia.do?command=logout">Logout</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</header>

<div class="wrapper">
<div id="content">


