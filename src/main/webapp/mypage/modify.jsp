<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/modify.css">
<body class="is-preload">
	<%@ include file="../layout/header.jsp" %>
	<div id="page-wrapper" style="padding-top: 75px;">
    <hr>
  	<div class="cont">
                <form id="form" action="drop" method="POST">
                    <ul class="join-wrap">
                        <li>아이디</li>
                        <li>
                            <input class="id-input" type="text" value="${sessionScope.user.id }" disabled/>
                            <input name="id" type="hidden" value="${sessionScope.user.id }"/>
                        </li>
                       <!--  <li>비밀번호 <label>(영문 대/소문자, 특수문자를 포함 10-20자로 입력해주세요.)</label>-<label>사용가능 특수문자 : !@#$%^&* </label></li>
                        <li><input name="password" type="password" placeholder="비밀번호를 입력해 주세요."  /></li>
                        <li>비밀번호 확인</li>
                        <li><input name="password2" type="password" placeholder="비밀번호를 다시 한번 입력해 주세요." /></li> -->
                        <li>이름</li>
                        <li><input id="name" name="name" type="text" value="${sessionScope.user.name}" disabled/></li>
                        <li>생년월일</li>
                        <li id="birthChk"><input id="birth" name="birth" type="text" value="${sessionScope.user.birth }" disabled /></li>
                        <li>성별</li>
                        <li>
                            <input type="radio" id="male" name="gender" value="MALE" disabled>
                            <label for="male">남자</label>
                            <input type="radio" id="female" name="gender" value="FEMALE" disabled>
                            <label for="female">여자</label>
                        </li>
                        <li>전화번호</li>
                        <li><input id="phonenum" name="phonenum" type="text"  value="${sessionScope.user.phonenum}" class="change"/></li>
                        <li>이메일</li>
                        <li><input id="email" name="email" type="text" value="${sessionScope.user.email}" class="change"/></li>
                        <li>주소<label> (선택)</label></li>
                        <li>
                            <input class="post-input change" id="postalCode" name="postalCode" type="text" value="${sessionScope.user.postalCode }" readonly/>
                            <button type="button" onclick="showPostCode()" class="btn-m">검색</button>
                        </li>
                        <li><input id="add_city" name="add_city" type="hidden" placeholder="시/도" />
                            <input id="add_state" name="add_state" type="hidden" placeholder="구"/>
                            <input id="add_dong" name="add_dong" type="text" value="${sessionScope.user.add_dong }" class="change" readonly/>
                        </li>
                        <li><input id="add_details" name="add_details" type="text" value="${sessionScope.user.add_details }" class="change" readonly/></li>
						<li>관심 분야</li>
						<li>
						<div id="selfavorites">
	                        <div class="form-check form-check-inline">
	                            <input type="checkbox" class="form-check-input" value="소설" id="novel">
	                            <label  for="novel">소설</label>
	                            </div>
	                        
	                        <div class="form-check form-check-inline">
	                            <input type="checkbox" class="form-check-input" value="시" id="poet">
	                            <label class="form-check-label" for="poet">시</label>
	                        </div>
	                        <div class="form-check form-check-inline">
	                            <input type="checkbox" class="form-check-input" value="만화" id="comic">
	                            <label class="form-check-label" for="comic">만화</label>
	                        </div>
	                        <div class="form-check form-check-inline">
	                            <input type="checkbox" class="form-check-input" value="에세이" id="essay">
	                            <label class="form-check-label" for="essay">에세이</label>
	                        </div>
                    <div class="col-auto">
                    		<input type="text" class="subjects form-control-sm change" id="etc" >
                    </div>
                		</div>
						</li>
                    </ul>
                    <div class="hidden">
                        <input id="channel" name="channel" type="hidden"/>
                        <input id="favorite" name="favorite" type="hidden" value="${sessionScope.user.favorites }"/>
                    </div>
                    <button type="button" class="join-btn" onclick="modify()">저장</button>
                    <button class="join-btn drop "type="submit">회원 탈퇴</button>
                </form>
            </div>
    <hr>
