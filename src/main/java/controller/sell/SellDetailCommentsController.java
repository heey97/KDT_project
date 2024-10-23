package controller.sell;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import dao.sell.SellDetailCommentsDao;
import dto.CommentsDto;

public class SellDetailCommentsController implements Controller {
private static final Logger logger = LoggerFactory.getLogger(SellDetailCommentsController.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");		//항상 맨앞에. 주석처리는 필터 적용 확인목적
		SellDetailCommentsDao dao =SellDetailCommentsDao.getInstance();
		String f = request.getParameter("f");
		String url=null;		//redirect url 변수
		String pdt_code = request.getParameter("pdt_code");   //메인글의 idx 를 댓글테이블 mref 컬럼에 저장해야 함.(댓글추가)
		logger.info("::::::SaleDeteailCommentsController  f={} :::::::",f);
		
		String page = request.getParameter("page");         // 현재페이지 번호 전달 - 순서9)
		// 댓글 작성 추가
		if(f.equals("1")) {
			CommentsDto dto = CommentsDto.builder()
									.sell_pcode(pdt_code)
									.comment_id(request.getParameter("comment_id"))
									.contents(request.getParameter("contents"))
									.build();
			if(dao.insert(dto)==1) url="read?pdt_code="+pdt_code + "&page="+page;   // 현재페이지 번호 전달 - 순서9)
			else url="sellPage";
			
		}else if(f.equals("2")) {	
		//댓글 삭제 - 해보세요.
			int comment_idx = Integer.parseInt(request.getParameter("comment_idx"));	//삭제한 댓글idx
			if(dao.delete(comment_idx)==1) url="read?pdt_code="+pdt_code + "&page="+page;   // 현재페이지 번호 전달 - 순서9)
			else url="list";
		}
		//댓글 갯수 변경 dao 메소드는 편의상 CommunityCommentsDao 로 옮기기
		//댓글 갯수 변경  
		dao.setCommentCount(pdt_code);
		response.sendRedirect(url);
	}

}
