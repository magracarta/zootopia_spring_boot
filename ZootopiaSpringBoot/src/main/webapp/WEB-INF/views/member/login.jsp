<%@  page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<div class="container" style="height:auto;">
   <form method="post" action="login" name="loginForm">
      <h2>LOGIN</h2>
      <div class="field">
         <input name="userid" type="text" placeholder="아이디" />
      </div>
      <div class="field">
         <input name="pwd" type="password" placeholder="비밀번호"/>
      </div>         
	  <span style="float:right;">*&nbsp;${message}</span>
      <div class="btn">
      	 <input type="hidden" value="" name="referrer" class="referrer">
         <input type="submit" value="Login" >
         <input type="button" value="Join" onClick="location.href='joinform'">
      </div>
   </form>
</div>

<%@ include file="css/member.jsp" %>
<%@ include file="../include/footer.jsp" %>

