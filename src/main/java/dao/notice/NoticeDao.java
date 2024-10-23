package dao.notice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import dto.NoticeDto;
import dto.Paging;
import lombok.val;
import mybatis.SqlSessionBean;

public class NoticeDao {
	private static NoticeDao dao = new NoticeDao();
	private NoticeDao() {}
	public static NoticeDao getInstance() {
		return dao;
	}

	public List<NoticeDto> list(Paging paging) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<NoticeDto> list = mapperSession.selectList("notice.getList",paging);
		mapperSession.close();
		return list;
	}
	
	public int count(Map<String, String> map) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.selectOne("notice.count",map);
		mapperSession.close();
		return result;
	}
	
	public NoticeDto read(int notice_idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		NoticeDto dto = mapperSession.selectOne("notice.getOne",notice_idx);
		mapperSession.close();
		return dto;
	}
	
	public int write(NoticeDto notice) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.insert("notice.insert",notice);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	public int update(NoticeDto notice) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.update("notice.update",notice);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	public int delete(int notice_idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.update("notice.delete",notice_idx);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}

	public int setReadCount(long notice_idx) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("notice.setReadCount", notice_idx);
		session.commit();
		session.close();
		return result;
	}
	
}
