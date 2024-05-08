<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="javax.servlet.http.HttpSession" %>
    <%
    // 로그인된 사용자의 아이디 가져오기
   
         PrintWriter script = response.getWriter();
         String user_id = (String) session.getAttribute("userID");
         String ifnull = null;
         if (user_id == null || user_id.equals(ifnull)) {
        script.println("<script>");
        script.println("alert('Please log in.');");
        script.println("location.href ='login.jsp';");
        script.println("</script>");
        script.close();
    }
    %>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap');
</style>
  <style type="text/css">
    @import "Main.css";
    @import "decoy.css";
</style>

 <script src="decoy.js"></script>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="post-page">
 <a href="Main.jsp"><div class="Logo"><input type="button"><img src="images/Logo.png"></a>
  </div>
  
  <div class="navi">
  <!-- 로고 내부는 이미지로 활용해 클릭 시, 메인 페이지로 넘어가도록 -->
    <div class="Button_form" type="button" onclick="list_open()">Search</div>
  
    <div class="Button_form" type="button" onClick="location.href='My_page.jsp'">My page</div>
  </div> 
     <%@ include file="Search_page_DB.jsp" %>
  
  <div class="Post">
   <div class="Button_form" type="button" onClick="location.href='post_insert.jsp'">To Post</div>
  </div>

  <div class="decoy_div" style="display:none;">
				<form class="material_list_div" action="Search_page.jsp"><!-- action으로 넘겨서 파라미터 값 넘겨서 검색에 사용 -->
					<div class="mat_list mat_search">
					제목 : <input type="text" class="searchtxt" name="search_txt"><br>
					<div class="flex-container">
						<div>
							양파	<input class="mount_text" name="onion" type="number" value="0"> 개
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