<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<title>중고마켓</title>
 	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="0">
	        <meta name="description" content="" />
	        <meta name="author" content="" />
   
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sellFront/css/read.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sellFront/css/salemodal.css" />
    
   
</head>
<%-- header --%>	
<body class="is-preload">
<%@ include file="../layout/header.jsp" %>
<div id="page-wrapper">
	<section id="read" style="overflow: hidden;">
	<h3 style="text-align: center;">중고 거래</h3>
    <hr style="color:white;">
	<!-- 아래 ul id는 추후 변경 가능  -->
	<div class="sd_content1_table" id="mainarea">
		<div class="table">
			<div class="table1">
				<ul>
					<li>
						<img class="sellimage" src="/upload/${dto.up_file}" alt="${dto.att_file}">
					</li>
				</ul>
			</div>
			<div class="table2">
				<div class="table2_1">
					<ul >
						<li style="font-size: 35px; padding-top: 4px; font-weight: 360;"><c:out value="${dto.title}"/></li>
						<br>
						<li style="font-size: 40px; font-weight: bold;" ><c:out value="${dto.price}"/>원</li>
					</ul>
				</div>
								
				<div class="table2_2">
					<ul class="mrow2">
						<li>작성자</li>
						<li style="font-weight: bold; color: #ff6f00;"><c:out value="${dto.sell_id}"/>
					</ul>
					<ul class="mrow2">
						<li>작성날짜</li>
						<li><fmt:formatDate value="${dto.sell_date }" type="both"/></li>
								<!-- pattern="yyyy-MM-dd HH:mm:ss , type= date,time,both -->
					</ul>
					<ul class="mrow2">
								<li>판매여부</li>
								 <c:choose> 
								<c:when test="${dto.sell_stt =='Y'}">
									<li style="color: red;"><i class="fa-solid fa-circle-xmark"></i>품절</li>
								</c:when> 
								<c:otherwise>
									<i class="fa-solid fa-circle-xmark"></i>판매 중  
								</c:otherwise>
								</c:choose>    
					</ul>
					<ul class="mrow2">
								<li>조회수</li>
								<li><c:out value="${dto.read_cnt}"/>
					</ul>
					<ul class="mrow2">
								<li>거래지역</li>
								<li><c:out value="${dto.sell_location}"/>
					</ul>
				</div>
				<div class="buy">
					<c:if test="${dto.sell_stt=='Y' }">
						<i class="fa-solid fa-circle-xmark"></i>
					</c:if>
					<a id="buy" data-all="${dto.pdt_code},${dto.title},${dto.price},${dto.sell_id}"><i class="fa-regular fa-circle-play"></i>바로 구매</a> 
				</div>
				
			</div>
		</div>
		
		<div>
			<ul id="table24">
				<li id="content">
					<ul>
						<hr>					
						<li style="font-size: 18px; border-bottom: 1px solid #ececec;
    margin-top: 30px;
    padding-bottom: 10px;">상품정보</li>		
						<li>
							<textarea id="dto_contents" rows="20" disabled="disabled"><c:out value="${dto.contents}"/></textarea>
						</li>	 			
					</ul>
				</li>
			</ul>
		</div>
	</div>
