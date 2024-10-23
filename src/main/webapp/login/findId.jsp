<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
   <title>중고마켓 - 로그인</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
      <meta http-equiv="Pragma" content="no-cache">
      <meta http-equiv="Expires" content="0">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/loginFront/css/login.css">
 
</head>
<body class="is-preload">
<%@ include file="../layout/header.jsp" %>
<div id="page-wrapper">
			<!-- Header -->
		<div class="mycol-2" style="width:600px;">				
				<div class="login"> 
				  <h2>아이디 찾기</h2>
				  <form action="../find" method="GET">
				    <div class="mb-3">
				      <label for="name">이름:</label>
				      <input class="form-control" id="name" placeholder="이름을 입력하시오." type="text" name="name" required>
				    </div>
				    <div class="mb-3">
				      <label for="phonenum">전화 번호:</label>
				      <input type="text" class="form-control" id="phonenum" placeholder="전화 번호을 입력하시오." 
				      		name="phonenum" required>
				    </div>
				    <div class="form-check mb-3">
				    </div>
				    <button type="submit" class="btn-primary">아이디 찾기</button>
				  </form>
				</div>
		</div>
</div>
<script>
	console.log('${cookie.incorrect}')
	if('${cookie.incorrect.value}'==='y') {
		document.getElementById('incorrect').style.display='inline-block';
		document.cookie = 'incorrect' + "=; expires=Thu, 01 Jan 1970 00:00:10 GMT; path=/;";
	}
	console.log('incorrect','${cookie.incorrect.value}')
</script>

			
</body>
</html>
<!-- 계정 : wonder, minkr, chchch  패스워드 : thGH123!@4 -->
    