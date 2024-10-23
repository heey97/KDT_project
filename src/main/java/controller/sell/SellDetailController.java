package controller.sell;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import dao.sell.SellDetailCommentsDao;
import dto.CommentsDto;
import dto.SellListDto;



public class SellDetailController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(SellDetailController.class);


	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//pdt_code로 글 읽기
		String temp = request.getParameter("pdt_code");	
		String pdt_code = null;
		try {
			pdt_code = temp;

			SellDetailCommentsDao dao = SellDetailCommentsDao.getInstance();
			//조회수 증가 : 실행 위치는?
			dao.setReadCount(pdt_code);	
			
			SellListDto dto = dao.selectByPdt_code(pdt_code);
			if(dto==null) throw new RuntimeException();   //잘못된 파라미터로 vo가 null 일때 런타임예외 발생시키기
			logger.debug("::::::: dto-{}:::::::",dto);
			request.setAttribute("dto", dto);
		
				
			//idx 메인글의 댓글리스트를 애트리뷰트에 저장하기 해보세요.
			List<CommentsDto> cmtlist = dao.comments(pdt_code);
			request.setAttribute("cmtlist", cmtlist);
			
			//현재페이지를 list.jsp에서 받아서 read.jsp로 전달합니다.
			request.setAttribute("page", request.getParameter("page"));    //현재페이지 번호 전달 -순서2)
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("read.jsp");
			dispatcher.forward(request, response);
		}catch (NumberFormatException  e) {
			response.sendRedirect("list");			// NumberFormatException  처리
		}
	}

}

