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
    	String sql = "INSERT INTO post_info (user_id, title, image_data, content, mat_Onion, mat_Potato, mat_Greenonion, mat_Garlic, mat_Egg, mat_Chicken, mat_Beef, mat_Pork, mat_Kimchi, mat_Mushroom) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, user_id);
        pstmt.setString(2, title);
        pstmt.setBytes(3, imageBytes);
        pstmt.setString(4, content);
        pstmt.setInt(5, Integer.parseInt(request.getParameter("conion")));
        pstmt.setInt(6, Integer.parseInt(request.getParameter("cpotato")));
        pstmt.setInt(7, Integer.parseInt(request.getParameter("cgreen_onion")));
        pstmt.setInt(8, Integer.parseInt(request.getParameter("cgarlic")));
        pstmt.setInt(9, Integer.parseInt(request.getParameter("cegg")));
        pstmt.setInt(10, Integer.parseInt(request.getParameter("cchicken")));
        pstmt.setInt(11, Integer.parseInt(request.getParameter("cbeef")));
        pstmt.setInt(12, Integer.parseInt(request.getParameter("cfork")));
        pstmt.setInt(13, Integer.parseInt(request.getParameter("ckimchi")));
        pstmt.setInt(14, Integer.parseInt(request.getParameter("cmushroom")));
        // Add the earlier parameters here (1 to 4) if needed
        
        pstmt.executeUpdate();
        // 생성된 post_num 값 가져오기
        response.sendRedirect("Main.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        // 예외 처리 코드 작성
    }
%>