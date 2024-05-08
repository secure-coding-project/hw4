<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap');
</style>
  <style type="text/css">
    @import "post_page.css";
    @import "decoy.css";
</style>
 <script src="decoy.js"></script>
    <meta charset="UTF-8">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <script>
        // 조회수 업데이트 함수
        function updateUsageCount(post_num) {
            $.ajax({
                type: 'POST',
                url: 'update_usage_count.jsp?post_num=' + post_num,
                success: function (response) {
                    alert('usage_count 업데이트 load 성공');
                    // 업데이트 후 다른 동작 수행
                    location.reload();
                },
                error: function () {
                    alert('서버 요청 load 업데이트 오류');
                }
            });
        }       
    </script>
    
<%
String url = "jdbc:mysql://localhost:3306/user";
String username = "root";
String password = "root";
// title-> post_num
int post_num = Integer.parseInt(request.getParameter("post_num"));

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(url, username, password);
    Statement statement = connection.createStatement();
    // title-> post_num 오류유의 
    ResultSet resultSet = statement.executeQuery("select * from post_info where post_num = " + post_num);

    while (resultSet.next()) {
        String title = resultSet.getString("title");
        String content = resultSet.getString("content");
        byte[] imageData = resultSet.getBytes("image_data");
        String base64Image = Base64.getEncoder().encodeToString(imageData);
        String user_id = resultSet.getString("user_id");
        int usage_count = resultSet.getInt("usage_count");
        // title 변수를 페이지 전역에 선언
        pageContext.setAttribute("title", title);
%>
        <title><%=title%></title>
    </head>
    <body>
        <div class="post-page">
            <a href="Main.jsp"><div class="Logo"><input type="button"><img src="images/Logo.png"></div></a>
            <div class="navi">
                <!-- 로고 내부는 이미지로 활용해 클릭 시, 메인 페이지로 넘어가도록 -->
                <div class="Button_form" type="button" onclick="search()">Search</div>
                <div class="Button_form" type="button" onClick="location.href='My_page.jsp'">My page</div>
            </div>

            <div class="results">            
                <div class="postresults">
                <div class="Title"><%=title%></div>
                <div class="post_info"> 레시피 사용 횟수: <%=usage_count %> 작성자: <%=user_id %></div>
                <div class="line"></div>
                    <img class="post_img" src="data:image/png;base64, <%= base64Image %>" alt="Image">
                    <div class="post_text"><%=content %></div>
                </div>
            </div> 
<%
    }
    resultSet.close();
    statement.close();
    connection.close();
} catch (Exception e) {
    out.println("DB 연동 오류입니다. : " + e.getMessage());
}
%>

        <div class="banner">
            <div class="Beforepost" >
                <input class="banner_form" type="button" value="재료 확인" onclick="list_open2()">
            </div>
            <div class="Menu">
                <input class="banner_form" type="button"  onclick="location.href='Main.jsp'" value="목록으로">
            </div>
            <div class="Nextpost" style="display:none;">
                <input class="banner_form" type="button" value=" 다음 글 ▶">
            </div>
            <div class="Use">
                <!-- 레시피 사용 버튼 클릭 시, updateUsageCount 함수 호출 -->
                <input class="banner_form" type="button" onclick="updateUsageCount('<%=post_num %>')" value="레시피 사용">
            </div>
        </div>
        <div class="decoy_div" style="display:none;">
      <form class="material_list_div" action="Search_page_DB.jsp"><!-- action으로 넘겨서 파라미터 값 넘겨서 검색에 사용 -->
              
				<div class="mat_list mat_change">
					<%@ include file="post_mat_DB.jsp" %>
				</div>
               <div class="mat_list mat_search">
               제목 : <input type="text" class="searchtxt" name="Search_page_DB.jsp"><br>
               <div class="flex-container">
                  <div>
                     양파   <input class="mount_text" name="onion" type="number" value="0"> 개
                     </div>
                  <div>
                     감자 <input class="mount_text" name="potato" type="number" value="0"> 개
                  </div>
               </div>
               <div class="flex-container">
                  <div>
                     파&nbsp;&nbsp;&nbsp;&nbsp;<input class="mount_text" name="green_onion" type="number" value="0"> 단
                  </div>
                  <div>
                     마늘 <input class="mount_text" name="garlic" type="number" value="0"> 쪽
                  </div>
               </div>
               <div class="flex-container">
                  <div>
                     계란<input class="mount_text" name="egg" type="number" value="0"> 개
                  </div>
                  <div>
                     닭고기 <input class="mount_text" name="chicken" type="number" value="0"> G
                  </div>
               </div>
               <div class="flex-container">
                  <div>
                     소고기<input class="mount_text" name="beef" type="number" value="0"> G
                  </div>
                  <div>
                     돈육 <input class="mount_text" name="fork" type="number" value="0"> G
                  </div>
               </div>
               <div class="flex-container">
                  <div>
                     김치<input class="mount_text" name="kimchi" type="number" value="0"> G
                  </div>
                  <div>
                     버섯 <input class="mount_text" name="mushroom" type="number" value="0"> 개
                  </div>
               </div>
               </div>
                 <div class="for_x">
                      <input class="x_button" type="button" onclick="list_close()" value="X">
                 </div>
                 <div class="for_hwakin">
                      <input class="hwakin_button" type="submit" onclick="searchgo()" value="complete">
                 </div>
           </form>
  </div>
    </body>
</html>