package controller;

import java.util.HashMap;
import java.util.Map;

import controller.api.ApiCheckIdController;
import controller.api.ApiMemberJoinController;
import controller.api.ApiMemberModifyController;
import controller.api.ApiPaymentSaveController;
import controller.community.CommentsController;
import controller.community.DeleteController;
import controller.community.ListController;
import controller.community.ReadController;
import controller.community.UpdateController;
import controller.community.UpdateViewController;
import controller.community.WriteController;
import controller.community.WriteViewController;
import controller.member.AuthCertSMSController;
import controller.member.FindController;
import controller.member.LoginActionController;
import controller.member.LoginViewController;
import controller.member.LogoutController;
import controller.member.MemberJoinController;
import controller.member.MemberSaveController;
import controller.mypage.MemberDropController;
import controller.mypage.MemberModifyController;
import controller.mypage.MypageListController;
import controller.notice.NoticeDeleteController;
import controller.notice.NoticeFileDownloadController;
import controller.notice.NoticeListController;
import controller.notice.NoticeReadController;
import controller.notice.NoticeUpdateController;
import controller.notice.NoticeUpdateSaveController;
import controller.notice.NoticeWriteController;
import controller.notice.NoticeWriteSaveController;
import controller.sell.PayRequestSuccessController;
import controller.sell.SellDetailCommentsController;
import controller.sell.SellDetailController;
import controller.sell.SellListController;
import controller.sell.SellSaveController;
import controller.sell.SellWriteController;

public class RequestControllerMapping {
	private static final Map<RequestKeyValue,Controller> mapping = new HashMap<>();
	
	public static void init() {
		
		
		//로그인 기능
		mapping.put(new RequestKeyValue("/login/login", "GET"), new LoginViewController());
		mapping.put(new RequestKeyValue("/login/login", "POST"), new LoginActionController());
		mapping.put(new RequestKeyValue("/login/logout", "GET"), new LogoutController());
		
		//아이디 및 비밀번호 찾기
		mapping.put(new RequestKeyValue("/find","GET"),new FindController());
		//설계된 url,method 에 따라 처리할 controller 구현체를 Key,Value 로 HashMap에 저장합니다.
		mapping.put(new RequestKeyValue("/community/list", "GET"), new ListController() );
		mapping.put(new RequestKeyValue("/community/write","GET"), new WriteViewController() );
		mapping.put(new RequestKeyValue("/community/write","POST"), new WriteController() );

		//게시판 글 상세보기 ,수정하기,삭제하기
		mapping.put(new RequestKeyValue("/community/read", "GET"), new ReadController() );
		mapping.put(new RequestKeyValue("/community/update","GET"), new UpdateViewController() );
		mapping.put(new RequestKeyValue("/community/update","POST"), new UpdateController() );
		mapping.put(new RequestKeyValue("/community/delete","GET"), new DeleteController() );		//오류 처리 위해 POST로 변경
		mapping.put(new RequestKeyValue("/community/comment","POST"), new CommentsController());
		//회원가입
		mapping.put(new RequestKeyValue("/join/join","GET"), new MemberJoinController());
		mapping.put(new RequestKeyValue("/join/join","POST"), new MemberSaveController());
		mapping.put(new RequestKeyValue("/auth/sms","GET"), new AuthCertSMSController());

		
		//회원정보수정
		mapping.put(new RequestKeyValue("/mypage/mypage","GET"),new MemberModifyController());
		mapping.put(new RequestKeyValue("/mypage/mypage","POST"),new MemberModifyController());
		mapping.put(new RequestKeyValue("/mypage/mypage","GET"),new MypageListController());
		mapping.put(new RequestKeyValue("/mypage/drop","GET"),new MemberDropController());
		mapping.put(new RequestKeyValue("/api/modify","POST"),new ApiMemberModifyController());
		//mapping.put(new RequestKeyValue("/myPage/pwchange","GET"),new mypagePWController());
		

		//중고거래
		mapping.put(new RequestKeyValue("/sell/list", "GET"), new SellListController() );				
		mapping.put(new RequestKeyValue("/sell/read", "GET"), new SellDetailController() );				
		mapping.put(new RequestKeyValue("/sell/comment","POST"), new SellDetailCommentsController()); 	
		mapping.put(new RequestKeyValue("/pay/success","GET"), new PayRequestSuccessController());
		//추가
		mapping.put(new RequestKeyValue("/sell/write","GET"), new SellWriteController());
		mapping.put(new RequestKeyValue("/sell/save","POST"), new SellSaveController());
		
		//공지사항(검색기능)
		mapping.put(new RequestKeyValue("/notice/list", "GET"), new NoticeListController());
		mapping.put(new RequestKeyValue("/notice/read", "GET"), new NoticeReadController());
		mapping.put(new RequestKeyValue("/notice/write", "GET"), new NoticeWriteController());
		mapping.put(new RequestKeyValue("/notice/save", "POST"),new NoticeWriteSaveController());
		mapping.put(new RequestKeyValue("/notice/update", "GET"), new NoticeUpdateController());
		mapping.put(new RequestKeyValue("/notice/update", "POST"), new NoticeUpdateSaveController());
		mapping.put(new RequestKeyValue("/notice/delete", "GET"), new NoticeDeleteController());
		mapping.put(new RequestKeyValue("/notice/download", "POST"), new NoticeFileDownloadController());


		mapping.put(new RequestKeyValue("/api/pay", "POST"), new ApiPaymentSaveController() );
		mapping.put(new RequestKeyValue("/api/auth/checkId", "POST"), new ApiCheckIdController());
		mapping.put(new RequestKeyValue("/api/auth/join", "POST"), new ApiMemberJoinController());
		

	}
	//url,method 필드를 저장하는 key 를 전달받아 HashMap에서 value(컨트롤러)를 리턴
	public static Controller getController(RequestKeyValue key) {
		return mapping.get(key);
	}
}
