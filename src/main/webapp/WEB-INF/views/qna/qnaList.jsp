<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<section>
    <article>
        <form>
            <ul class="qna-header">Q & A </ul>
            <div class="tb">
                <div class="row">
                    <div class="coltitle num">번호</div>
                    <div class="coltitle category">카테고리</div>
                    <div class="coltitle subject">제목</div>
                    <div class="coltitle author">작성자</div>
                    <div class="coltitle createDate">작성일</div>
                    <div class="coltitle answer">답변여부</div>
                </div>
                <c:if test="${not empty QnaList}">
                    <c:forEach items="${QnaList}" var="QnaDto">
                        <div class="low">
                            <div class="coltitle num">${QnaDto.qseq}</div>
                            <div class="coltitle category">
		                    <c:choose >
			                    <c:when test="${QnaDto.category == 1}">[콘테스트 문의]</c:when>
			                    <c:when test="${QnaDto.category == 2}">[자유게시판 문의]</c:when>
			                    <c:when test="${QnaDto.category == 3}">[기타 문의]</c:when>
			                    <c:otherwise></c:otherwise>
			                </c:choose>
			                </div>
                            <div class="coltitle subject">
                                <a href="qnaView?qseq=${QnaDto.qseq}">${QnaDto.subject}</a>
                            </div>
                            <div class="coltitle author">${QnaDto.userid}</div>
                            <div class="coltitle createDate"><fmt:formatDate value="${QnaDto.createdate}" type="date"/></div>
                            <div class="coltitle answer">
                                <c:choose>
                                    <c:when test="${empty QnaDto.reply}">NO</c:when>
                                    <c:otherwise>YES</c:otherwise>
                                </c:choose>
                            </div> 
                        </div>
                    </c:forEach>
                </c:if>
                <c:url var="action" value="" />
                <div class="pagination">
                </div>
                <div class="btn-container" style="text-align: right;">
                    <input type="button" value="질문하기" onClick="location.href='writeQnaForm'" style="height:40px; font-weight:bold;"/>
                </div>
            </div>
        </form>
    </article>
</section>
<jsp:include page="paging.jsp" flush="true">
  <jsp:param name="url" value="qnaList" />
</jsp:include>
<%@ include file="../qna/css/qna_css.jsp" %>

