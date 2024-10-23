<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
  <title>중고마켓 - 로그인</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
      <meta http-equiv="Pragma" content="no-cache">
      <meta http-equiv="Expires" content="0">
 
 <link rel="stylesheet" href="${pageContext.request.contextPath}/loginFront/css/login.css">
 
<style>


</style>
</head>
<body class="is-preload">
<%@ include file="../layout/header.jsp" %>
<div id="page-wrapper">
         <!-- Header -->
         <div class="mycol-2" style="width:450px;">
	         
      </div>
      <div class="mycol-2" style="width:500px;">            
            <div class="login">
              <h2>회원 로그인</h2>
              <label id="incorrect">계정 정보가 일치하지 않습니다.</label>
              <form action="login" method="post">
                <div class="mb-3">
                  <label for="id">아이디:</label>
                  <input class="form-control" id="id" placeholder="아이디" type="text" name="id" maxlength="15" required>
                </div>
                <div class="mb-3">
                  <label for="pwd">패스워드:</label>
                  <input type="password" class="form-control" id="password" placeholder="비밀번호" 
                        name="password" maxlength="15" required>
                </div>
                <div class="form-check mb-3">
                  <label class="form-check-label">
                  </label>
                </div>
                <button class="btn btn-primary">로그인</button>
               <%-- <button type="button" class="btn btn-primary" 
                      onclick="location.href='${pageContext.request.contextPath}'">HOME</button> --%>
              </form>
              <hr>
              <a href="../join/join.jsp" class="f-sm">아직 회원이 아니시면 회원 가입을 해주세요.</a><br>
              <a href="findId.jsp" class="f-sm">😑 아이디 찾기가 필요하신가요?</a><br>
                 <a href="findPw.jsp" class="f-sm">😑 비밀번호 찾기가 필요하신가요?</a>
            </div>
      </div>
</div>
<script>
   /* 쿠키에 저장된 로그인 실패 정보 확인 : el에 쿠키 객체 cookie를 지원되므로 해당 쿠키이름 지정하여 사용합니다. */
   console.log('${cookie.incorrect}')
   if('${cookie.incorrect.value}'==='y') {
      document.getElementById('incorrect').style.display='inline-block';
      /* 쿠키삭제 */
      document.cookie = 'incorrect' + "=; expires=Thu, 01 Jan 1970 00:00:10 GMT; path=/;";
   }
   console.log('incorrect','${cookie.incorrect.value}')
</script>
        <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.dropotron.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         
</body>
</html>