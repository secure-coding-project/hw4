<%@ page import="java.sql.*, java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<div class="Mat_list">
    <%
        // JDBC 연결 정보
        String url_mat = "jdbc:mysql://localhost:3306/user";
        String username_mat = "root";
        String password_mat = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url_mat, username_mat, password_mat);

            int post_num2 = Integer.parseInt(request.getParameter("post_num"));
    			// 이제 receivedString을 사용할 수 있습니다.


            if (post_num2 != 0) {
                // 해당 user_id를 사용하여 user_mat_info에서 데이터 가져오기
                String sql = "SELECT * FROM post_info WHERE post_num = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setInt(1, post_num2);
                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        if (resultSet.next()) {
                            int mat_Onion = resultSet.getInt("mat_Onion");
                            int mat_Potato = resultSet.getInt("mat_Potato");
                            int mat_Greenonion = resultSet.getInt("mat_Greenonion");
                            int mat_Garlic = resultSet.getInt("mat_Garlic");
                            int mat_Egg = resultSet.getInt("mat_Egg");
                            int mat_Chicken = resultSet.getInt("mat_Chicken");
                            int mat_Beef = resultSet.getInt("mat_Beef");
                            int mat_Pork = resultSet.getInt("mat_Pork");
                            int mat_Kimchi = resultSet.getInt("mat_Kimchi");
                            int mat_Mushroom = resultSet.getInt("mat_Mushroom");
    %>
                                <div class="mat_Onion">양파 <%= mat_Onion %>개</div>
                                <div class="mat_Potato">감자 <%= mat_Potato %>개</div>
                                <div class="mat_Onion">파 <%= mat_Greenonion %>단</div>
                                <div class="mat_Potato">마늘 <%= mat_Garlic %>쪽</div>
                                <div class="mat_Onion">계란 <%= mat_Egg %>개</div>
                                <div class="mat_Potato">닭고기 <%= mat_Chicken %>g</div>
                                <div class="mat_Onion">소고기 <%= mat_Beef %>g</div>
                                <div class="mat_Potato">돼지고기 <%= mat_Pork %>g</div>
                                <div class="mat_Onion">김치 <%= mat_Kimchi %>g</div>
                                <div class="mat_Potato">버섯 <%= mat_Mushroom %>개</div>
    <%
                        } else {
                            out.println("No data found for user_id: " + post_num2);
                        }
                    }
                }
            } else {
                out.println("title not found in session");
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
