package dao.sell;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.BuyListDto;
import mybatis.SqlSessionBean;

public class BuyListDao {
	private static final Logger logger = LoggerFactory.getLogger(BuyListDao.class);
	private static BuyListDao dao = new BuyListDao();
	private BuyListDao() {}
	public static BuyListDao getInstance() {
		return dao;
	}
	
	
	public int saleOne(BuyListDto item) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result=0;	
		try{
			result = sqlSession.insert("BuyList.saleOne",item);
			sqlSession.update("BuyList.changeStatus",item.getPdt_code());
			sqlSession.commit();
		}catch(Exception e) {
			logger.warn("구매 오류 : {}",e.getMessage());
			sqlSession.rollback();
		}finally {
			sqlSession.close();
		}	
		return result;
	}
	
	
	
	
	/*
	 * public int changeStatus(String bcode) { SqlSession sqlSession =
	 * SqlSessionBean.getSession(); return null; }
	 */
}
