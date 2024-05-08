<!-- Search_page_DB.jsp -->
<%@ page import="java.sql.*,java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
    <div class="results">
        <div class="feedresults">
            <% 
                String url = "jdbc:mysql://localhost:3306/user";
                String username = "root";
                String password = "root";
                int monion = Integer.parseInt(request.getParameter("onion"));
                int mpotato = Integer.parseInt(request.getParameter("potato"));
                int mgreenonion = Integer.parseInt(request.getParameter("green_onion"));
                int mgarlic = Integer.parseInt(request.getParameter("garlic"));
                int megg = Integer.parseInt(request.getParameter("egg"));
                int mchicken = Integer.parseInt(request.getParameter("chicken"));
                int mbeef = Integer.parseInt(request.getParameter("beef"));
                int mfork = Integer.parseInt(request.getParameter("fork"));
                int mkimchi = Integer.parseInt(request.getParameter("kimchi"));
                int mmushroom = Integer.parseInt(request.getParameter("mushroom"));

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String search_txt = request.getParameter("search_txt");
                    
                    Connection connection = DriverManager.getConnection(url, username, password);

                    try (Statement statement = connection.createStatement()) {
                        ResultSet resultSet = null;
                        
                        String sql;

                        if (search_txt != null && !search_txt.isEmpty()) {
                            sql = "SELECT * FROM post_info WHERE " +
                                "(mat_Onion > 0 AND mat_Onion <= " + monion + ") OR " +
                                "(mat_Potato > 0 AND mat_Potato <= " + mpotato + ") OR " +
                                "(mat_Greenonion > 0 AND mat_Greenonion <= " + mgreenonion + ") OR " +
                                "(mat_Garlic > 0 AND mat_Garlic <= " + mgarlic + ") OR " +
                                "(mat_Egg > 0 AND mat_Egg <= " + megg + ") OR " +
                                "(mat_Chicken > 0 AND mat_Chicken <= " + mchicken + ") OR " +
                                "(mat_Beef > 0 AND mat_Beef <= " + mbeef + ") OR " +
                                "(mat_Pork > 0 AND mat_Pork <= " + mfork + ") OR " +
                                "(mat_Kimchi > 0 AND mat_Kimchi <= " + mkimchi + ") OR " +
                                "(mat_Mushroom > 0 AND mat_Mushroom <= " + mmushroom + ") OR " +
                                "title LIKE '%" + search_txt + "%'";
                        } else {
                            sql = "SELECT * FROM post_info WHERE " +
                                "(mat_Onion > 0 AND mat_Onion <= " + monion + ") OR " +
                                "(mat_Potato > 0 AND mat_Potato <= " + mpotato + ") OR " +
                                "(mat_Greenonion > 0 AND mat_Greenonion <= " + mgreenonion + ") OR " +
                                "(mat_Garlic > 0 AND mat_Garlic <= " + mgarlic + ") OR " +
                                "(mat_Egg > 0 AND mat_Egg <= " + megg + ") OR " +
                                "(mat_Chicken > 0 AND mat_Chicken <= " + mchicken + ") OR " +
                                "(mat_Beef > 0 AND mat_Beef <= " + mbeef + ") OR " +
                                "(mat_Pork > 0 AND mat_Pork <= " + mfork + ") OR " +
                                "(mat_Kimchi > 0 AND mat_Kimchi <= " + mkimchi + ") OR " +
                                "(mat_Mushroom > 0 AND mat_Mushroom <= " + mmushroom + ")";
                        }

                        resultSet = statement.executeQuery(sql);

                        while (resultSet.next()) {
                            String title = resultSet.getString("title");
                            String user_id2 = resultSet.getString("user_id");
                            int post_num2 = resultSet.getInt("post_num");
                            int view_count = resultSet.getInt("view_count");
                            int usage_count = resultSet.getInt("usage_count");
                            byte[] imageData = resultSet.getBytes("image_data");
                            String base64Image = Base64.getEncoder().encodeToString(imageData);
            %>
                   
                            <div class="feed">
                         <img class="feed_image" Onclick="location.href='post_page.jsp?post_num=<%=post_num2 %>'" src="data:image/png;base64, <%= base64Image %>" alt="Image">
                         <div class="feed_name" Onclick="location.href='post_page.jsp?post_num=<%=post_num2 %>'"><%=title %></div>
                         <div class="feed_content" onclick="location.href='post_page.jsp?post_num=<%=post_num2%>'"> 이용 횟수 : <%=usage_count %>&nbsp; 작성자 : <%=user_id2 %></div>
                            </div>
            <%
                        }
                    } // Statement 자동 close
                    
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </div>
</body>
</html>