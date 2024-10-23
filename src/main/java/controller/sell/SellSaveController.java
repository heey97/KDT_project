package controller.sell;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.Controller;
import dao.sell.SalePageDao;
import dto.SellListDto;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SellSaveController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자가 업로드한 파일이 저장될 서버 경로(파일시스템 경로)
		String path = "D:/Class231228/upload";
		// 서버의 로컬 경로에 대해 url 을 지정합니다 -> 톰캣 server.xml
		// <Context docBase="D:/Class231228/upload" path="/upload"/> 추가하기
		
		//업로드 가능한 최대 크기(바이트)
		int maxSize = 10*1024*1024;		//1024바이트=1KB, 10MByte로 설정
		
		//request 는 파일을 받을 수 있는 MultipartRequest 로 사용해야 합니다. : cos 라이브러리 추가
		MultipartRequest multiRequest = new MultipartRequest(request, 
				path,
				maxSize,
				"UTF-8",
				new DefaultFileRenamePolicy());		
		//DefaultFileRenamePolicy는 중복된 파일명에 대해 새로 파일명 부여하는 규칙(파일명뒤에 일련번호)
		
		
		//기존 방식처럼 text 타입 등 파라미터 받아오기 - 문자열 파라미터도 MultipartRequest 를 사용합니다.
		String sellId = multiRequest.getParameter("saleuser");
		String category = multiRequest.getParameter("category");
		String title = multiRequest.getParameter("title");
		int price = Integer.parseInt(multiRequest.getParameter("price"));
		String sell_location = multiRequest.getParameter("sell_location");
		String contents = multiRequest.getParameter("contents");
		int sellIdx = 0;
		String pdt_code = sellId + "_" + category + "_" + Integer.toString(sellIdx);
		log.info("Initial pdt_code: {}", pdt_code);

		SalePageDao dao = SalePageDao.getInstance();

		try {
		    while (dao.getPdtCode().contains(pdt_code)) {
		    	sellIdx++;
		        pdt_code = sellId + "_" + category + "_" + Integer.toString(sellIdx);
		    }
		} catch (Exception e) {
		    log.error("Error while checking for duplicate pdt_code: {}", e.getMessage());
		    // 여기서 예외 처리를 적절히 해줘야 합니다.
		}

		log.info("Final pdt_code: {}", pdt_code);
		
		String attachfile = multiRequest.getOriginalFileName("img");
		//서버로 업로드된 파일의 파일명
		String uploadfile = multiRequest.getFilesystemName("img");
		log.info("::: 파일명-{} from {}  :::",uploadfile,attachfile);   //uploadFile
		//서버의 파일 시스템 C:\\upload 경로에서 파일이 생겼는지 확인하기
		
//		SellListDto dto = new SellListDto(null, sellId, category, price, null,null, title, contents,location,null,null, filename,attachfile,null);
		
		
		SellListDto dto = SellListDto.builder()
				.pdt_code(pdt_code)
				.sell_id(sellId)
				.category(category)
				.title(title)
				.price(price)
				.sell_location(sell_location)
				.contents(contents)
				.att_file(attachfile)
				.up_file(uploadfile)
				.build();
		
		log.info("::: dto-{}  :::",dto);   
		String url="list";
		int result=0;
		log.info("::: result-{}  :::",result);   

		try {
			result = dao.write(dto);
			if(result!=1) {
				//todo : 이전 예제 참고해서 등록 실패하면 쿠키 이용해서 메시지를 전달해 주세요.
				url="../index.jsp";
			}
		}catch (Exception e) {
		}
		log.info("::: result-{}  :::",result);  
		log.info("::: url-{}  :::",url);  
		response.sendRedirect(url);
	}

}




