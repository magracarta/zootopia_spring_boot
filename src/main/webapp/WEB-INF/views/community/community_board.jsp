<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp"%>

<div class="container">
    <div class="head">
        <h1 class="title">자유게시판</h1>
        <button class="write" onclick="location.href='writeCommunityForm'">글 작성하기 ></button>
    </div>

    <div class="contest-category">
        <ul>
            <li><a class="kind0" href="communityBoard?pagenum=1">All</a></li>
            <li><a class="kind1" href="communityBoard?kind=1&pagenum=1">고민</a></li>
            <li><a class="kind2" href="communityBoard?kind=2&pagenum=1">자랑</a></li>
            <li><a class="kind3" href="communityBoard?kind=3&pagenum=1">잡담</a></li>
        </ul>
    </div>
    <script>
        let kind = location.href.split("kind=")[1] ? location.href.split("kind=")[1].split("&")[0] : 0;
        document.querySelector(".kind" + kind).classList.add("select");
    </script>

    <div class="communityboard">
        <ul>
            <li class="board_head">
                <span class="num">no.</span>
                <span class="subject">[분류]제목</span>
                <span class="userid">닉네임[작성자]</span>
                <span class="createdate">작성일</span>
                <span class="recommands">추천수</span>
                <span class="vcount">조회수</span>
            </li>

            <c:forEach var="post" items="${communityList}">
                <li>
                    <a class="" href="javascript:void(0);" onclick="increaseViewCountAndRedirect(${post.gseq})">
                        <span class="num">${post.gseq}</span>
                        <span class="subject">
                                <c:choose>
                                    <c:when test="${post.kind == 1}">[고민]</c:when>
                                    <c:when test="${post.kind == 2}">[자랑]</c:when>
                                    <c:when test="${post.kind == 3}">[잡담]</c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>
                                ${post.subject}
                            </span>
                        <span class="userid">${post.userid}</span>
                        <span class="createdate">${post.createdate}</span>
                        <span class="recommands">${post.recommands}</span>
                        <span class="vcount">${post.vcount}</span>
                    </a>
                </li>
            </c:forEach>

            <c:if test="${empty communityList}">
                <c:forEach var="post" items="${top3Posts}">
                    <li class="hottopic">
                        <a class="" href="javascript:void(0);" onclick="increaseViewCountAndRedirect(${post.gseq})">
                            <span class="num"><span>인기글</span></span>
                            <span class="subject">
                    <c:choose>
                        <c:when test="${post.kind == 1}">[고민]</c:when>
                        <c:when test="${post.kind == 2}">[자랑]</c:when>
                        <c:when test="${post.kind == 3}">[잡담]</c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>
                    ${post.subject}
                </span>
                            <span class="userid">${post.nickname}[${post.userid}]</span>
                            <span class="createdate">${post.createdate}</span>
                            <span class="recommands">${post.recommands}</span>
                            <span class="vcount" id="vcount_${post.gseq}">${post.vcount}</span>
                        </a>
                    </li>
                </c:forEach>
                <c:forEach var="post" items="${commList}">
                    <li>
                        <a class="" href="javascript:void(0);" onclick="increaseViewCountAndRedirect(${post.gseq})">
                            <span class="num">${post.gseq}.</span>
                            <span class="subject">
                    <c:choose>
                        <c:when test="${post.kind == 1}">[고민]</c:when>
                        <c:when test="${post.kind == 2}">[자랑]</c:when>
                        <c:when test="${post.kind == 3}">[잡담]</c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>
                    ${post.subject}
                </span>
                            <span class="userid">${post.nickname}[${post.userid}]</span>
                            <span class="createdate">${post.createdate}</span>
                            <span class="recommands">${post.recommands}</span>
                            <span class="vcount" id="vcount_${post.gseq}">${post.vcount}</span>
                        </a>
                    </li>
                </c:forEach>
            </c:if>

            <script>
                function increaseViewCountAndRedirect(gseq) {
                    $.ajax({
                        type: "POST",
                        url: "/communityViewCount", // 컨트롤러의 매핑 주소
                        data: { gseq: gseq }, // 전송할 데이터
                        success: function(response) {
                            console.log("View count increased successfully for post with gseq: " + gseq);
                            // 여기서 페이지 리디렉션을 처리하거나 추가적인 로직을 실행할 수 있음
                            window.location.href = "/communityDetail?gseq=" + gseq; // 예시로 상세 페이지로 리디렉션
                        },
                        error: function(xhr, status, error) {
                            console.error("Error occurred while increasing view count for post with gseq: " + gseq);
                            // 에러 발생 시 처리 로직
                        }
                    });
                }
            </script>

        </ul>
    </div>
</div>

<jsp:include page="../paging/paging.jsp" >
    <jsp:param value="communityBoard" name="address"/>
</jsp:include>

<%@include file="./css/community_css.jsp"%>
<%@include file="../include/footer.jsp"%>