<!-- 결제창 modal -->
<div class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h6 class="modal-title">중고거래-상품구매</h6>

				</div>
				<div class="modal-body">
					<div class="pay">
						<ul style="display: inline-flex;">
							<li id="SELL_ID" class="inline" style="color: #ff6f00; font-weight:bold;"></li>
							<li>님이 판매하시는 상품을 구매하시겠습니까?</li>
						</ul>
						<hr> 
						<ul style="display: inline-flex; margin-top: 30px;">
							<li style="margin-right: 50px">상품명</li>
							<li id="PDT_NAME" style="font-weight:bold;" ></li>
						</ul>
						<ul style="display: inline-flex; margin-top: 30px; margin-bottom: 50px">
							<li style="margin-right: 50px">판매가</li>
							<li id="PRICE" class="inline" style="font-weight:bold;" ></li>
							<li>원</li>
						</ul>
						
						
						
					</div>	
					<div class="pay">
							<!-- 결제 UI, 이용약관 UI 영역 -->
							  <div id="payment-method"></div>
							  <div id="agreement"></div>
					</div>
				</div>
				<div class="modal-footer" >
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창 닫기</button>
					  <!-- 결제하기 버튼 -->
					 <button id="payment-button" type="button" class="btn btn-secondary" data-bs-dismiss="modal">결제하기</button>
				</div>
			</div>
		</div>
	</div>
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.dropotron.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			<script src="../sellFront/js/nav.js"></script>
			<!-- 부트스트랩 - 모달 사용 -->
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
			<!-- 비동기 http 통신 axios api-->  <!-- 비동기 통신을 위한 자바스크립트 api -->
			<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
			<!-- 결제위젯 SDK 추가 -->
  			<script src="https://js.tosspayments.com/v1/payment-widget"></script>
  	<script type="text/javascript">

	const obj ={}
	let orderid=''
  	</script>		
  	<script src="../sellFront/js/toss.js"></script>		  <!--tossPayInit 함수가 정의 되어있습니다.  -->
	<script>
	const modal = new bootstrap.Modal(document.querySelector(".modal"))  /* 부트스트랩의 모달 기능을 제공하는 객체*/
    document.querySelector("#mainarea").addEventListener('click',function(evt){
       evt.preventDefault()         //a 태그 등 pagination 안에 있는 기본 클릭 동작을 중지
       //evt.stopPropagation()         //클릭 이벤트는 자식 또는 부모요소에 전달되는데 그것을 중지
       const target = evt.target
       if(target.tagName !== 'A') {return}         
       {
       const datas = target.getAttribute("data-all")
       const arr = datas.split(",");
       obj.pdt_code = arr[0];
       obj.title = arr[1];
       obj.price = arr[2];
       obj.sell_id = arr[3];
       //obj 객체는 tossPayInit() 함수에서 사용할 예정입니다.
       const now = new Date();
       // 정규식 \d 는 숫자 , \D 는 숫자가 아닌것
       orderid = now.toISOString().replace(/\D/g, '').slice(2, 14);
 //      const obj = {bcode :arr[0] ,title:arr[1] , price :arr[2] , saleuser:arr[3] }
       document.querySelector(".modal-body #SELL_ID").innerHTML = obj.sell_id
       document.querySelector(".modal-body #PDT_NAME").innerHTML = obj.title
       document.querySelector(".modal-body #PRICE").innerHTML = Number(obj.price).toLocaleString("ko-KR")
       modal.show();
       tossPayInit();      //toss 결제창 만드는 함수.
       }
    })
		
</script>	
	<!-- 메인글 출력 끝 -->
	<div style="text-align: center;margin-bottom: 10px;">
	  <button type="button" onclick="selllist()">목록</button>  
	</div>

	
	<!-- 댓글 등록 -->
	<form action="comment" method="post">
	<!-- 필요한 파라미터.화면에는 표시안함. -->
	<input type="hidden" name="pdt_code" value="${dto.pdt_code }">  <!-- 댓글 추가할 메인글의 idx(댓글테이블 mref.고정값)  -->
	<input type="hidden" name="comment_idx" value="0" >	<!-- 삭제할 댓글의 idx(고정값 아님)는 executeCmt 함수에서 설정  -->
	<input type="hidden" name="f" value="0">
	<input type="hidden" name="page" value="${page }">  <!-- 현재페이지 번호 전달 - 순서8) -->
	<input type="hidden" name="comment_id" class="input" value="${user.id }">
	<!-- 구현 완료 : 로그인한 사용자가 작성할때는 로그인 이메일,닉네임 가져와서 표시 -->			
		<ul>
			<li>
				<ul style="display: flex;flex-direction: column;">
					<li>
						<textarea rows="5" cols="90" name="contents" style="resize:none;margin-right: 10px;width: -webkit-fill-available; border-color: #ff6f00;
    border-radius: 4px;" placeholder="로그인 후에 댓글을 작성하세요." class="input"></textarea> 
					</li>				
					<li style="align-self: center;margin-bottom: 20px;">
