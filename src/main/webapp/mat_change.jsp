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
    String DB_PASSWORD = "root";

    PreparedStatement pstmt = null;

    // 데이터베이스에 저장
    try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
        String sql = "UPDATE user_mat_info SET mat_Onion=?, mat_Potato=?, mat_Greenonion=?, mat_Garlic=?, mat_Egg=?, mat_Chicken=?, mat_Beef=?, mat_Pork=?, mat_Kimchi=?, mat_Mushroom=? WHERE user_id=?";
        pstmt = conn.prepareStatement(sql);

        // Setting parameters from request
        pstmt.setInt(1, Integer.parseInt(request.getParameter("conion")));
        pstmt.setInt(2, Integer.parseInt(request.getParameter("cpotato")));
        pstmt.setInt(3, Integer.parseInt(request.getParameter("cgreen_onion")));
        pstmt.setInt(4, Integer.parseInt(request.getParameter("cgarlic")));
        pstmt.setInt(5, Integer.parseInt(request.getParameter("cegg")));
        pstmt.setInt(6, Integer.parseInt(request.getParameter("cchicken")));
        pstmt.setInt(7, Integer.parseInt(request.getParameter("cbeef")));
        pstmt.setInt(8, Integer.parseInt(request.getParameter("cfork")));
        pstmt.setInt(9, Integer.parseInt(request.getParameter("ckimchi")));
        pstmt.setInt(10, Integer.parseInt(request.getParameter("cmushroom")));
        pstmt.setString(11, user_id); // Replace with actual user_id

        // Execute the query
        pstmt.executeUpdate();
        response.sendRedirect("My_page.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        // 예외 처리 코드 작성
    }
%>