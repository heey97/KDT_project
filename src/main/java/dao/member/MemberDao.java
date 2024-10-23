package dao.member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.MemberDto;
import mybatis.SqlSessionBean;


public class MemberDao {
	private static MemberDao dao = new MemberDao();
	private MemberDao() {}
	public static MemberDao getInstance() {
		return dao;
	}

	public void join(MemberDto member) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		sqlSession.insert("MemberDto.join",member);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public void modify(MemberDto member) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		sqlSession.update("MemberDto.modify",member);
		sqlSession.commit();
		sqlSession.close();
	}
	
	
	public MemberDto login(Map<String, String> map) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		MemberDto dto = sqlSession.selectOne("MemberDto.login",map);
		sqlSession.close();
		return dto;
	}
	
	public boolean isExistId(String id) {
	      SqlSession sqlSession = SqlSessionBean.getSession();
	      MemberDto dto = sqlSession.selectOne("MemberDto.getById",id);
	      boolean result=false;
	      if (dto!=null) result=true;
	      return result;
	   }
	
	public MemberDto getById(String id) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		MemberDto vo = sqlSession.selectOne("MemberDto.getById",id);
		return vo;
	}
	
	public void drop(String id) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		sqlSession.update("MemberDto.drop",id);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public MemberDto findMember(MemberDto member) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		MemberDto dto = sqlSession.selectOne("MemberDto.findMember",member);
		sqlSession.close();
		return dto;
		
	}
	
	public int findPw(MemberDto member) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = sqlSession.update("MemberDto.findPw",member);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	
	
}
