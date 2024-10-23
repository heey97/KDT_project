package controller.member;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import dto.MemberDto;
import lombok.extern.slf4j.Slf4j;
import util.mailService;
@Slf4j
public class FindController implements Controller {
	
	 private static final char[] rndAllCharacters = new char[]{
	            //number
	            '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
	  };

    @Override
      public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        request.setCharacterEncoding("UTF-8");
        MemberDto dto = new MemberDto();
        MemberService memberService = MemberService.getInstance();
        mailService mail = new mailService();

        // jsp 페이지에서 id 값을 입력했을 경우
        if(request.getParameter("id") != null && request.getParameter("id") != "") {

        	dto.setId(request.getParameter("id"));
        	dto.setEmail(request.getParameter("email"));

        } else {

        	dto.setName(request.getParameter("name"));
        	dto.setPhonenum(request.getParameter("phonenum"));
        	dto = memberService.findMember(dto);
        }

        log.info("dto --------------------------------------- {} ",dto);
         
         RequestDispatcher dispatcher = null;
         
         
         // 비밀번호 찾기의 경우 id 값을 파라미터에 갖고 있기 때문에 null이나 비어있지 않을 경우 비밀번호 찾기라고 볼 수 있다
         if(request.getParameter("id") != null && request.getParameter("id") != "") {
        	 dispatcher = request.getRequestDispatcher("/login/findPwResult.jsp");
        	 //
        	 
        	 String pw = getRandomPassword(8);
        	 mail.sendMail(pw, dto.getEmail());
        	 // 비밀번호 암호화
        	 try {
				pw = memberService.encrypt(pw);
			 } catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			 }
        	 dto.setPassword(pw);
        	 int findPwResult = memberService.findPw(dto);
        	 dispatcher = request.getRequestDispatcher("/login/findPwResult.jsp");
        	 request.setAttribute("findPwResult", findPwResult);
        	 
         } else {
        	 
        	 dispatcher = request.getRequestDispatcher("/login/findIdResult.jsp");
        	 request.setAttribute("member", dto.getId());
        	 
         }
         
         dispatcher.forward(request, response);
      }
	
	  public String getRandomPassword(int length) {

	       SecureRandom random = new SecureRandom();
	       StringBuilder stringBuilder = new StringBuilder();
	
	       int rndAllCharactersLength = rndAllCharacters.length;
	       for (int i = 0; i < length; i++) {
	           stringBuilder.append(rndAllCharacters[random.nextInt(rndAllCharactersLength)]);
	       }
	
	       return stringBuilder.toString();
	 }

   }