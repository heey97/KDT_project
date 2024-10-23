<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호박마켓</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <style type="text/css">
		  #myModal{
		  	display: block;
		  }
  </style>
  <script>
  <%
   int data = (int)request.getAttribute("findPwResult");
  %>
  if ("<%= data %>" === '1') {
    alert("임시 비밀번호메일을 발송하였습니다.");
    	location.href = "/KDT_TeamProject/login/login";
  } else if ("<%= data %>" === '0') {
	    alert("아이디 또는 이메일을 정확하게 입력해 주세요.");
	    location.href="/KDT_TeamProject/login/findId.jsp"
  } else if ("<%= data %>" === '-1') {
	    alert("찾기 오류.");
	    location.href="/KDT_TeamProject/login/login"
  }
  
</script>
</head>
</html>