<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<div class="container">
	<form method="post" action="join" name="joinForm" enctype="multipart/form-data">
    	<h2>JOIN</h2>
		<div class="option_info" style="margin-bottom:25px;">* 필수 입력
			<div class="field_idcheck">
				<input type="text" name="userid" size="12" placeholder="아이디"/>
				<input type="hidden" name="reid"/>
				<input type="button" value="중복확인" class="dup" onClick="idcheck()"/>
			</div>
			<div class="field">
				<input name="pwd" type="password" placeholder="비밀번호"/>
			</div>
			<div class="field">
				<input name="pwdCheck" type="password" placeholder="비밀번호 확인"/>
			</div>
			<span style="float:right;">*&nbsp;${message}</span>
			<div class="field">
				<input style="margin-top:50px;"name="name" type="text" placeholder="이름"/>
			</div>
			<div class="field">
				<input name="email" type="text" placeholder="이메일"/>
			</div>
			<div class="field_nicknamecheck">
				<input name="nickname" type="text" placeholder="닉네임" size="12"/>
				<input type="hidden" name="renickname"/>
				<input type="button" value="중복확인" class="dup" onClick="nicknamecheck()"/>
			</div>
			<div class="field">
				<input name="phone" type="text" placeholder="전화번호"/>
			</div>
		</div>

		<div class="option_info" style="margin-top:80px; margin-bottom:30px;">* 선택 입력

			<div class="field" style="margin-bottom:12px;">
				<div style="display:flex; flex-direction:column">
					<c:choose>
						<c:when test="${dto.zip_num == null}">
							<input type="text" id="sample6_postcode" name="zip_num" placeholder="우편번호" readonly
						</c:when>
						<c:otherwise>
							<input type="text" id="sample6_postcode" name="zip_num" value="${dto.zip_num}" readonly>
						</c:otherwise>
					</c:choose>
					<input type="button"  value="우편번호 찾기" onclick="sample6_execDaumPostcode()">
				</div>
			</div>
			<div class="field" style="margin-bottom:12px;">
				<c:choose>
					<c:when test="${dto.address1 == null}">
						<input type="text" id="sample6_address" name="address1" placeholder="주소" readonly/>
					</c:when>
					<c:otherwise>
						<input type="text"  id="sample6_address"  name="address1"  value="${dto.address1}"  readonly />
					</c:otherwise>
				</c:choose>
			</div>
			<div class="field" style="margin-bottom:12px;">
				<c:choose>
					<c:when test="${dto.address3 == null}">
						<input type="text" id="sample6_extraAddress" name="address3" placeholder="상세 주소" readonly/>
					</c:when>
					<c:otherwise>
						<input type="text" id="sample6_extraAddress" name="address3"  value="${dto.address3}" readonly/>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="field" style="margin-bottom:12px;">
				<c:choose>
					<c:when test="${dto.address2 == null}">
						<input type="text" id="sample6_detailAddress" name="address2" placeholder="추가 주소" />
					</c:when>
					<c:otherwise>
						<input type="text"  id="sample6_detailAddress"  name="address2"  value="${dto.address2}"/>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- 다음 카카오 도로명 주소 검색을 위한 자바스크립트 코드들 -->
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				function sample6_execDaumPostcode() {
					new daum.Postcode( {
						oncomplete: function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if(data.userSelectedType === 'R'){
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if(data.buildingName !== '' && data.apartment === 'Y'){
									extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if(extraAddr !== ''){
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("sample6_extraAddress").value = extraAddr;

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_extraAddress").focus();
						}
					}).open();
				}
			</script><br>

			<div class="field_pet">
				<div class="field">
					<input type="text" name="petname" placeholder="반려견 이름"/>
				</div>
				<div class="field">
					<select name="kind">
						<option value="선택">선택</option>
						<option value="강아지">강아지</option>
						<option value="고양이">고양이</option>
					</select>
				</div>
				<div class="field">
					<select name="petgender">
						<option value="선택">선택</option>
						<option value="M">남아</option>
						<option value="F">여아</option>
					</select>
				</div>
				<div class="field" style="margin-top:20px">
					<input type="hidden" name="image" id="image" > <%--전송될 파일이름--%>
					<input type="hidden" name="saveimage" id="saveimage" >
					<div id="filename" style="display: flex; flex-direction: column-reverse; align-items: center;"></div>
				</div>
			</div>
		</div>
		<div class="btn" style="margin-top:50px;">
			<input type="submit" style="position:absolute; background:black; color:white; border:1px solid black; width: 300px;margin-top: 200px;" value="Join"  >
		</div>

	</form>
	<div style="position:relative; margin:0 auto;">
		<form name="formm" style="display: flex; flex-direction: row; justify-content: center;" id="fileupForm" method="post" enctype="multipart/form-data">
		<input type="file" name="fileimage" id="fileimage" style="display:none; ">

			<label for="fileimage" id="customButton" style="display:inline-block;
				padding: 6px 20px;
				color: black;
				background-color: white;
				border-radius: 5px;
				cursor: pointer;
				margin-left:50px;
				border: 1px solid black;">이미지 등록</label>
			<input type="button" id="myButton" style="background: white;
				color: black;
				border: 1px solid black;
				border-radius: 5px;
				margin-left:15px;
				padding-top: 6px;" value="추가">
		</form>
	</div>

	<span style="color:#333; margin-top:100px;">이미 계정이 있으신가요?&nbsp;<a href="loginform" style="font-weight:bold; text-decoration:underline;">로그인</a></span>

</div>

<%@ include file="css/member.jsp" %>
<%@ include file="../include/footer.jsp" %>
