<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>판매 등록</title>
	<meta charset="UTF-8">
	<style type="text/css">
		input { width: 80%;}
	</style>
</head>
	<body class="is-preload">
		<div id="page-wrapper">
			<!-- Header -->
			<%@ include file="../layout/header.jsp" %>
			<section id="book">
			<h3>책장</h3>
			<p class="sub">판매할 물품을 등록하세요.</p>
			<hr style="color:white;">
			<form action="save" method="post" enctype="multipart/form-data">
			<!-- 주의 : enctype 속성을 꼭 확인하세요. 파일과 문자열 데이터를 같이 보낼 때 필요. -->
			<table style="width: 50rem;">
			<tr>
				<th style="width:25%;"><label>판매자 아이디</label></th>
				<td><input name="saleuser" value="${user.id }" readonly></td>
			</tr>
			<tr>
				<th><label>카테고리</label></th>
				<td><select name="category" onchange="move()" required="required">
		    				<option value="" >카테고리 </option>
		    				<c:forEach var="val" items="${cate}">
		    				<option value="${val}">${val} </option>
		    				</c:forEach>
		    			</select></td>
			</tr>
			<tr>
				<th><label>글 제목</label></th>
				<td><input name="title" required></td>
			</tr>
			<tr>
				<th><label>가격</label></th>
				<td><input type="number"  name="price" required></td>
			</tr>
			<!-- <tr>
				<th><label>거래 장소</label></th>
				<td><input name="sell_location" required></td>
			</tr> -->
			<tr>
				<th><label>거래 장소</label></th>
				<td><select name="sell_location" onchange="move()" required="required">
		    				<option value="" >거래 장소 </option>
		    				<c:forEach var="loca" items="${loc}">
		    				<option value="${loca}">${loca} </option>
		    				</c:forEach>
		    			</select></td>
			</tr>
			<tr>
				<th><label>글 내용</label></th>
				<td><input name="contents" required></td>
			</tr>
			<tr>
				<th><label>첨부 이미지</label></th>
				<td><input type="file" name="img" accept="image/*"   required></td>
			</tr>
			<tr>
			 	<td style="text-align: center;padding: 10px;" colspan="2">
			 	<button type="submit" class="book-btn">저장</button>
			 	<button type="reset" class="book-btn">다시쓰기</button>
			 	<button type="button" onclick="location.href='list'" class="book-btn">목록</button>
			 	</td>
			 </tr>
			</table>
			
			</form>
			
			
			
			
			
			
			</section>
			 <div data-num="3" id="datanum"></div>
	</div>		 
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.dropotron.min.js"></script>
				<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			<script src="../js/nav.js"></script>
			<script src="../js/editor.js"></script>
</body>
</html>
