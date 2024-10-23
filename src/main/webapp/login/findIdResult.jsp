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
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<div class="modal" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" id="content">

      <div class="modal-header">
       <h4> 아이디 찾기 </h4>  
	     </div>
 
      <div class="modal-body">
	      <form action="find" method="GET">
		      회원님의 아이디는 <%
		      String data = (String)request.getAttribute("member");
		      out.println(data);
		      %>입니다.</form>
		     </div>
		     <div class = "found-login">
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-danger" onclick="location.href='/KDT_TeamProject/login/login'">로그인</button>
      </div>

    </div>
  </div>
</div>

</html>