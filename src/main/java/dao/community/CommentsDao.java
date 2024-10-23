package dao.community;

import org.apache.ibatis.session.SqlSession;

import dto.CommentsDto;
import mybatis.SqlSessionBean;

public class CommentsDao {
	private static CommentsDao dao = new CommentsDao();
	private CommentsDao() {}
	public static CommentsDao getInstance() {
		return dao;
	}

	public int insert(CommentsDto dto) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int comment_idx = mapperSession.insert("Comments.insert",dto);
		mapperSession.commit();
		mapperSession.close();
		return comment_idx;
	}
	
	public int delete(int comment_idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.delete("Comments.delete",comment_idx);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	//idx 최대값 구하기
	public int maxOf() {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.selectOne("Comments.maxOf");
		session.close();
		return result;
	}

	//메인글의 댓글 갯수 업데이트	
	public int setCommentCount(long comment_idx) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("community.setCommentCount", comment_idx);
		session.commit();
		session.close();
		return result;
	}
	
}
