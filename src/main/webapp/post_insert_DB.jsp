<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.InputStream" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.io.PrintWriter"%>

<%
    // 로그인된 사용자의 아이디 가져오기
    String user_id = (String) session.getAttribute("userID");
    
    // 데이터베이스 연결 정보
    String DB_URL = "jdbc:mysql://localhost:3306/user";
    String DB_USER = "root";
    String DB_PASSWORD = "0000";

    // 입력값 가져오기
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    // 이미지 파일 처리
    Part imagePart = request.getPart("file");
    InputStream imageStream = imagePart.getInputStream();
    byte[] imageBytes = new byte[imageStream.available()];
    imageStream.read(imageBytes);
    // 데이터베이스에 저장
   try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
    // 사용자 입력을 직접 SQL 쿼리에 포함하여 작성
    String sql = "INSERT INTO post_info (user_id, title, image_data, content, mat_Onion, mat_Potato, mat_Greenonion, mat_Garlic, mat_Egg, mat_Chicken, mat_Beef, mat_Pork, mat_Kimchi, mat_Mushroom) VALUES ('" 
    + user_id + "', '" 
    + title.replace("'", "''") + "', '" 
    + new String(imageBytes) + "', '" 
    + content.replace("'", "''") + "', " 
    + Integer.parseInt(request.getParameter("conion")) + ", " 
    + Integer.parseInt(request.getParameter("cpotato")) + ", " 
    + Integer.parseInt(request.getParameter("cgreen_onion")) + ", " 
    + Integer.parseInt(request.getParameter("cgarlic")) + ", " 
    + Integer.parseInt(request.getParameter("cegg")) + ", " 
    + Integer.parseInt(request.getParameter("cchicken")) + ", " 
    + Integer.parseInt(request.getParameter("cbeef")) + ", " 
    + Integer.parseInt(request.getParameter("cfork")) + ", " 
    + Integer.parseInt(request.getParameter("ckimchi")) + ", " 
    + Integer.parseInt(request.getParameter("cmushroom")) + ")";

    try (Statement stmt = conn.createStatement()) {
        stmt.executeUpdate(sql);
        response.sendRedirect("Main.jsp");
    }
} catch (SQLException e) {
    e.printStackTrace();
    // 예외 처리 코드 작성
}

%>