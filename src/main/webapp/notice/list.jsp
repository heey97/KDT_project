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

<style>
#notice {
	padding-top: 35px;
}
/* 페이지 컨텐츠가 헤더 아래로 이동되도록 설정 */
#page-wrapper {
	padding-top: 75px; /* 헤더 높이만큼 상단 여백 추가 */
}

/* 검색 폼 스타일 */
#search {
	text-align: center; /* 가운데 정렬 */
	margin-bottom: 20px; /* 아래 여백 */
}

#search select, #search input[type="text"] {
	padding: 20px; /* 내부 여백 */
	margin-right: 30px; /* 오른쪽 여백 */
	border: none; /* 테두리 없음 */
	border-radius: 5px; /* 테두리 둥글게 */
	width: 160px;
}

#search-btn, button[type="button"] {
	background-color: orange;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	text-decoration: none;
	cursor: pointer;
	margin-right: 10px; /* 버튼 간격 조정 */
}

#search-btn:hover, button[type="button"]:hover {
	background-color: darkorange;
}

/* 게시글 목록 스타일 */
#main {
	list-style: none; /* 리스트 스타일 제거 */
	padding: 0; /* 내부 여백 제거 */
}

#main li {
	background-color: white; /* 흰색 배경 */
	padding: 10px; /* 내부 여백 */
	border-radius: 5px; /* 테두리 둥글게 */
}

#main li a.title {
	color: #FFA500; /* 주황색 텍스트 */
	font-weight: bold; /* 굵은 글씨체 */
	text-decoration: none; /* 밑줄 제거 */
}

#main li a.title:hover {
	color: #FFD700; /* 호버 시 밝은 주황색으로 변경 */
}

#main li ul.row {
	list-style: none; /* 리스트 스타일 제거 */
	padding: 0; /* 내부 여백 제거 */
	margin: 0; /* 외부 여백 제거 */
	display: flex; /* 플렉스 박스로 배치 */
	justify-content: space-between; /* 요소 사이의 간격 동일하게 배치 */
}

#main li ul.row li {
	flex-basis: 23%; /* 각 열의 너비 설정 */
}

/* 페이징 버튼 스타일 */
.pagenum {
	display: inline-block;
	width: 30px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	border-radius: 50%; /* 원 형태 */
	background-color: #fff8f0; /* 미색 배경 */
	color: #000;
	text-decoration: none;
	font-weight: bold;
}

.pagenum:hover {
	background-color: #ff9900; /* 호버 시 주황색 배경 */
	color: #fff;
}

#main li {
	padding: 10px; /* 내부 여백 추가 */
	border-radius: 5px; /* 둥근 테두리 설정 */
}

.container {
	max-width: 1200px; /* 컨테이너 최대 너비 설정 */
	margin: 0 auto; /* 가운데 정렬 */
	padding: 0 20px; /* 좌우 여백 추가 */
}

/* 리스트 제목 링크 스타일 수정 */
#main li .row li:nth-child(2) a {
	color: #333; /* 링크 색상 변경 */
	text-decoration: none; /* 밑줄 제거 */
	font-weight: bold; /* 글꼴 굵기 설정 */
	font-size: 16px; /* 글꼴 크기 설정 */
	transition: color 0.3s ease; /* 부드러운 색상 변화 애니메이션 */
}

/* 리스트 제목 링크 호버 스타일 수정 */
#main li .row li:nth-child(2) a:hover {
	color: #ff6600; /* 호버 시 색상 변경 */
}

.write-btn {
	background-color: orange;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	text-decoration: none;
	font-size: 16px;
	cursor: pointer;
}

.write-btn:hover {
	background-color: darkorange;
}

#contents {
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 0px 10px 0px rgba(0.1, 0.1, 0.1, 0.1);
}

#contents h3 {
	text-align: center;
}

.hihi {
	border-width: 1px 0 0 0;
	border-style: dotted;
	border-color: #bbb;
}

.list .pagenum {
	padding: 5px 10px;
	background-color: orange;
	color: #fff;
	text-decoration: none;
	margin-right: 5px;
	border-radius: 5px;
	border: 1px solid orange;
}

.list .pagenum:hover {
	background-color: #ff9933;
}

.list .pagenum:hover, .write-btn:hover {
	background-color: darkorange; /* 호버 시 밝은 주황색으로 변경 */
}
</style>
<html>
<head>
<title>호박 공지사항</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- <script src="https://kit.fontawesome.com/352c53403e.js" crossorigin="anonymous"></script> -->
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/noticeFront/css/list.css" /> -->
</head>

<body class="is-preload">

	<div id="page-wrapper">

		<!-- Header -->

		<%@ include file="../layout/header.jsp"%>

		<!-- Main -->
		<section class="wrapper style1" id="notice">
			<div class="container">
				<div id="contents">
					<!-- Content -->

					<article>
						<header class="guide">
							<h3>공지사항</h3>
						</header>
					</article>
					<hr
						style="border-width: 1px 0 0 0; border-style: dotted; border-color: #bbb;">
					<div id="search">
						<form action="list">
							<!-- Get 방식 처리 -->
							<select name="column" id="column">
								<!-- 아래 value 속성값은 테이블 컬럼명과 동일하게 해야합니다. -->
								<option value="none">선택</option>
								<option value="title">제목</option>
								<option value="contents">내용</option>
								<option value="crt_date">작성날짜</option>
							</select> <input type="text" name="findText" value="${paging.findText }"
								placeholder="검색할 단어를 입력하세요.">
							<button type="button" id="search-btn">검색</button>
							<button type="button" onclick="location.href='list'">전체보기</button>
						</form>
					</div>
					<hr
						style="border-width: 1px 0 0 0; border-style: dotted; border-color: #bbb;">
					<script type="text/javascript">
      const form = document.forms[0]
      document.querySelectorAll('option').forEach(ele => {
         if(ele.value=='${paging.column}')
            ele.selected=true
         else   
            ele.selected=false
      })
      document.querySelector('#search-btn').addEventListener('click',
               () => {
                  const find = document.forms[0].findText
                  const column = document.forms[0].column
                  if(find.value ==='' || column.value ==='none') {
                     alert('검색어 입력과 검색 항목 선택을 하세요.')
                     find.focus()
                  }else {
                      document.forms[0].submit();
                  }
               })
      document.querySelector('#column').addEventListener('change',
               () => {
                  const sel = form.column.value
                  if(sel == 'crt_date')
                     form.findText.type='date'   //선택한 항목 작성날짜일 때 input 타입 변경하기
                  else
                     form.findText.type='text'
               })
