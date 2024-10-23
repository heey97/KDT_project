package controller.sell;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import dao.sell.SalePageDao;
import dto.SellListDto;

public class PayRequestSuccessController implements Controller {

	private static final Logger logger = LoggerFactory.getLogger(PayRequestSuccessController.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
		String orderId = request.getParameter("orderId");
		logger.info("orderId : {}", orderId);
		int underbar = orderId.indexOf("_");
		logger.info("underbar : {}", underbar);
		int amount = Integer.parseInt(request.getParameter("amount"));
		logger.info("가격 : {}", amount);
		logger.info("orderId.substring(0, underbar) : {}", orderId.substring(0, underbar));
		SalePageDao dao = SalePageDao.getInstance();
		SellListDto item = dao.getOne(orderId.substring(0, underbar));
		logger.info("item 가격 : {}", item.getPrice());
		logger.info("item 제목 : {}", item.getTitle());
		logger.info("item 판매자 : {}", item.getSell_id());
		if (item.getPrice() != amount)
			throw new IOException("금액에 문제가 있습니다.");

		// API 엔드포인트 및 요청 데이터
		String apiUrl = "https://api.tosspayments.com/v1/payments/confirm";
		String paymentKey = request.getParameter("paymentKey");
		// amount , orderId도 필요함.

		// Authorization 헤더 생성
		String secretKey = "test_sk_E92LAa5PVb9DWDBwjojZ37YmpXyJ";
		String authorizationHeader = createAuthorizationHeader(secretKey);

		// JSON 데이터 생성
		String jsonData = String.format("{\"paymentKey\":\"%s\",\"amount\":%d,\"orderId\":\"%s\"}", paymentKey, amount,
				orderId);

		// HTTP POST 요청 보내기
		URL url = new URL(apiUrl);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();

		// 요청 메소드 설정
		connection.setRequestMethod("POST");

		// 헤더 설정
		connection.setRequestProperty("Authorization", authorizationHeader);
		connection.setRequestProperty("Content-Type", "application/json");

		// POST 데이터를 전송 가능하도록 설정
		connection.setDoOutput(true);

		// POST 데이터 전송
		try (DataOutputStream outputStream = new DataOutputStream(connection.getOutputStream())) {
			outputStream.writeBytes(jsonData);
			outputStream.flush();
		}

		// 응답 코드 확인
		int responseCode = connection.getResponseCode();
		if (responseCode != 200 && responseCode != 201)
			throw new IOException("결제 오류가 발생했습니다.");

		logger.info("Response Code: {}", responseCode);
		String payment = null;
		// 응답 데이터 읽기
		try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
			String line;
			StringBuilder responseStr = new StringBuilder();
			while ((line = reader.readLine()) != null) {
				responseStr.append(line);
			}
			payment = responseStr.toString();
			logger.info("Response: {}", payment);
		}

		// 연결 종료
		connection.disconnect();
		request.setAttribute("payment", payment);
		request.setAttribute("item", item);
		RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
		dispatcher.forward(request, response);

	}

	private static String createAuthorizationHeader(String secretKey) {
		String credentials = secretKey + ":";
		String encodedCredentials = Base64.getEncoder().encodeToString(credentials.getBytes(StandardCharsets.UTF_8));
		return "Basic " + encodedCredentials;
	}
}
