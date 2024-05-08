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

    PreparedStatement pstmt = null;

    // 데이터베이스에 저장
try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
    // 직접 문자열 연결을 사용하여 SQL 쿼리 작성
    String sql = "UPDATE user_mat_info SET mat_Onion=" + request.getParameter("conion") +
                 ", mat_Potato=" + request.getParameter("cpotato") +
                 ", mat_Greenonion=" + request.getParameter("cgreen_onion") +
                 ", mat_Garlic=" + request.getParameter("cgarlic") +
                 ", mat_Egg=" + request.getParameter("cegg") +
                 ", mat_Chicken=" + request.getParameter("cchicken") +
                 ", mat_Beef=" + request.getParameter("cbeef") +
                 ", mat_Pork=" + request.getParameter("cfork") +
                 ", mat_Kimchi=" + request.getParameter("ckimchi") +
                 ", mat_Mushroom=" + request.getParameter("cmushroom") +
                 " WHERE user_id='" + user_id + "'"; // user_id는 SQL 인젝션 공격에 주의해야 함

    try (Statement stmt = conn.createStatement()) {
        stmt.executeUpdate(sql);
        response.sendRedirect("My_page.jsp");
    }
} catch (SQLException e) {
    e.printStackTrace();
    // 예외 처리 코드 작성
}

%>