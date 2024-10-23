package controller.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import dao.community.CommunityDao;
import dto.CommunityDto;
import dto.MemberDto;

// 요청 매핑 :	mapping.put(new RequestKeyValue("/community/update","GET"), new UpdateViewController() );
public class UpdateViewController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(UpdateViewController.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//수정 화면으로 데이터 보내기 구현해 보세요.
		//지정된 idx 메인글 가져오기
				String temp = request.getParameter("community_idx");			//메인글 글번호 파라미터로 받기
				long community_idx=0;
				HttpSession session = request.getSession();
				MemberDto user = (MemberDto) session.getAttribute("user");
				try {
					community_idx = Long.parseLong(temp);
					CommunityDao dao = CommunityDao.getInstance();
					CommunityDto dto = dao.selectByIdx(community_idx);
					
				if(dto==null || !dto.getWriter_id().equals(user.getId())) throw new RuntimeException();
					request.setAttribute("dto", dto);				
					
					//현재페이지를 read.jsp에서 받아 update.jsp로 전달합니다.
					logger.info(":::::::UpdateViewController page - {} ::::::::::",request.getParameter("page"));
					request.setAttribute("page",request.getParameter("page") ); 	//현재페이지 번호 전달 - 순서4)
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
					dispatcher.forward(request, response);
				}catch (NumberFormatException e) {
					response.sendRedirect("list");
				}
				
				

	}

}