<!-- 저장버튼 테스트를 위해 변경 --><c:if test="${sessionScope.user != null }">  <!-- 구현 완료 : 로그인 했을때 -->
								<button type="button" onclick="executeCmt('1',0)">저장</button>  <!-- 2번째 인자 0은 의미없음. -->
							</c:if>	
							<c:if test="${sessionScope.user == null }">		<!-- 구현 완료  : 로그인 안했들때 -->
								<button type="button" onclick="login()">로그인</button>
							</c:if>
					</li>
				</ul>
			</li>
			<li>
					<span>댓글</span>
					<span>[<c:out value="${dto.comment_cnt }" />]</span> <!-- 댓글갯수 -->
				<hr>
			</li>
			
			<!-- 댓글 목록 -->
			<c:forEach var="cmt" items="${cmtlist}">
			<li>
				<ul class="crow">
					<li><c:out value="${cmt.comment_id }" /></li>								
					<li><c:out value="${cmt.crt_date }" /></li>	
				<c:if test="${user.id==cmt.comment_id }">  <!-- session 에 저장된 user애트리뷰트의 id와 작성자의 id 가 같은면 보이기 -->		
					<li><a href="javascript:executeCmt('2','${cmt.comment_idx }')">삭제</a></li>								
				</c:if>	
				</ul>
			</li>
			<li>
				<textarea class="cmtcontents"  disabled="disabled" style="border: none; resize: none;"><c:out value="${cmt.contents }" /></textarea>
			</li>
			</c:forEach>
		</ul>	
	</form>
</section>	
<div data-num="5" id="datanum"></div>
</div>
<script type="text/javascript">
	const user = '${user.id}'
	const txtarea = document.querySelector('textarea[name="contents"]')
	if(user.length !=0)
		txtarea.placeholder = user + '님 댓글을 작성하세요.'

	//댓글 등록과 삭제 모두 post 방식으로 합니다.
	function executeCmt(fval, cidx) {
    console.log(fval);
    document.forms[0].f.value = fval;
    
    if (fval === '2') { // 댓글 삭제
        document.forms[0].comment_idx.value = cidx; /* hidden 타입 idx의 value 로 설정*/
        const yn = confirm('댓글 삭제하시겠습니까?');
        if (yn) document.forms[0].submit();
    } else if (fval === '1') { // 댓글 등록
        const contents = document.forms[0].contents.value.trim(); // 댓글 내용 가져오기
        if (contents === "") { // 댓글이 비어있는지 확인
            const confirmEmpty = confirm('댓글을 입력하세요.');
            if (confirmEmpty) {
                // 댓글 입력 안 함. 여기서는 그냥 넘어가도록 함.
            }
        } else {
            document.forms[0].submit();
        }
    } else if (fval === '3') {
        editComment(cidx);
    }
}
	
	function reset_content() {
		document.forms[0].content.value=''
	}
	
	function login() { 
		sessionStorage.setItem('back', location.href);		//location.href 는 현재의 요청 url 읽어옵니다.
		location.href='../login/login'  // 로그인 후 글쓰기 url로 redirect 하기 위한 파라미터
	}
	function selllist() { 
		sessionStorage.setItem('back', location.href);		
		location.href='../sell/list'  
	}
	
	var back = sessionStorage.getItem('back');
	if(back) {
		location.href=back;
		sessionStorage.removeItem('back');
	}
	
	
	

</script>
			<script src="../js/nav.js"></script>
</body>
</html>