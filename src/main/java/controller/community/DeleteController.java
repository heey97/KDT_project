package controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import dao.community.CommunityDao;
import dto.CommunityDto;
import dto.MemberDto;


//요청 매핑 : mapping.put(new RequestKeyValue("/community/delete","GET"), new DeleteController() );
public class DeleteController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 글 삭제 구현해 보세요.
		CommunityDao dao = CommunityDao.getInstance();
		long community_idx = Long.parseLong(request.getParameter("community_idx"));   
		//NumberFormatException 은 web.xml 설정으로 처리(UpdateViewController와 비교하는 코드)
		
		HttpSession session = request.getSession();
		MemberDto user = (MemberDto) session.getAttribute("user");
		CommunityDto dto = dao.selectByIdx(community_idx);
		if(dto==null || !dto.getWriter_id().equals(user.getId())) throw new RuntimeException();
		
		int result = dao.delete(community_idx);
		if(result == 1) {
			//삭제한 글이 있던 페이지로 돌아가기(요청 리다이렉트)
			response.sendRedirect("list?page="+request.getParameter("page"));   //현재페이지 번호 전달 - 순서7)
		}else {
			response.sendRedirect(request.getContextPath());
		}

	}

}
