<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<!--
	Arcana by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
	<title>호박 공지사항 상세페이지</title>
	<meta charset="utf-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/noticeFront/css/read.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath }/css/list.css?v=3">
		
</head>

<body class="is-preload">

	<div id="page-wrapper">

		<!-- Header -->
<%@ include file="../layout/header.jsp" %>		
		<!-- Main -->
		<section class="wrapper style1" id="notice">
			<div class="container">
				<div id="contents">

					<!-- Content -->

					
					<div class="notice">
						<h3>공지사항</h3>
						 <table>
						 	<tr><th width="20%"><label>제목</label></th>
						 		<td width="45%"><input type="text" name="title" size="70" value="${dto.title }" disabled></td>
						 		<th width="20%"><label></label></th>
						 		<td></td>
						 	</tr>
						 	<tr><th><label>작성날짜</label></th>
						 		<td colspan="3"><fmt:formatDate value="${dto.crt_date }" type="both"/></td>
						 	</tr>
						<!--  --> 	<tr><th><label>첨부파일</label></th>
						 		<td colspan="3">
						 			<c:if test="${dto.up_file!=null }">
						 				<form action="download" method="post" name="downFrm">
						 					<input type="hidden" value="${dto.att_file}" name="att_file">
						 					<input type="hidden" value="${dto.up_file}" name="up_file">
						 				</form>
						 				<a id="download" style="cursor:pointer"><c:out value="${dto.att_file }" /></a>
						 			</c:if>
						 			<c:if test="${dto.up_file==null }">
						 				<span>첨부파일 없음</span>
						 			</c:if>
						 		</td>
						<!--  --> 	</tr>
						 	<tr><th><label>내용</label></th> 
						 		<td colspan="3"><textarea  rows="15" cols="80" 
						 		name="contents" style="resize:none;"  disabled><c:out value="${dto.contents }" /></textarea>
						 	</tr>
						 	<tr>
						 		<td colspan="4" style="text-align: center;padding: 1em 4em;">
							 		<a class="button user" href="javascript:execute(3)">목록</a>
							 			<!--  list?page=${paging.currentPage}&findText=${paging.findText}&column=${paging.column} -->
									<c:if test="${user.id=='gmlduddl3'}">  <!-- session 에 저장된 user애트리뷰트의 id와 작성자의 id 가 같은면 보이기 -->
										<a class="button adm" href="javascript:execute(1)">수정</a>  <!-- 자바스크립트 함수:인자값 1은 수정 -->
										<!--  예시 : 글 비밀번호 입력하여 삭제. -->
										<a class="button adm" href="javascript:execute(2)">삭제</a>  <!-- 자바스크립트 함수:인자값 2는 삭제  -->
									</c:if>
						 		</td>
						 	</tr>
						 </table>
					</div>	 
				</div>	
			</div>	
		</section>

	<div data-num="1" id="datanum"></div>
	</div>

	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script type="text/javascript">
			function execute(f){
				let url
				let message = (f===1)?'글 수정하시겠습니까?':(f===2)?'글 삭제하시겠습니까?':''
				let yn=false
				//f값에 따라 기본 url 설정하기
				if(f===1 || f===2){
					yn = confirm(message)
					if(yn) 
						url = (f===1)? 'update?notice_idx=${dto.notice_idx}' :(f===2)? 'delete?notice_idx=${dto.notice_idx}':'#';
				}else if(f===3){
					yn=true
					url='list?'
					url += 'page='+${paging.currentPage };    //파라미터에 페이지번호 추가
					if('${paging.findText }'!='')		//검색값이 있을 때 파라미터에 검색값 2개 추가
						url += '&findText=${paging.findText }&column=${paging.column }'
				}else return;
				//cofirm 에서 `예`를 클릭하면
				console.log(yn)
				if(yn) {
					location.href=url
				}else {
					alert('취소합니다.')
				}	
			}
			
			function downloadfile(event){
				event.preventDefault()
				alert('ok')
				document.forms[0].submit()
			}
			document.querySelector("#download").addEventListener('click',downloadfile)
			
		</script>	
</body>
</html>