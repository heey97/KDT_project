package controller.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import controller.Controller;
import dao.mypage.mypageDao;
import dto.MemberDto;
import lombok.extern.slf4j.Slf4j;
@Slf4j
public class MypageListController implements Controller{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDto dto = (MemberDto) session.getAttribute("user");
		mypageDao dao = mypageDao.getInstance();
		String id = dto.getId();
		
		
		log.info("get id ----------------------------------------- {}",id);
		//판매내역
		request.setAttribute("sellList", dao.Selllist(id));
		request.setAttribute("buyList",dao.Buylist(id));
		request.setAttribute("contentList", dao.communitylist(id));
		log.info("get lust ----------------------------------------- {}",request.getAttribute("sellList"));
		log.info("get lust ----------------------------------------- {}",request.getAttribute("buyList"));
		RequestDispatcher dispatcher = request.getRequestDispatcher("mypage.jsp");
		dispatcher.forward(request, response);
	}
	
	
}
