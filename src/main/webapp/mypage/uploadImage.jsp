<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String uploadPath = "uploads"; // 업로드 디렉토리
    String savePath = application.getRealPath("/") + uploadPath; // 실제 서버 경로
    String fileName = ""; // 업로드된 파일명

    // 파일 업로드 처리
    if (request.getContentType() != null && request.getContentType().toLowerCase().startsWith("multipart/")) {
        try {
            // 파일 업로드 폴더가 없으면 생성
            File folder = new File(savePath);
            if (!folder.exists()) {
                folder.mkdirs();
            }

            // 파일 업로드 처리
            Part part = request.getPart("profileImage"); // 파일 파트 가져오기
            fileName = UUID.randomUUID().toString() + "_" + part.getSubmittedFileName(); // 파일명 생성
            String filePath = savePath + File.separator + fileName; // 파일 경로 생성
            part.write(filePath); // 파일 저장

            // DB에 파일 경로 저장 (여기서는 간단한 예시로 user 테이블에 저장)
            String username = "name"; // 사용자명
            String jdbcURL = "jdbc:mysql://localhost:3306/your_database"; // 데이터베이스 URL
            String dbUser = "사용자명"; // 데이터베이스 사용자명
            String dbPassword = "비밀번호"; // 데이터베이스 비밀번호

            Class.forName("com.mysql.jdbc.Driver"); // MySQL 드라이버 로드
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword); // 데이터베이스 연결
            String query = "UPDATE users SET profile_image_path = ? WHERE username = ?"; // SQL 쿼리
            PreparedStatement preparedStatement = connection.prepareStatement(query); // 준비된 쿼리
            preparedStatement.setString(1, uploadPath + "/" + fileName); // 이미지 파일 경로 설정
            preparedStatement.setString(2, username); // 사용자명 설정
            preparedStatement.executeUpdate(); // 쿼리 실행
            preparedStatement.close(); // PreparedStatement 닫기
            connection.close(); // 연결 닫기

            // 업로드 성공 메시지 출력
            out.println("프로필 사진 업로드 성공: " + uploadPath + "/" + fileName);
        } catch (Exception e) {
            e.printStackTrace();
            out.println("프로필 사진 업로드 실패: " + e.getMessage());
        }
    }
%>
</body>
</html>