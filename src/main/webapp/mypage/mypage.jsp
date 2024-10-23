<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>${user.name }님의홈</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/mypageFront/css/Mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/mypageFront/css/profileuplod.css">

</head>
<div class="headpage" style="padding-top: 6%">
	<h2>${user.name }님을위한 작은 비밀의공간</h2>
</div>
<body>
	<%@ include file="../layout/header.jsp"%>
	<hr>
	<div class="My">
		<div class="change">
		<button id="openModalBtn" class="Profile">프로필 사진 수정</button>
			<button onclick="location.href='../mypage/modify.jsp'" type="button"
				class="Profile">정보수정</button>
				<button onclick="location.href='../mypage/change_password.jsp'" type="button"
					class="Profile">비밀번호변경</button>
			</div>
		</div>
	<div class="container" style="float: left;"></div>
	<div class="apple" 
		style="background-image: url('${pageContext.request.contextPath}/assets/images/backiamge.png');">
		<div class="image">
			<img src="${pageContext.request.contextPath}/assets/images/pumpkin2.png" width="100" height="100" 
			 >
			<div class="sta">
				<img src="${pageContext.request.contextPath}/assets/images/sta.png" width="15" height="14" alt="작은별점 0점이미지">
				<img src="${pageContext.request.contextPath}/assets/images/sta.png" width="15" height="14" alt="작은별점 0점이미지">
				<img src="${pageContext.request.contextPath}/assets/images/sta.png" width="15" height="14" alt="작은별점 0점이미지">
				<img src="${pageContext.request.contextPath}/assets/images/sta.png" width="15" height="14" alt="작은별점 0점이미지">
				<img src="${pageContext.request.contextPath}/assets/images/sta.png" width="15" height="14" alt="작은별점 0점이미지">
				<div class="back-container">
					<div class="back">
						<div class="A">
							<div class="name">${user.name }님</div>
						</div>
					</div>
					<div class="Mypage">
						<!-- <a class="Mypage" href="protest.jsp">프로필 이미지 수정</a>  -->
						<div id="myModal" class="modal">
							<div class="modal-content">
								<span class="close">&times;</span>
								<h1>프로필 사진 수정</h1>
								<form action="uploadedImage" method="post"
									enctype="multipart/form-data" id="uploadForm">
									<input type="file" name="profileImage"> <input
										type="submit" value="프로필 사진 업로드"> <label
										for="fileInput" class="upload-btn">이미지 선택</label>
									<button type="submit" class="Profile" >사진 수정</button>
								</form>
								<!-- 오류 및 성공 메시지 표시 -->
								<div id="message"></div>

								<!-- 수정 전 후 이미지 -->
								<div class="image-container">
									<div>
										<h2>수정 전</h2>
										<img src="${pageContext.request.contextPath}/assets/images/pumpkin2.png" alt="Before Image"
											id="beforeImageTag">
									</div>
									<div>
										<h2>수정 후</h2>
										<img src="#" alt="" id="uploadedImage">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="memo" >
		<pre>