</div>    
 <script type="text/javascript">
 	const gender = '${sessionScope.user.gender }'
 	if(gender=='MALE')
 		document.getElementById('male').checked = true
 	else
 		document.getElementById('female').checked = true
 		
 	const favorites =  document.getElementById('favorite')	//사용자의 관심분야 문자열
 	const arrAll = favorite.value.split(',')
 	const etc = document.getElementById('etc')
 	const checkItemArray=['소설','시','만화','에세이']
 	
	 let arrFavorite = arrAll.filter(item => checkItemArray.includes(item));
	 favorite.value=arrFavorite.toString()	
     let diff = arrAll.filter(item => !checkItemArray.includes(item));
	 etc.value=diff.toString()		//기타 관심분야 설정
	 
 	//관심분야 체크박스 설정
 	document.querySelectorAll('.form-check-input').forEach(item =>{
 	// checkItemArray.push(item.value)		//체크박스 항목을 여기서 알아올수도 있음.
     if(arrFavorite.length!=0 && arrFavorite.includes(item.value)) {
         item.checked=true;
     }
     else item.checked=false
 	})
     

 	
 	 // 관심분야 체크박스 이벤트
 	 const checkFavorite =e => {
	//    e.preventDefault()
	   	 e.stopPropagation()
	
	    const target = e.target
	    if(target.tagName !== 'INPUT') {return}
	
	    if(target.checked) arrFavorite.push(target.value)        //체크 상태이면 배열에 넣기
	    else {      //체크 해제 상태이면 기존 배열에서 삭제하기
	        const index = arrFavorite.indexOf(target.value);     //해당 값의 배열 위치를 알아내기
	        if (index !== -1) { arrFavorite.splice(index, 1); 	}       //해당 위치에서 삭제하기
	    }
	    favorite.value = arrFavorite.toString()
		
	}
		// id 'checkSubjects' 는 checkbox input 모두를 포함하고 있는 div 태그 입니다.
		// checkbox 요소가 많으므로 부모 요소에 이벤트를 주는 방식으로 합니다.
		document.querySelector('#selfavorite').addEventListener('click', checkFavorite)
		
	function modify() {
       favorite.value =favorites.value + "," +etc.value
        const data = $('#form').serializeObject();

        if(data.email == "") {
          alert("이메일을 입력하세요.")
          return;
        }

        if(!checkEmail(data.email))	{
          alert("이메일 형식이 올바르지 않습니다.");
          return;
        }

        console.log('modify',data);
        $.ajax({
          url        : '../mypage/mypage/modify',
          data       : JSON.stringify(data),
          dataType       : 'text',
          type       : 'post',
         contentType: 'application/json',
          success : function(res){
            alert(res);
            location.href = "modify";
          },
          error : function(xhr){
            console.log(xhr);
          }
        });
      }

      /* daum 우편번호 검색 */
      function showPostCode() {
        daum.postcode.load(function() {
          new daum.Postcode({
            oncomplete : function(data) {
              $('input[name=postalCode]').val(data.zonecode);
              $('input[name=add_city]').val(data.sido);
              $('input[name=add_state]').val(data.sigungu);
              $('input[name=add_dong]').val(data.roadAddress);
              $('input[name=add_details]').attr('readonly', false);
              $('input[name=add_details]').focus();
            }
          }).open();
        });
      }
	
      function drop() {
    	  const res = prompt('회원 탈퇴를 하시겠습니까? \'회원탈퇴\' 라고 입력해주세요.')
    	  if(res==='회원탈퇴')
    		  
    		  
    		  
    		  
    		  
    		  
    		  location.href='drop'
    	  else
    		  alert('입력하신 글자를 다시 확인하세요.')
      }
     
 </script>
<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.dropotron.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/swipper.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			<script src="../assets/js/map.daum.js"></script>
			<script src="../assets/js/script.js"></script>
</body>
</html>