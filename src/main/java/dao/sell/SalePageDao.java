package dao.sell;

import java.util.List;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.Paging;
import dto.SellListDto;
import dto.BuyListDto;
import dto.CategoryDto;
import dto.CommunityDto;
import mybatis.SqlSessionBean;

public class SalePageDao {
	private static final Logger logger = LoggerFactory.getLogger(SalePageDao.class);
	private static SalePageDao dao = new SalePageDao();

	public static SalePageDao getInstance() {
		return dao;
	}

	public List<SellListDto> list(Paging paging) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<SellListDto> list = mapperSession.selectList("SalePage.getList", paging);
		mapperSession.close();
		return list;
	}

	public int count(Map<String, String> map) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		logger.info("map :{}", map);
		int result = mapperSession.selectOne("SalePage.count", map);
		mapperSession.close();
		return result;
	}

//	public List<String> getCategories(){
//		SqlSession sqlSession = SqlSessionBean.getSession();
//		List<String> list= sqlSession.selectList("SalePage.getCategories");
//		sqlSession.close();
//		return list;
//	}
	public List<String> getCategoriesCode() {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<String> list = sqlSession.selectList("SalePage.getCategoriesCode");
		sqlSession.close();
		return list;
	}

	public List<String> getCategoriesVal() {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<String> list = sqlSession.selectList("SalePage.getCategoriesVal");
		sqlSession.close();
		return list;
	}

	public List<String> getLocation() {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<String> list = sqlSession.selectList("SalePage.getLocation");
		sqlSession.close();
		return list;
	}

	public SellListDto getOne(String pdt_code) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		SellListDto dto = sqlSession.selectOne("SalePage.getOne", pdt_code);
		sqlSession.close();
		return dto;
	}

	public int saleOne(BuyListDto buy) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = 0;
		try {
			result = sqlSession.insert("SalePage.sellOne", buy);
			sqlSession.update("SalePage.changeStatus", buy.getPdt_code());
			sqlSession.commit();
		} catch (Exception e) {
			logger.warn("상품 구매 오류 : {}", e.getMessage());
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}
		return result;
	}

	public int write(SellListDto dto) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.insert("SalePage.write", dto);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	public List<CommunityDto> getPdtCode() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<CommunityDto> list = mapperSession.selectList("SalePage.getPdtcode");
		mapperSession.close();
		return list;
	}

}