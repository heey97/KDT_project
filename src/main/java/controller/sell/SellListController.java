package controller.sell;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import dao.sell.SalePageDao;
import dto.CategoryDto;
import dto.Paging;



public class SellListController implements Controller{
	private static final Logger log = LoggerFactory.getLogger(SellListController.class);
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		log.info(":::::::: 요청 {} 처리 시작 : {} ::::::::",this.getClass(),request.getServletPath());
		int currentPage = 1;
		//Dao 생성
		SalePageDao dao = SalePageDao.getInstance();
		request.setAttribute("cate", dao.getCategoriesVal());
		request.setAttribute("loca", dao.getLocation());
		//게시물 목록 받기
		//dao.close();//DB연결 닫기
		
		String category=request.getParameter("category");
		String sell_location=request.getParameter("sell_location");
		if(category!=null && (category.equals("none") || category.length()==0))
			category=null;
		
		if(sell_location!=null && (sell_location.equals("none") || sell_location.length()==0))
			sell_location=null;
		
		Map<String, String> findMap = null;
		if(category!=null||sell_location!=null) {   //새로운 검색값으로 검색 버튼을 클릭했을 때
			findMap = new HashMap<String, String>();
			findMap.put("category", category);
			findMap.put("sell_location", sell_location);
		}
		log.info("findMap : {}",findMap);
		//page 정보 받아오기
		String page=request.getParameter("page");
		log.info("page 정보 받아옴 : {}",page);
		if(page != null) currentPage = Integer.parseInt(page);		
		int pageSize=15;		//pageSize 를 5 또는 20으로 변경해서 실행해 봅시다.
		int totalCount =0;
		totalCount = dao.count(findMap);
		//위의 값들을 이용해서 Paging 객체를 생성하면서 다른 필드값을 계산합니다.
		Paging paging = new Paging(currentPage, totalCount, pageSize);
		paging.setFind(findMap);
		ArrayList<String> pdtlist = new ArrayList<>();
		log.info(":::::::: ListController paging : {} ::::::::",paging);
		log.info(":::::::: ListController totalCount : {} ::::::::",totalCount);
		log.info("pdtcode :::::::::::::::::::::::::::::::: {}",pdtlist);
		//pagelist() 메소드를 실행하기 위한 Map을 생성합니다.
		Map<String,Integer> map = new HashMap<>();
		map.put("start",paging.getStartNo());
		map.put("end",paging.getEndNo());
		log.info("**:::::::: map : {} ::::::::",map);
		
		//메소드 실행하고 애트리뷰트 저장합니다.
		request.setAttribute("list", dao.list(paging));
		log.info("**:::::::: dao.list(paging) : {} ::::::::",dao.list(paging));
		
		//페이지 목록을 화면구현하기 위한 애트리뷰트를 저장합니다.
		javax.servlet.http.HttpSession session = request.getSession();
		session.setAttribute("paging", paging);
		
		Date today= new Date();
		//현재날짜 애트리뷰트에 저장. 어디에 사용될까요?
		request.setAttribute("today", today);
		RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
		dispatcher.forward(request, response);
		log.info("완료됨");
	}
}
