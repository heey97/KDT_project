<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>호박 중고거래</title>
<style>
/* 전체 페이지 스타일 */
.container {
	max-width: 1200px; /* 컨테이너 최대 너비 설정 */
	margin: 0 auto; /* 가운데 정렬 */
	padding: 0 20px; /* 좌우 여백 추가 */
}

#contents {
	margin:auto;
	padding-top:75px;
	position:inherit;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 0px 10px 0px rgba(0.1, 0.1, 0.1, 0.1);
}
/* 헤더 아래로 컨텐츠 이동 */
#main {
	margin:auto;
	padding-top: 85px; /* 헤더 높이만큼 상단 여백 추가 */
	background-color: #fff; /* 페이지 백그라운드 색상 */
}
/* 메인 래핑 영역 스타일 */
#main-wrap {
	padding: 20px;
}

/* 검색 폼 스타일 */
#searchBar {
	text-align: center;
	margin-bottom: 20px;
}

#searchBar select, #searchBar button {
	padding: 12px;
	margin-right: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f8f9fa;
}

#searchBar select {
	width: 160px;
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath d='M6 8L1 3h10z'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-position: calc(100% - 10px) center;
	background-size: 12px;
	cursor: pointer;
}

#searchBar button {
	background-color: orange;
	color: white;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

#searchBar button:hover {
	background-color: darkorange;
}

/* 게시물 카드 스타일 */
#cards {
	list-style-type: none;
	padding: 0;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
}

.card {
	width: 300px;
	margin-bottom: 20px;
	padding: 10px;
	border: 1px solid #ddd;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* 화면이 768px 이하일 때 */
@media ( max-width : 768px) {
	.card {
		width: calc(50% - 20px); /* 한 줄에 2개씩 */
	}
}

/* 화면이 576px 이하일 때 */
@media ( max-width : 576px) {
	.card {
		width: calc(100% - 20px); /* 한 줄에 1개씩 */
	}
}

.card .card-image {
	text-align: center;
}

.card .card-image img {
	max-width: 100%;
	height: auto;
	border-radius: 5px;
}

.card .card-desc {
	padding: 10px;
}

.card .card-desc .title {
	font-weight: bold;
	font-size: 1.2em;
	margin-bottom: 5px;
}

.card .card-desc .price {
	color: #ff6600;
	font-size: 1.2em;
}

.card .card-desc .read_cnt {
	color: #666;
	font-size: 0.8em;
}

.card .card-desc .date {
	color: #999;
	font-size: 0.8em;
}

/* 페이징 버튼 스타일 */
.list {
	width: 700px;
	margin: auto;
	padding: 10px;
	text-align: center;
}

.list .pagenum {
	display: inline-block;
	width: 30px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	border-radius: 50%;
	background-color: #fff8f0;
	color: #000;
	text-decoration: none;
	font-weight: bold;
	margin-right: 5px;
	border: 1px solid #ccc;
}

.list .pagenum:hover {
	background-color: #ff9900;
	color: #fff;
}
</style>
</head>
<body>
	<%@ include file="../layout/header.jsp"%>

	<div id="main">
		<div id="main-wrap">
			<div class="container">
				<div id="contents">

					
					<div id="searchBar">
					<h2>호박 중고거래</h2>
						<form id="search">
							<select name="category" onchange="move()">
								<option value="">카테고리</option>
								<c:forEach var="dto" items="${cate}">
									<option value="${dto}">${dto}</option>
								</c:forEach>
							</select> <select name="sell_location" onchange="move()">
								<option value="">지역</option>
								<c:forEach var="dto" items="${loca}">
									<option value="${dto}">${dto}</option>
								</c:forEach>
							</select>
							<button type="submit">검색</button>
						</form>
					</div>

					<ul id="cards">
						<c:forEach var="dto" items="${list}">
							<li class="card">
								<div class="card-wrap">
									<div class="card-top">
										<div class="card-image">
											<a href="read?pdt_code=${dto.pdt_code}" class="title"> <c:choose>
													<c:when test="${fn:toLowerCase(dto.sell_stt) == 'n'}">
														<img class="card-photo" src="/upload/${dto.up_file}"
															alt="${dto.att_file} 사진">
													</c:when>
													<c:otherwise>
														<img class="card-photo sold-out" src="${pageContext.request.contextPath}/upload/soldout.png"
															alt="판매 완료">
													</c:otherwise>
												</c:choose>
											</a>
										</div>
									</div>
									<div class="card-desc">
										<div class="title">
											<c:out value="${dto.title}" />
										</div>
										<div class="price">
											<fmt:formatNumber value="${dto.price}" pattern="###,###" />
											원
										</div>
										<c:choose>
											<c:when test="${dto.sell_stt =='Y'}">
												<li style="color: red;"><i
													class="fa-solid fa-circle-xmark"></i>품절</li>
											</c:when>
											<c:otherwise>
												<i class="fa-solid fa-circle-xmark"></i>판매 중  
								</c:otherwise>
										</c:choose>
									</div>
									<div class="card-desc">
										<div class="read_cnt">
											<span>조회: <c:out value="${dto.read_cnt}" /></span>
										</div>
										<div class="date">
											<c:set var="now" value="<%=new java.util.Date()%>" />
											<fmt:parseDate value="${dto.sell_date}"
												pattern="yyyy-MM-dd HH:mm:ss" var="createAtDate" />
											<c:set var="diff" value="${now.time - createAtDate.time}" />

											<c:choose>
												<c:when test="${diff < 24 * 60 * 60 * 1000}">
													<c:set var="hours" value="${diff / (60 * 60 * 1000)}" />
													<fmt:formatNumber type="number" maxFractionDigits="0"
														value="${hours}" />시간 전
                                        </c:when>
												<c:otherwise>
													<fmt:formatDate value="${createAtDate}"
														pattern="yyyy년 MM월 dd일" />
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<div class="list">
						전체 글 개수:
						<c:out value="${paging.totalCount}" />
						<br>
						<hr>

						<a class="pagenum" href="?page=1">&lt;&lt;</a> <a class="pagenum"
							href="?page=${paging.startPage-1 }"
							style='<c:if test="${paging.startPage==1 }">display:none;</c:if>'>&lt;</a>

						<c:forEach var="i" begin="${paging.startPage }"
							end="${paging.endPage }">
							<a class="pagenum ieach" href="?page=${i }"><c:out
									value="${i }" /></a>
						</c:forEach>

						<a class="pagenum" href="?page=${paging.endPage+1 }"
							style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'>&gt;</a>
						<a class="pagenum" href="?page=${paging.totalPage }">&gt;&gt;</a>
					</div>

					<div data-num="5" id="datanum"></div>
				</div>
			</div>

		</div>
	</div>

	<!-- 페이징 처리 -->


	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							// 페이지 로드 시 URL에서 쿼리 파라미터 값 읽기
							const urlParams = new URLSearchParams(
									window.location.search);
							const category = urlParams.get('category');
							const sell_location = urlParams
									.get('sell_location');

							// 읽은 값으로 <select> 옵션 선택하기
							if (category) {
								document.getElementById('search').category.value = category;
							}
							if (sell_location) {
								document.getElementById('search').sell_location.value = sell_location;
							}
						});

		function move() {
			const form = document.getElementById('search');
			const category = form.category.value;
			const sell_location = form.sell_location.value;

			// 여기에 필요한 처리 추가
		}
	</script>

</body>
</html>