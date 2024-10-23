<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호박마켓</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css">
</head>
<body>
	<%@ include file="./layout/header.jsp" %>
	<div class="content2">
		<img src="assets/images/2_img.webp" width='655' height='750' class='second_img'>
		<div class='content2_box'>
			<p class='small-title'>중고거래</p>
			<h1 class='content-title'>
				믿을만한<br>이웃 간 중고 거래
			</h1>
			<p class='content-font'>
				동네 주민들과 가깝고 따뜻한 거래를<br>지금 경험해보세요.
			</p>
			<a href="${pageContext.request.contextPath }/notice/list"><button class="content-button">
			<span class="button-text">공지사항 확인</span>
			</button></a><br> 
			<a href="${pageContext.request.contextPath}/sell/list"><button class="content-button">
			<span class="button-text">실시간 중고거래 보기</span>
			</button></a>
			
		</div><!--content2  -->
	</div>
	<div class="content3">
		<div class='content3_box'>
			<p class='small-title'>동네생활</p>
			<h1 class='content-title'>
				이웃만 아는<br>동네 정보와 이야기
			</h1>
			<p class='content-font'>
				우리동네의 다양한 정보와 이야기를<br>공감과 댓글로 나누어요.
			</p>
			<ul class='content3-ul'>
				<li class='content3-li'>
					<div>
						<img
							src='https://d1unjqcospf8gs.cloudfront.net/assets/home/main/rebranded-icon-story-1-f7be38c51a389f415e9c0ae94294a80d10a744c3006a2e3a5978c11f8fc8d5d5.svg'>
					</div>
					<div class='contnet3-li-text text-bold'>동네모임</div>
					<div class='content3-li-small-text'>
						근처 이웃들과 동네<br>이야기를 해보세요.
					</div>
				</li>
				<li class='content3-li'>
					<div>
						<img
							src='https://d1unjqcospf8gs.cloudfront.net/assets/home/main/rebranded-icon-story-2-5611a1d6fccb1e6b28adac130948d9701358f94fe7eb31daa224493bbd875c36.svg'>
					</div>
					<div class='contnet3-li-text text-bold'>동네질문</div>
					<div class='content3-li-small-text'>
						궁금한 게 있을 땐<br>이웃에 물어보세요.                                                                                                                                                                   		</div>
				</li>
				<li class='content3-li'>
					<div>
						<img
							src='https://d1unjqcospf8gs.cloudfront.net/assets/home/main/rebranded-icon-story-3-5a01573654c91fafeb8253238bac8a718edb7fdf3e49ce8b1a7b89c4aebc6f61.svg'>
					</div>
					<div class='contnet3-li-text text-bold'>동네분실센터</div>
					<div class='content3-li-small-text'>
						무언가를 잃어버렸다면<br>글을 올려보세요.
					</div>
				</li>
			</ul>
			<br><a href="community/list"><button
					class="content-button">
					<span class="button-text">동네 이야기 보기</span>
				</button></a>
		</div>
		<img src="assets/images/3_img.webp" width='650' height='750' class='content3_img'>
	</div><!-- content3 -->
	<div class='footer'>
		<div class='footer-content'>
			<ul class='footer-ul'>
				<li class='footer-li'><a class='footer-link'href="${pageContext.request.contextPath}/sell/list">중고거래</a></li>
				<li class='footer-li'><a class='footer-link'href="${pageContext.request.contextPath}/community/list">동네 이야기</a></li>
				<li class='footer-li'><a class='footer-link'href="${pageContext.request.contextPath }/notice/list">공지사항</a></li>
			</ul>
		</div>
		<div class='capyright'>
			<div class='capyright-left'>
				<span class='capyright-font'><span class="last-content-bold">프로젝트 명</span>
					중고거래 |  <span class="last-content-bold">팀명</span>
					개발팀</span><br> <span class='capyright-font'><span
					class="last-content-bold">팀원</span> 전예진,한주영,이광원,노희영,이재훈,강주찬,한진만,김태완</span><br>
				<span class='capyright-font'><span class="last-content-bold">개발기간</span>
					2024.03.12-03.28</span><br> <span
					class='capyright-font'><span class="last-content-bold">전화</span>
					1588-1588 | <span class="last-content-bold">고객문의</span>
					Fleamarket@daumnaver.com</span>
			</div>
			<div class='last'>
				<a class="last-content last-content-margin"
					href="mailto:contact@daangn.com">제휴 문의</a> 
				<a class="last-content"
					href="mailto:contact@daangn.com">광고 문의</a> 
				<a class="last-content"
					href="mailto:contact@daangn.com"><span class="text-bold">PR</span>문의</a> 
				<a class="last-content" href="mailto:contact@daangn.com"><span class="text-bold">IR</span>문의</a>
			</div>
			<div class='last'>
				<a class="last-content last-content-margin"
					href="https://www.daangn.com/policy/terms">이용약관</a> <a
					class="last-ent last-content-bold"
					href="https://privacy.daangn.com/">개인정보처리방침</a> <a
					class="last-content" href="https://www.daangn.com/policy/location">위치기반서비스
					이용약관</a> <a class="last-content"
					href="https://www.daangn.com/wv/faqs/3994">이용자보호 비전과 계획</a> <a
					class="last-content" href="https://www.daangn.com/wv/faqs/9010">청소년보호정책</a>
			</div>
		</div>
	</div>
</body>
</html>