</script>
					<div>
						<ul id="main">
							<li>
								<ul class="row">
									<li>번호</li>
									<li>제목</li>
									<li>조회수</li>
									<li>작성일</li>
								</ul>
							</li>
							<hr class="hihi">
							<c:forEach var="dto" items="${list}">
								<li>
									<ul class="row">
										<li><c:out value="${dto.notice_idx }" /></li>
										<li><a href="read?notice_idx=${dto.notice_idx }"
											class="title"> <!-- 현재페이지 번호 세션에 저장했으므로 파라미터 전달 삭제 --> <c:out
													value="${dto.title }" />
										</a> <c:if test="${dto.up_file!=null }">
												<i class="fa-solid fa-floppy-disk"></i>
											</c:if></li>
										<li><c:out value="${dto.read_cnt }" /></li>
										<li>
											<!-- vo.createdAt 날짜 패턴을 적용한 결과 문자열을 createdAt 새로운 변수로 저장 -->
											<fmt:formatDate value="${dto.crt_date }" pattern="yyyy-MM-dd"
												var="crt_date" /> <!-- 오늘 작성한 글은 시간으로 표시 --> <c:if
												test='${crt_date == today}'>
												<fmt:formatDate value="${dto.crt_date }" type="time" />
											</c:if> <!-- 오늘 이전에 작성한 글은 날짜로 표시 --> <c:if
												test='${crt_date != today}'>
												<fmt:formatDate value="${dto.crt_date }"
													pattern="yyyy-MM-dd" />
											</c:if>
										</li>

									</ul>
								</li>
								<hr class="hihi">
							</c:forEach>
							<div style="float: left; margin: 40px;">
								<%--       <a href="write?page=${paging.currentPage }" class="button" >글쓰기</a> --%>
								<!-- 로그인 상태가 아니면 로그인으로 이동으로 변경 -->
								<c:if test="${user.id=='gmlduddl3' }">
									<a href="write" class="write-btn">글쓰기</a>
								</c:if>

							</div>
						</ul>

					</div>
					<script type="text/javascript">
   function writtte() {
      let yn
      if('${user.id}'==''){
         yn=confirm('글쓰기는 로그인이 필요합니다. 로그인 하시겠습니까?')
         if(yn) {
            location.href='../login/login' 
         }
         //location.href='../login?back=w'  // 로그인 후 글쓰기 url로 redirect 하기 위한 파라미터
      }else{
         location.href='write?page=${paging.currentPage }'
      }
   }
</script>

					<div class="list"
						style="width: 700px; margin: auto; padding: 10px; text-align: center;">

						<br>
						<hr
							style="border-width: 1px 0 0 0; border-style: dotted; border-color: #bbb;">
						<!-- <a class="pagenum" href="javascript:page('1')">&lt;&lt;</a> -->
						<!--(1) 첫번째 페이지 1번으로 이동 -->

						<!--(2)  실행하면서 파악해보세요. -->
						<!-- 요청은 ListController가 받음.page파라미터 변경됨. -->
						<a class="pagenum" href="?page=1">&lt;&lt;</a> <a class="pagenum"
							href="?page=${paging.startPage-1 }"
							style='<c:if test="${paging.startPage==1 }">display:none;</c:if>'>&lt;</a>

						<!--(3) 페이지 범위 startPage 부터 endPage 까지 반복 -->
						<c:forEach var="i" begin="${paging.startPage }"
							end="${paging.endPage }">
							<a class="pagenum ieach" href="javascript:page('${i }')"> <c:out
									value="${i }" />
							</a>
						</c:forEach>

						<!--(4)  실행하면서 파악해보세요. -->
						<a class="pagenum" href="?page=${paging.endPage+1 }"
							style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'>&gt;</a>

						<a class="pagenum" href="?page=${paging.totalPage }">&gt;&gt;</a>

						<!--(5) 가장 마지막 페이지로 이동 -->
					</div>
				</div>
			</div>

		</section>
		<script type="text/javascript">
   const pnums = document.querySelectorAll('.ieach');
   pnums.forEach(function(item){
      /* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
      if(item.innerHTML=='${paging.currentPage}') {    
         item.style.color = 'black';
         item.style.fontWeight = 'bold';
      }else{
         /* item.style.color = '#37966f'; */
      }
   });
   function page(pno){  /* 페이지이동 url을 만들고 이동하기 */
      let url = '?page=' + pno
      if('${paging.findText }'!='')
         url += '&findText=${paging.findText}&column=${paging.column}'
      location.href=url   
   }
   function readOne(notice_idx){
      let url = 'read?notice_idx='+notice_idx+'&page=' + ${paging.currentPage}
      if('${paging.findText }'!='')
         url += '&findText=${paging.findText}&column=${paging.column}'
      location.href=url   
   }
   
</script>

		<div data-num="1" id="datanum"></div>
	</div>

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>

</body>
</html>