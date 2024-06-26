<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="css/community_css.jsp" %>


<article>
    <form class="communityform" name="updateForm" action="updateCommunityForm" method="post">
        <div class="form">자유게시판 수정</div>
        <div class="detail">
           <label class="writer">작성자</label>
           <span class="nickname" name="nickname">${loginUser.nickname}</span>
           <span class="userid" name="userid">[${loginUser.userid}]</span>
      </div>
        <div class="kind">
            <label for="kind">카테고리 선택</label>
            <select class="kindlist" id="kind" name="kind">
                <option class="1" value="1" ${communityVO.kind == 1 ? 'selected' : ''}>고민</option>
                <option class="2" value="2" ${communityVO.kind == 2 ? 'selected' : ''}>자랑</option>
                <option class="3" value="3" ${communityVO.kind == 3 ? 'selected' : ''}>잡담</option>
            </select>
        </div>
        <div class="class">
            <label  >제목</label>
            <input  type="text" name="subject" value="${communityVO.subject}">
        </div>
         <div class="content">
	        <label>내용</label>
            <textarea class="content" name="content" rows="10" cols="85">${communityVO.content}</textarea>
        </div>
        <input type="hidden" name="gseq" value="${communityVO.gseq}">
        <div class="btn">   
            <input type="button" class="button3" value="수정완료" onclick="updateCommunity()">
            <input type="button" class="button4" value="취소" onClick="location.href='communityDetail?gseq=${communityVO.gseq}'">
        </div>
    </form>

</article>



