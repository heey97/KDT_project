package controller.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import dao.notice.NoticeDao;
import dto.MemberDto;
import dto.NoticeDto;

public class NoticeUpdateController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(NoticeUpdateController.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//수정 화면으로 데이터 보내기 구현해 보세요.
		//지정된 notice_idx 메인글 가져오기
				String temp = request.getParameter("notice_idx");			//메인글 글번호 파라미터로 받기
				int notice_idx=0;
				HttpSession session = request.getSession();
				MemberDto user = (MemberDto) session.getAttribute("user");
				logger.info("userid : {}", user.getId());
				if(user == null || !user.getId().equals("gmlduddl3"))
					throw new RuntimeException();
				try {
					notice_idx = Integer.parseInt(temp);
					NoticeDao dao = NoticeDao.getInstance();
					NoticeDto dto = dao.read(notice_idx);
					// 필터 적용하기 전에 admin 검사하는 부분입니다. 필터 적용 전후를 확인하기 위해 주석처리 하세요.
					// 모튼 admin 페이지에 이 코드를 추가하는것 대신에 필터를 사용하는것 입니다. 
					// if(vo==null || !user.getUserid().equals("admin")) throw new RuntimeException();
					request.setAttribute("dto", dto);				
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
					dispatcher.forward(request, response);
				}catch (NumberFormatException e) {
					response.sendRedirect("list");
				}
						

	}

}
