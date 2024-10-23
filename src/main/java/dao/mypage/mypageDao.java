package dao.mypage;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.BuyListDto;
import dto.CommentsDto;
import dto.CommunityDto;
import dto.NoticeDto;
import dto.Paging;
import dto.SellListDto;
import mybatis.SqlSessionBean;

public class mypageDao {
	private static mypageDao dao = new mypageDao();
	private mypageDao() {}
	public static mypageDao getInstance() {
		return dao;
	}
	
	public void modify(Member member) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		sqlSession.update("member.modify",member);
		sqlSession.commit();
		sqlSession.close();
	   }
	    //mref 메인글의 댓글목록 가져오기
		public List<CommentsDto> comments(long mref){
			SqlSession mapperSession = SqlSessionBean.getSession();
			List<CommentsDto> commentList = mapperSession.selectList("mypage.comments",mref);
			mapperSession.close();
			return commentList;
		}
		
		public List<CommunityDto> list() {
			SqlSession mapperSession = SqlSessionBean.getSession();
			List<CommunityDto> list = mapperSession.selectList("mypage.list");
			mapperSession.close();
			return list;
		}
		
		
		//메인글 목록 가져오기 - 할일 : 한번에(즉 한페이지에) 글 10개씩 가져오도록 변경  
		public List<CommunityDto> pagelist(Map<String,Integer> map) {
			SqlSession mapperSession = SqlSessionBean.getSession();
			List<CommunityDto> list = mapperSession.selectList("mypage.pagelist",map);
			mapperSession.close();
			return list;
		}
		
		public List<BuyListDto> Buylist(String id) {
			SqlSession mapperSession = SqlSessionBean.getSession();
			List<BuyListDto> list = mapperSession.selectList("mypage.buylist",id);
			mapperSession.close();
			return list;
		}
		
		public List<SellListDto> Selllist(String id) {
			SqlSession Session = SqlSessionBean.getSession();
			List<SellListDto> list = Session.selectList("mypage.listall",id);
			Session.close();
			return list;
		}
		
		public List<CommunityDto> communitylist(String id) {
			SqlSession Session = SqlSessionBean.getSession();
			List<CommunityDto> list = Session.selectList("mypage.communitylist",id);
			Session.close();
			return list;
		}
		public int drop(String id) {
		      SqlSession sqlSession = SqlSessionBean.getSession();
		      int result = sqlSession.update("mypage.drop",id);
		      sqlSession.commit();
		      sqlSession.close();
		      return result;
		   }
}

