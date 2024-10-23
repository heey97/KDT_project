<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호박 커뮤니티 상세페이지</title>
<meta name="viewport"
    content="width=device-width, initial-scale=1, user-scalable=no" />
<meta http-equiv="Cache-Control"
    content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/communityFront/css/read.css" />
</head>
<body class="is-preload">
<%@ include file="../layout/header.jsp" %>
<div id="page-wrapper">
	<section id="read" style="overflow: hidden;">
	<h3>동네 이야기</h3>
    <hr style="color:white;">
	<!-- 아래 ul id는 추후 변경 가능  -->
		<ul id="table24">
			<li>
				<ul class="mrow2">
					<li>제목</li>
					<li><c:out value="${dto.title}"/></li>
				</ul>
			</li>
			<li>
				<ul class="mrow2">
					<li>작성자</li>
					<li><c:out value="${dto.writer_id}"/>
					<span style="font-size: 70%; padding-left: 30px;"></span></li>
				</ul>
			</li>
			<li>
				<ul class="mrow4">
					<li>작성날짜</li>
					<li><fmt:formatDate value="${dto.crt_date }" type="both"/></li>
					<!-- pattern="yyyy-MM-dd HH:mm:ss , type= date,time,both -->
					<li>조회수</li>
					<li><c:out value="${dto.read_cnt}"/></li>
				</ul>
			</li>
			<li id="content">
				<ul>
					<li>내용</li>			
					<li>
						<textarea rows="20" disabled="disabled" 
						style="background-color:#f3f3f3;font-size:inherit;resize: none;border:none;"><c:out value="${dto.contents}"/></textarea>
					</li>				
				</ul>
			</li>
		</ul>
	<div style="text-align: center;margin-bottom: 10px;">
	<c:if test="${user.id==dto.writer_id }">  <!-- session 에 저장된 user애트리뷰트의 id와 작성자의 id 가 같은면 보이기 -->
		<a class="button" href="javascript:execute(1)">수정</a>  <!-- 자바스크립트 함수:인자값 1은 수정 -->
		<!--  예시 : 글 비밀번호 입력하여 삭제. -->
		<a class="button" href="javascript:execute(2)">삭제</a>  <!-- 자바스크립트 함수:인자값 2는 삭제  -->
	</c:if>
		<a class="button" href="list?page=${page }">목록</a>   <!-- 현재페이지 번호 전달 - 순서3) -->
	</div>
	<script type="text/javascript">
		function execute(f){
			let url
			let message
			if(f===1){			//아래 url 변수와 같이 조건삼항연산자로 변경가능
				message='글 수정하시겠습니까?'
			}else if(f===2){
				message='글 삭제하시겠습니까?'
			}
			const yn = confirm(message)
			if(yn) {
				url = (f===1)? 'update?community_idx='+${dto.community_idx} :(f===2)? 'delete?community_idx='+${dto.community_idx}:'#';
				location.href=url+'&page='+${page};  /* 현재페이지 번호 전달 - 순서3) */
			}else{
				alert('취소합니다.')
			}	
		}
	</script>
	<!-- 메인글 출력 끝 -->
	
	<hr>
	<!-- 댓글 등록 -->
	<form action="comment" method="post">
	<!-- 필요한 파라미터.화면에는 표시안함. -->
	<input type="hidden" name="mref" value="${dto.community_idx }">  <!-- 댓글 추가할 메인글의 idx(댓글테이블 mref.고정값)  -->
	<input type="hidden" name="comment_idx" value="0" >	<!-- 삭제할 댓글의 idx(고정값 아님)는 executeCmt 함수에서 설정  -->
	<input type="hidden" name="f" value="0">
	<input type="hidden" name="page" value="${page }">  <!-- 현재페이지 번호 전달 - 순서8) -->
	<input type="hidden" name="comment_id" class="input" value="${user.id }">
	<!-- 구현 완료 : 로그인한 사용자가 작성할때는 로그인 이메일,닉네임 가져와서 표시 -->			
		<ul>
			<%-- <li>${user.userid }</li> --%>
			<li>
				<ul style="display: flex;flex-direction: column;">
					<li>
						<textarea rows="5" cols="90" name="contents" 
						style="resize:none;margin-right:20px" 
						placeholder="로그인 후에 댓글을 작성하세요." class="input"></textarea>
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
				<textarea class="cmtcontents" disabled="disabled"
						  style="border: none;resize: none;"
				><c:out value="${cmt.contents }" /></textarea>
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

	function reset_contents() {
		document.forms[0].contents.value=''
	}
	
	function login() {
		sessionStorage.setItem('back', location.href);		//location.href 는 현재의 요청 url 읽어옵니다.
		location.href='../login/login'  // 로그인 후 글쓰기 url로 redirect 하기 위한 파라미터
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