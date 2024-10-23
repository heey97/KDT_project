package dao.community;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.CommentsDto;
import dto.CommunityDto;
import dto.Paging;
import mybatis.SqlSessionBean;

public class CommunityDao {
	private static CommunityDao dao = new CommunityDao();
	private CommunityDao() {}
	public static CommunityDao getInstance() {
		return dao;
	}

	public long insert(CommunityDto dto) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		mapperSession.insert("community.insert",dto);
		mapperSession.commit();
		mapperSession.close();
		return dto.getCommunity_idx();			//매퍼xml에서 selectKey 로 시퀀스 값을 vo객체에 저장시킵니다.
	}
	
	public int update(CommunityDto dto) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.update("community.update",dto);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	public int delete(long community_idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.delete("community.delete",community_idx);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}

	public CommunityDto selectByIdx(long community_idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		CommunityDto dto = mapperSession.selectOne("community.selectByIdx",community_idx);
		mapperSession.close();
		return dto;
	}
	
	//주요한 기능
	//전체 글 갯수
	public int count(Map<String, String> map) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.selectOne("community.count",map);
		mapperSession.close();
		return result;
	}
	
	//읽은 메인글 조회수 증가
	public int setReadCount(long community_idx) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("community.setReadCount", community_idx);
		session.commit();
		session.close();
		return result;
	}
	
	//mref 메인글의 댓글 갯수
	public int commentsCount(long mref) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.selectOne("community.commentsCount", mref);
		session.close();
		return result;
	}
	
	//idx 최대값 구하기
	public int maxOf() {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.selectOne("community.maxOf");
		session.close();
		return result;
	}
	
	//mref 메인글의 댓글목록 가져오기
	public List<CommentsDto> comments(long mref){
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<CommentsDto> commentList = mapperSession.selectList("community.comments",mref);
		mapperSession.close();
		return commentList;
	}
	

	public List<CommunityDto> list(Paging paging) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<CommunityDto> list = mapperSession.selectList("community.list",paging);
		mapperSession.close();
		return list;
	}
	
	//메인글 목록 가져오기 - 할일 : 한번에(즉 한페이지에) 글 10개씩 가져오도록 변경  
	public List<CommunityDto> pagelist(Map<String,Integer> map) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<CommunityDto> list = mapperSession.selectList("community.pagelist",map);
		mapperSession.close();
		return list;
	}
	
}
