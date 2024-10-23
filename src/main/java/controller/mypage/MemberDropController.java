package controller.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import dao.member.MemberDao;
import dto.MemberDto;



public class MemberDropController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = ((MemberDto)session.getAttribute("user")).getId();
		
		MemberDao dao = MemberDao.getInstance();
		dao.drop(id);
		session.invalidate();		
		RequestDispatcher dispatcher = request.getRequestDispatcher("drop.jsp");
		dispatcher.forward(request, response);
	}

}
