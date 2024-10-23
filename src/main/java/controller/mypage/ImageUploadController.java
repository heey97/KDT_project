package controller.mypage;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class ImageUploadController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String uploadPath = "uploads"; // 업로드 디렉토리
        String savePath = getServletContext().getRealPath("D:\\\\Class231228-001\\\\image") + uploadPath; // 실제 서버 경로
        
        try {
            // 파일 업로드 폴더가 없으면 생성
            File folder = new File(savePath);
            if (!folder.exists()) {
                folder.mkdirs();
            }

            // 파일 업로드 처리
            Part part = request.getPart("profileImage"); // 파일 파트 가져오기
            String fileName = UUID.randomUUID().toString() + "_" + getSubmittedFileName(part); // 파일명 생성
            String filePath = savePath + File.separator + fileName; // 파일 경로 생성
            part.write(filePath); // 파일 저장

            // DB에 파일 경로 저장 (여기서는 간단한 예시로 user 테이블에 저장)
            String username = "사용자명"; // 사용자명
            String jdbcURL = "jdbc:mysql://localhost:3306/your_database"; // 데이터베이스 URL
            String dbUser = "사용자명"; // 데이터베이스 사용자명
            String dbPassword = "비밀번호"; // 데이터베이스 비밀번호

            Class.forName("com.mysql.jdbc.Driver"); // MySQL 드라이버 로드
            try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
                String query = "UPDATE users SET profile_image_path = ? WHERE username = ?"; // SQL 쿼리
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setString(1, uploadPath + "/" + fileName); // 이미지 파일 경로 설정
                    preparedStatement.setString(2, username); // 사용자명 설정
                    preparedStatement.executeUpdate(); // 쿼리 실행
                }
            }

            // 업로드 성공 메시지 출력
            response.getWriter().println("프로필 사진 업로드 성공: " + uploadPath + "/" + fileName);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("프로필 사진 업로드 실패: " + e.getMessage());
        }
    }
    
    private String getSubmittedFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
