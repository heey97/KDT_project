<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>호박 커뮤니티 글쓰기</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="0">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/communityFront/css/write.css" />
	<script src="https://kit.fontawesome.com/352c53403e.js" crossorigin="anonymous"></script>
<!-- 	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
</head>
<body class="is-preload">
<div id="page-wrapper">
<%@ include file="../layout/header.jsp" %>
			<section id="read">
			<h3>동네 이야기</h3>
			<hr style="color:white;">
			<form method="post" action="write">
			 <table>
			 	<tr><th width="100px;"><label>제목</label></th>
			 		<td><input type="text" name="title" size="50" required></td>
			 	</tr>
			 	<tr>
					<th><label>작성자</label></th>
			 		<td><input type="text" name="writer_id" value="${user.id}" 
			 		      size="50" readonly></td>
			 	</tr>
			 	<tr><th><label>내용</label></th>  <!-- textarea 의 크기 : rows="30" 는 행 크기, cols="80"은 열  크기 -->
			 		<td><textarea  rows="30" cols="80" name="contents" style="resize:none;"  required></textarea>
			 		<!--textarea 는 multi line(엔터키 입력으로 다중행) 입력이 됩니다.  --></td>
			 	</tr>
			 	<tr>
			 	<!-- <th></th> -->
			 	<td style="text-align: center;padding: 10px;" colspan="2">
			 	<button type="submit">저장</button>
			 	<button type="reset">다시쓰기</button>
			 	<button type="button" onclick="location.href='list?page=${(page eq null)?1:page}'">목록</button>
			 	<!-- 목록 돌아갈 페이지 값 없을 때 오류 방지를 위해 page 애트리뷰트값이 null 이면 1  -->
			 	</td></tr>
			 </table>
			 </form>
			 </section>
		</div>	 
		<div data-num="5" id="datanum"></div>
		<script src="../js/nav.js"></script>
</body>
</html>
<!-- 
	이클립스에 ipv4로 처리되도록 톰캣 설정을 바꿉니다.
	request 객체로 remoteAddr 받을 때 기본 설정이 ipv6로 출력됩니다.
	변경방법 : Run Configurations -> 왼쪽 항목에서 Tomcat Server 클릭 -> Arguments 탭에서
			 ->  VM argument 문자열 맨 마지막에 다음 내용 작성. -Djava.net.preferIPv4Stack=true

 -->