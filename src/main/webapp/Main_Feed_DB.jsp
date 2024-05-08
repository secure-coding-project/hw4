<%@ page import="java.sql.*,java.util.Base64,java.util.TreeMap, java.util.Collections" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
    <div class="results">
        <div class="feedresults">
            <% 
                // JDBC 연결 정보
                String url = "jdbc:mysql://localhost:3306/user";
                String username = "root";
                String password = "0000";
                
                // 일정 값
                int limit = -1; // 원하는 임계값으로 변경

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(url, username, password);

                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery("SELECT * FROM post_info " +
                                                               "WHERE usage_count > " + limit +
                                                               " ORDER BY RAND()");

                   

                    while (resultSet.next()) {
                    	
                    	
                   
                        int post_num = resultSet.getInt("post_num");
                        String title = resultSet.getString("title");
                        String user_id = resultSet.getString("user_id");
                        int usage_count = resultSet.getInt("usage_count");
                        byte[] imageData = resultSet.getBytes("image_data");
                        String base64Image = Base64.getEncoder().encodeToString(imageData);
                        
                        
                       
                       
            %>
                        <div class="feed">
                        
                         <img class="feed_image" Onclick="location.href='post_page.jsp?post_num=<%=post_num %>'" src="data:image/png;base64, <%= base64Image %>" alt="Image">
                         <div class="feed_name" Onclick="location.href='post_page.jsp?post_num=<%=post_num %>'"><%=title %></div>
                         <div class="feed_content" onclick="location.href='post_page.jsp?post_num=<%=post_num%>'"> 이용 횟수 : <%=usage_count %>&nbsp; 작성자 : <%=user_id %></div>
                        </div>
            <%
                    }

                    resultSet.close();
                    statement.close();
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </div>
</body>
</html>