${user.name }님 반갑습니다!
필요하신 부분을 선택하여주세요!
</pre>
	</div>
	<div class="container">
		<h3 class="sell-image" onclick="toggleSection('community')">
			<img src="${pageContext.request.contextPath}/assets/images/ct.png" width="20" height="20"> 커뮤니티
		</h3>
		
				<br>
		<form action="mypage" method="GET">
			<div id="community" class="hidden">
			<h4>나의 게시글</h4>
				<c:forEach var="item" items="${contentList}">
				    <div class="sell-top">
				        <div class="sell-image" onclick="redirectToCommunityPage('${item.community_idx}')">
				           	게시글 번호 : <c:out value="${item.community_idx}" />    ||
				           	제목 : <c:out value="${item.title}" />    || 
				            조회수 : <c:out value="${item.read_cnt}" />    ||
				            조회수 : <c:out value="${item.comment_cnt}" />    ||
				            등록 일자 : <fmt:parseDate value="${item.crt_date}" pattern="yyyy-MM-dd HH:mm:ss" var="createAtDate" />
                                 <fmt:formatDate value="${createAtDate}" pattern="yyyy년 MM월 dd일" />
				    </div>
				</div>
				<hr style="border-width:1px 0 0 0; border-style:dotted; border-color:#bbb;">
				</c:forEach>
			</div>
		</form>
		
		<h3 onclick="toggleSection('transactions')" class="sell-image">
			<img src="${pageContext.request.contextPath}/assets/images/buy2.png" width="20" height="20"> 나의 거래
		</h3>
			<div id="transactions" class="hidden">
			<h4 onclick="toggleSection('sell')" class="sell-image">판매내역</h4>
					<form action="mypage" method="GET">
			<div id="sell" class="hidden">
				<c:forEach var="item" items="${sellList}">
				    <div class="sell-top">
				        <div class="sell-image" onclick="redirectToProductPage('${item.pdt_code}')">
				            제목 : <c:out value="${item.title}" />    || 판매 여부 : 
				            <c:choose> 
								<c:when test="${item.sell_stt !='N'}"> 
									<c:out value="판매 중" />
								</c:when> 
							<c:otherwise> 
									<c:out value="판매완료" />
							</c:otherwise>
							</c:choose>    || 
				            조회수 : <c:out value="${item.read_cnt}" />    ||
				            가격 : <fmt:formatNumber value="${item.price}" pattern="###,###" />원    ||
				             등록 일자 : <fmt:parseDate value="${item.sell_date}" pattern="yyyy-MM-dd HH:mm:ss" var="createAtDate" />
                                 <fmt:formatDate value="${createAtDate}" pattern="yyyy년 MM월 dd일" />
				    </div>
				</div>
				<hr style="border-width:1px 0 0 0; border-style:dotted; border-color:#bbb;">
				</c:forEach>
			</div>
		</form>
			<h4 onclick="toggleSection('buy')" class="sell-image">구매내역</h4>
		<form action="mypage" method="GET">
			<div id="buy" class="hidden">
				<c:forEach var="item" items="${buyList}">
				<div class="sell-wrap">
				    <div class="sell-top">
				        <div class="sell-image" onclick="redirectToProductPage('${item.buy_code}')">
				            <c:out value="제목 : ${item.title}" />    ||
				            <c:out value="판매자 : ${item.sell_id}" />    ||
				            가격 : <fmt:formatNumber value="${item.price}" pattern="###,###" />원    ||
				            구매날짜 : <fmt:parseDate value="${item.pay_date}" pattern="yyyy-MM-dd HH:mm:ss" var="createAtDate" />
                                 <fmt:formatDate value="${createAtDate}" pattern="yyyy년 MM월 dd일" />
				        </div>
				    </div>
				</div>
				<hr style="border-width:1px 0 0 0; border-style:dotted; border-color:#bbb;">
				</c:forEach>
			</div>
		</form>
		</div>
</div>

	<script>
		function redirectToProductPage(pdtCode) {
	        window.location.href = 'sell/read?pdt_code=' + pdtCode;
	    }
		function redirectToCommunityPage(idx) {
	        window.location.href = 'community/read?community_idx='+ idx;
	    }
		function toggleSection(sectionId) {
			var section = document.getElementById(sectionId);
			if (section.classList.contains('hidden')) {
				section.classList.remove('hidden');
				section.previousElementSibling.classList.add('open');
			} else {
				section.classList.add('hidden');
				section.previousElementSibling.classList.remove('open');
			}
		}
		var modal = document.getElementById("myModal");

		// 모달 열기 버튼 가져오기
		var btn = document.getElementById("openModalBtn");

		// 모달 닫기 버튼 가져오기
		var span = document.getElementsByClassName("close")[0];

		// 모달 열기 버튼 클릭 시 모달 열기
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// 모달 닫기 버튼 클릭 시 모달 닫기
		span.onclick = function() {
			modal.style.display = "none";
		}

		// 사용자가 모달 외부를 클릭하면 모달 닫기
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}

		// 파일 입력 필드 변경 시 미리보기 업데이트
		var fileInput = document.getElementById('fileInput');
		var uploadedImage = document.getElementById('uploadedImage');

		fileInput.addEventListener('change', function(event) {
			var file = event.target.files[0];
			var reader = new FileReader();
			reader.onload = function(event) {
				// 이미지를 표시할 요소의 src 속성에 읽은 파일의 데이터 URL을 설정합니다.
				uploadedImage.src = event.target.result;
				// 이미지 크기를 180x180 픽셀로 조정합니다.
				uploadedImage.style.width = "180px";
				uploadedImage.style.height = "180px";
				// 이미지가 원본 비율을 유지하면서 조정되도록 object-fit을 설정합니다.
				uploadedImage.style.objectFit = 'cover';
			}
			reader.readAsDataURL(file);
		});
		// 이미지 비교를 위한 수정 전 이미지 경로
		var beforeImageSrc = "assets/images/pumpkin2.png";
		var beforeImageTag = document.getElementById("beforeImageTag");
		beforeImageTag.src = beforeImageSrc;

		// 폼 제출 이벤트 처리
		var uploadForm = document.getElementById("uploadForm");
		uploadForm.addEventListener('submit', function(event) {
			// 폼이 실제로 전송되는 것을 방지
			event.preventDefault();

			// 수정 후 이미지 경로 업데이트
			var modifiedImagePath = uploadedImage.src;

			// 수정 전 이미지와 함께 수정 후 이미지 비교
			document.getElementById("uploadedImage").src = modifiedImagePath;
		});
	</script>
</body>

</html>