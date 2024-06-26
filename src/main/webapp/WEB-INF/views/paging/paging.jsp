<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="action" value="${param.address}" />
<div class="row">
	<div class="col" style="font-size:120%; font-weight:bold;">

		<c:if test="${paging.prev}">
			<a href="${action}?page=${paging.beginPage-1}">◀</a>&nbsp;
		</c:if>
		<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
			<c:if test="${index==paging.page}">
				<span style="color:red">${index}&nbsp;</span>
			</c:if>
			<c:if test="${index!=paging.page}">
				<a href="${action}?page=${index}">${index}&nbsp;</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.next}">
			&nbsp;<a href="${action}?page=${paging.endPage+1}">▶</a>&nbsp;
		</c:if>
	</div>
</div><!-- 페이지의 끝 -->
	
	<div class="serach-form">
		<form name="search" method="get">
			<input type="hidden" name="command" value="contestBoard">
			<input type="hidden" name="pagenum" value="1">
			<input type="text" name="search" value="${search}">
			<input type="submit" value="검색">
		</form>
	</div>
	
	<style>
		.pagenation-container { display:flex; align-items: center; justify-content: center; }
		.pagenation-container .nextBtn,
		.pagenation-container .prevBtn { width:9px; position:relative; top:3px; margin:0 10px; }
		.pagenation-container .prevBtn img { transform: rotate(-180deg); }
		.pagenation-container img {width:100%;  }
		.pagenation-container .pagenation-wrapper {   display: flex; font-size: 15px; }
		.pagenation-container .pagenation-wrapper * { width: 25px; height: 25px; display: flex; justify-content: center;
    			align-items: center; color:#999999; border-radius:3px;  }
		.pagenation-container .pagenation-wrapper span { background:#1F1F1F; color:#fff;  }
		
		.serach-form { display:flex; justify-content: center; margin-top:50px; }
		.serach-form input[name="search"] { width:287px; border-radius:5px; border:1px solid #D9D9D9; height:45px; margin-right:5px; display:inline-block; }
		.serach-form input[type="submit"] { height:45px; color:#fff; background:#000; border:none; border-radius:4px; }
	
	</style>
	 