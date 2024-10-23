<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호박 커뮤니티</title>
<meta name="viewport"
    content="width=device-width, initial-scale=1, user-scalable=no" />
<meta http-equiv="Cache-Control"
    content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/communityFront/css/list.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/noticeFront/css/list.css" />
</head>
<body class="is-preload">
    <div id="page-wrapper">
        <%@ include file="../layout/header.jsp"%>
        <section style="overflow: hidden; padding:2rem;" id="list">
            <div style="padding: 2rem; width: 60rem; margin: auto;" class="table">
                <div>
                    <h3 style="text-align: center;">동네 이야기</h3>
                    <!-- <form action="" method="GET">
                        <input type="text" name="search" placeholder="검색어를 입력하세요">
                        <input type="submit" value="검색">
                    </form> -->
 
                 <hr style="border-width:1px 0 0 0; border-style:dotted; border-color:#bbb;">
					<div id="search">
						<form action="list">
							<!-- Get 방식 처리 -->
							<select name="column" id="column">
								<!-- 아래 value 속성값은 테이블 컬럼명과 동일하게 해야합니다. -->
								<option value="none">선택</option>
								<option value="title">제목</option>
								<option value="writer_id">작성자</option>
								<option value="contents">내용</option>
								<option value="crt_date">작성날짜</option>
							</select> <input type="text" name="findText" value="${paging.findText }"
								placeholder="검색할 단어를 입력하세요.">
							<button type="button" id="search-btn">검색</button>
							<button type="button" onclick="location.href='list'">전체보기</button>
						</form>
					</div>
					<hr style="border-width:1px 0 0 0; border-style:dotted; border-color:#bbb;">	
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
                    <ul id="main">
                        <li>
                            <ul class="row">
                                <li>번호</li>
                                <li>제목</li>
                                <li>작성자</li>
                                <li>조회수</li>
                                <li>작성일</li>
                            </ul>
                        </li>

				<c:forEach var="dto" items="${list}"> 
				    <li>
				        <ul  class="row">
				            <li>
				                <c:out value="${dto.community_idx }"/>
				            </li>
				            <li><a href="read?community_idx=${dto.community_idx }&page=${paging.currentPage}" class="title">  
				                    <c:out value="${dto.title }"/>
				                </a>
				                ..<span style="color:orange;font-size: 80%;">(<c:out value="${dto.comment_cnt}"/>)
				                </span>
				            </li>
				            <li>
				                <c:out value="${dto.writer_id }"/>
				            </li>
				            <li>
				                <c:out value="${dto.read_cnt}"/>
				            </li>
				            <li>
				                <fmt:formatDate value="${dto.crt_date}" pattern="yyyy-MM-dd" var="crt_date"/>
				                <c:if test='${crt_date == today}'>
				                    <fmt:formatDate value="${dto.crt_date }" type="time"/>
				                </c:if>
				                <c:if test='${crt_date != today}'>
				                    <fmt:formatDate value="${dto.crt_date }" pattern="yyyy-MM-dd"/>
				                </c:if>
				            </li>
				        </ul>
				    </li>
				</c:forEach>
				</ul>
				</div>
							

                <button onclick="cwrite()">글쓰기</button>

                <script type="text/javascript">
                    function cwrite() {
                        let yn
                        if ('${user.id}' == '') {
                            yn = confirm('글쓰기는 로그인이 필요합니다. 로그인 하시겠습니까?')
                            if (yn) {
                                sessionStorage.setItem('back',
                                        './community/write');
                                location.href = '../login/login'
                                
                            }
                        } else {
                            location.href = 'write?page=${paging.currentPage }'
                        }
                    }
                </script>

                <div
                    style="width: 100%; margin: auto; padding: 10px; text-align: center; float: none;"
                    class="list">
                    
                    <hr style="border-width:1px 0 0 0; border-style:dotted; border-color:#bbb;">
                    <br>
                    <a class="pagenum" href="?page=1">&lt;&lt;</a> 
                    <a class="pagenum"href="?page=${paging.startPage-1 }"
                    style='<c:if test="${paging.startPage==1 }">display:none;</c:if>' >&lt;</a>
                    
                    <c:forEach var="i" begin="${paging.startPage }"
                        end="${paging.endPage }">
                        <a class="pagenum ieach" href="?page=${i }"><c:out
                                value="${i }" /></a>
                    </c:forEach>
                    
                <a class="pagenum" href="?page=${paging.endPage+1 }"
                        style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>' >&gt;</a>
                        
                <a class="pagenum" href="?page=${paging.totalPage }">&gt;&gt;</a>
                
                </div>
            </div>
            <div data-num="5" id="datanum"></div>
        </section>
        
        <script type="text/javascript">
            const pnums = document.querySelectorAll('.ieach');
            pnums.forEach(function(item) {
                console.log(item);
                /* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
                if (item.innerHTML == '${paging.currentPage}') {
                    item.classList.add('current')
                } else {
                    item.classList.remove('current')
                }
            });
        </script>
    </div>

    <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="../assets/js/jquery.dropotron.min.js"
        type="text/javascript"></script>
    <script src="../assets/js/browser.min.js" type="text/javascript"></script>
    <script src="../assets/js/breakpoints.min.js" type="text/javascript"></script>
    <script src="../assets/js/util.js" type="text/javascript"></script>
    <script src="../js/nav.js" type="text/javascript"></script>
</body>
</html>
