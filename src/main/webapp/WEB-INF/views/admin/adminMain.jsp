<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp" %>

<h2 style="font-size:40px;">관리자 홈</h2>
<div style="margin-top:50px;" class="admin-menu">
	<div class="admin-menu-left">
		<div class="view">
			<a href="zootopia.do?command=adminmemberlist">회원 관리</a><br>
			<span>회원정보 수정 및 추가/삭제</span><hr>
			<a href="zootopia.do?command=adminmemberinsertform">ㆍ회원 추가</a>
			<a href="zootopia.do?command=adminmemberlist">ㆍ회원 삭제</a>
			<a href="zootopia.do?command=adminmemberlist">ㆍ회원정보 수정</a>
		</div>
		<div class="view">
			<a href="zootopia.do?command=admincontestlist&category=all&pagenum=1&search=">콘테스트 관리</a><br>
			<span>콘테스트 허가 및 관리</span><hr>
			<a href="zootopia.do?command=admincontestlist&category=all&pagenum=1&search=">ㆍ모든 콘테스트</a>
			<a href="zootopia.do?command=admincontestlist&category=playing&pagenum=1&search=">ㆍ진행중인 콘테스트</a> 
			<a href="zootopia.do?command=admincontestlist&category=completed&pagenum=1&search=">ㆍ완료된 콘테스트</a>
			<a href="zootopia.do?command=admincontestlist&category=waiting&pagenum=1&search=">ㆍ대기중인 콘테스트</a>
			<a href="zootopia.do?command=admincontestlist&category=rejected&pagenum=1&search=">ㆍ거절된 콘테스트</a>
		</div>
	</div>
	<div class="admin-menu-right">
		<div class="view">
			<a href="zootopia.do?command=admincommunitylist">커뮤니티 관리</a><br>
			<span>게시판 수정 및 삭제</span><hr>
			<a href="zootopia.do?command=admincommunitylist">ㆍ게시판 수정</a>
			<a href="zootopia.do?command=admincommunitylist">ㆍ게시판 삭제</a>
		</div>
		<div class="view">
			<a href="zootopia.do?command=adminqnalist">Q&A 관리</a><br>
			<span>Q&A 답글 작성 및 삭제</span><hr>
			<a href="zootopia.do?command=adminqnalist">ㆍQ&A 답글 작성</a>
			<a href="zootopia.do?command=adminqnalist">ㆍQ&A 삭제</a>
		</div>
	</div>
</div>









<%@ include file="/admin/footer.jsp" %>