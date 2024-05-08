<%@ page import="java.sql.*,java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<div class="feed_title">
    <% 
        // JDBC 연결 정보
        String url = "jdbc:mysql://localhost:3306/user";
        String username = "root";
        String password = "0000";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);

            // 세션에서 user_id를 가져오기
            String user_id = (String) session.getAttribute("userID");

            if (user_id != null) {
                // 해당 user_id를 사용하여 해당 사용자가 작성한 포스트 정보 가져오기
                String sql = "SELECT * FROM post_info WHERE user_id = '" + user_id + "'";
                try (Statement statement = connection.createStatement()) {
                    try (ResultSet resultSet = statement.executeQuery(sql)) {
                        while (resultSet.next()) {
                            String title = resultSet.getString("title");
                            int post_num = resultSet.getInt("post_num");
    %>
                            <div class="feed">
                                <div class="feed_name" onclick="location.href='post_page.jsp?post_num=<%=post_num %>'"><%=title %></div>
                            </div>
    <%
                        }
                    }
                }
            } else {
                out.println("userID not found in session");
            }

            connection.close();
        } catch (Exception e) {
            out.println("Exception: " + e.getMessage());
            e.printStackTrace();
        }
    %>
</div>


</body>
</html>
