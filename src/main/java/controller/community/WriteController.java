package controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import dao.community.CommunityDao;
import dto.CommunityDto;
//글쓰기 저장 POST
public class WriteController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title=request.getParameter("title");
		String writer_id=request.getParameter("writer_id");
		String contents=request.getParameter("contents");
		
		CommunityDto dto = CommunityDto.builder()
				.title(title)
				.writer_id(writer_id)
				.contents(contents)
				.build();
		
		CommunityDao dao = CommunityDao.getInstance();
		long result = dao.insert(dto);
		if(result!=0) {
			response.sendRedirect("list");
		}else {
			//메인화면으로 이동
			response.sendRedirect(request.getContextPath());
		}
			
	}

}
