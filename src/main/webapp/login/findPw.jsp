<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri ="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
		<div class="mycol-2" style="width:600px;">				
				<div class="login"> 
				  <h2>비밀번호 찾기</h2>
				  <form action="../find" method="GET">
				    <div class="mb-3">
				      <label for="id">아이디:</label>
				      <input class="form-control" id="id" placeholder="아이디를 입력하시오" type="text" name="id" required>
				    </div>
				    <div class="mb-3">
				      <label for="email">이메일:</label>
				      <input type="text" class="form-control" id="email" placeholder="이메일를 입력하시오." 
				      		name="email" required>
				    </div>
				    <div class="form-check mb-3">
				    </div>
				    <button type="submit" class="btn-primary">비밀번호 찾기</button>
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