<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.Timestamp, java.util.Date" %>
<%@ include file ="../include/header.jsp" %>
<%@ include file ="css/content_css.jsp" %>

<div class="contest">

<div class="title-wrapper">
	<h2 class="title">콘테스트<sapn class="contest-countnum"></sapn></h2>
	<a href="zootopia.do?command=contestForm">나도 콘테스트 추가하기 ></a>
</div>
<div class="contest-category">
	<ul>
		<li><a class="all" href="contestlist?category=all&pagenum=1&search=">All</a></li>
		<li><a class="playing" href="contestlist?category=playing&pagenum=1&search=">진행중인 콘테스트</a></li>
		<li><a class="accomplished" href="contestlist?category=accomplished&pagenum=1&search=">완료된 콘테스트</a></li>
		<li><a class="wating" href="contestlist?category=wating&pagenum=1&search=">대기중인 콘테스트</a></li>
	</ul>
</div>

<div class="contest_container">
	<div class="contest_list">

		<span class="searchinfo" style="display: none">*검색어 '<span class="text"></span>'이
			포함된 콘테스트를 <span class="count"></span>개 발견했습니다.</span>

		<ul>
			<%--스크립트--%>
		</ul>
	</div>

	<jsp:include page="../paging/paging.jsp" flush="true" >
		<jsp:param name="url" value="contestlist" />
		<jsp:param name="search" value="${search}" />
	</jsp:include>

</div>
</div>

<script src="script/contestBoard.js"></script>


<%@ include file ="../include/footer.jsp" %>