package controller.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;

import controller.Controller;
import dao.sell.SalePageDao;
import dto.BuyListDto;
import dto.SellListDto;

public class ApiPaymentSaveController implements Controller{
	private static final Logger logger = LoggerFactory.getLogger(ApiPaymentSaveController.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		InputStream inputStream = request.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(inputStream , StandardCharsets.UTF_8));
		StringBuffer sb = new StringBuffer();
		String line = null;
		
		SalePageDao dao = SalePageDao.getInstance();
		while((line = br.readLine()) != null) {
			sb.append(line);
		}
		logger.info("json : {}",sb.toString());
		
		ObjectMapper objMapper = new ObjectMapper();
		BuyListDto pay = objMapper.readValue(sb.toString(), BuyListDto.class);
		
		logger.info("member : {}",pay);
		SellListDto dto = dao.getOne(pay.getPdt_code());
		logger.info("sell id------------------------------------- : {}",dto.getSell_id());
		String sell_id = dto.getSell_id();
		pay.setSell_id(sell_id);
		logger.info("member : {}",pay);
		int cnt =dao.saleOne(pay);
		
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(cnt==1)
			out.print("결제가 완료되었습니다.");
		else
			out.print("결제 오류가 발생했습니다.");
	}

}
