<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<meta charset="UTF-8">
<style>
@font-face {
   font-family:'당근';
   src: url('당근.ttf') format('truetype');
}
*{
   font-family: '당근';   
}
joinbody{
   padding-top: 75px;
}

#header .nav_div{
   width: 100%;
   margin:auto;
   background: white;
   position: fixed;
   z-index:1;
   border-bottom: 1px solid #D3D3D3;
}


#header .nav_content_in{
   float: left;
   list-style:none;
   margin-left: 2%;
   justify-content: center;
   align-items: center;
}
#header .nav_button{
   color: #4d5159;
   font-style: normal;
   font-weight: 700;
   font-size:large;
   background-color: white;
   border: none;
   padding: 0.6rem 0.2rem;
   }
#header .nav_button:hover{
   opacity: 0.6;
   cursor: pointer;
}
#header .nav_right_button{
   /* float: right; */
   text-align : right;
   color: #4d5159;
   font-style: normal;
   font-weight: 700;
   height: 2.5rem;
   background-color: white;
   margin-left:1rem;
   margin-right:1rem;
   padding: 0.6rem 0.2rem;
   border: 2px solid #ffffff;
   border-radius: 0.2rem;
   padding-left: 0.7rem;
    padding-right: 0.7rem;
    padding-top: 0.4rem;
   }
#header .nav_right_button:hover{
   background: #F6F7F9;
   cursor: pointer;
}
#header .navbar{
   display: flex;
   background: white;
   width: 100%;
   top:0;
   height: 4em;
   display: flex;
   flex-direction: row;
   position: fixed;
}
#header .container-btn{
   text-align: right;
   margin-right: 10rem;
}


</style>
</head>
<body>
   <div id="header">
      
   <nav class='navbar'>
      <!-- 중고거래 / 인기거래 / 동네이야기 / 공지사항 / 마이페이지  -->
      <nav class='nav_div'>
         <div class="container-btn">
            <c:if test="${sessionScope.user == null }">
            <button type="button" class="nav_right_button" onclick="location.href='${pageContext.request.contextPath }/join/join.jsp'">회원가입</button>
            <button type="button" class="nav_right_button" onclick="location.href='${pageContext.request.contextPath }/login/login'">로그인</button>
            
            </c:if>
            
            <c:if test="${sessionScope.user != null }">   
                  <button type="button" class="nav_right_button" onclick="location.href='#'">${user.name}님</button>
                  <button type="button" class="nav_right_button" onclick="location.href='${pageContext.request.contextPath }/login/logout'">로그아웃</button>
                  <button type="button" class="nav_right_button" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage'">마이페이지</button>
            </c:if>
            
         </div>
         <div class='nav_content'>
            <ul>
               
               <li class='nav_content_in'><a href="${pageContext.request.contextPath}/index.jsp"><img alt="로고"
                     src="${pageContext.request.contextPath}/assets/images/pumpkin.jpg" width="70px" height="auto"></a>
               </li>
               <li class='nav_content_in'><a href="${pageContext.request.contextPath}/sell/list"><button
                        class='nav_button'>중고거래</button></a></li>
               <li class='nav_content_in'><a href="${pageContext.request.contextPath}/community/list"><button
                        class='nav_button'>동네 이야기</button></a></li>
               <li class='nav_content_in'><a href="${pageContext.request.contextPath }/notice/list"><button
                        class='nav_button'>공지사항</button></a></li>
            <c:if test="${sessionScope.user != null }">            
              <li class='nav_content_in'><a href="${pageContext.request.contextPath}/sell/write"><button
                        class='nav_button'>판매하기</button></a></li>
            </c:if>
            </ul>
         </div>
      </nav>
   </nav>
</div>
</body>
