<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>



<div class="mycategory">
    <div>
    	<a class="mycontest" href="mycontest">콘테스트</a>
	    <a class="mywrite" href="mywrite">내가 작성한 글</a>
	    <a class="myreply" href="myreply">내가 쓴 댓글</a>
	    <a class="myqna" href="myqna">내 Q&A</a>
    </div>
</div>


<%@ include file="../css/mycategory_css.jsp"%>

<script>

	let command = location.href.split("command=")[1].split("&")[0];
	document.querySelector('.'+command).classList.add("active");
	
</script>