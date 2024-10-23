package dao.sell;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.CommentsDto;
import dto.SellListDto;
import mybatis.SqlSessionBean;

public class SellDetailCommentsDao {
	private static SellDetailCommentsDao dao = new SellDetailCommentsDao();

	private SellDetailCommentsDao() {
	}

	public static SellDetailCommentsDao getInstance() {
		return dao;
	}

	public int insert(CommentsDto dto) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int comment_idx = mapperSession.insert("SellComments.insert", dto);
		mapperSession.commit();
		mapperSession.close();
		return comment_idx;
	}

	public int delete(int comment_idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.delete("SellComments.delete", comment_idx);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}

	// idx 최대값 구하기
	public int maxOf() {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.selectOne("SellComments.maxOf");
		session.close();
		return result;
	}

	// 메인글의 댓글 갯수 업데이트
	public int setCommentCount(String pdt_code) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("SalePage.setCommentCount", pdt_code);
		session.commit();
		session.close();
		return result;
	}
	//mref 메인글의 댓글목록 가져오기
		public List<CommentsDto> comments(String pdt_code){
			SqlSession mapperSession = SqlSessionBean.getSession();
			List<CommentsDto> commentList = mapperSession.selectList("SalePage.comments",pdt_code);
			mapperSession.close();
			return commentList;
	}
		//mref 메인글의 댓글 갯수
		public int commentsCount(String pdt_code) {
			SqlSession session = SqlSessionBean.getSession();
			int result = session.selectOne("SalePage.commentsCount", pdt_code);
			session.close();
			return result;
	}
	//읽은 메인글 조회수 증가
	public int setReadCount(String pdt_code) {
			SqlSession session = SqlSessionBean.getSession();
			int result = session.update("SalePage.setReadCount", pdt_code);
			session.commit();
			session.close();
			return result;
	}
	public SellListDto selectByPdt_code(String pdt_code) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		SellListDto dto = mapperSession.selectOne("SalePage.selectByPdt_code",pdt_code);
		mapperSession.close();
		return dto;
	}
		

}