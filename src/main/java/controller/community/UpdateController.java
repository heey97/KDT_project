package controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import dao.community.CommunityDao;
import dto.CommunityDto;

// 요청 매핑 :	mapping.put(new RequestKeyValue("/community/update","POST"), new UpdateController() );  
public class UpdateController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//수정 내용 저장  구현해 보세요.
		request.setCharacterEncoding("UTF-8");
		long community_idx = Long.parseLong(request.getParameter("community_idx"));
		String title=request.getParameter("title");
		String contents=request.getParameter("contents");;
		CommunityDto dto = CommunityDto.builder()
				.community_idx(community_idx)
				.title(title)
				.contents(contents)
				.build();
		
		CommunityDao dao = CommunityDao.getInstance();
		int result = dao.update(dto);
		if(result==1) {
			response.sendRedirect("read?idx="+community_idx+"&page="+request.getParameter("page"));   
			//현재페이지 번호 전달 - 순서6)
		}else {
			//메인화면으로 이동
			response.sendRedirect(request.getContextPath());
		}
	}

}
