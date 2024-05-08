<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap');
</style>
  <style type="text/css">
    @import "My_page.css";
    @import "decoy.css";
</style>
 <script src="decoy.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="post-page">
  <a href="Main.jsp"><div class="Logo"><input type="button"><img src="images/Logo.png"></a>
  </div>
  
  <div class="navi">
  <!-- 로고 내부는 이미지로 활용해 클릭 시, 메인 페이지로 넘어가도록 -->
    <div class="Search">
    <input class="Button_form" type="button" value="Search" onclick="search()"></div>
  
   <div class="userid">
    <input type="button" class="userid2" value="My page"></div>
 
  </div>
  
<div class="results">
	<div class="profinf">
		<div class="profileimg"><img src="images/Logo.png"></div>
		<div class="nick-name">
		<%
        // 세션에서 user_id를 가져오기
        String user_id1 = (String) session.getAttribute("userID");
        
        // user_id가 null이 아닌 경우에만 출력
        if (user_id1 != null) {
    %>
        <%= user_id1 %>
    <%
        } else {
            out.println("UserID not found in session");
        }
    %>
		</div>
  	</div>
	<div class="informmodify"">
    <form class="informmodifybutton" action="logout.jsp"><input class="Button_form" type="submit" value="Logout"></form>
      </div>
  <div class="my_post">
  
  	<%@ include file="My_page_DB.jsp" %>
  
  </div>
     <div class="postadd">
    <input class="postaddbutton" type="button" value="Add" onclick="location.href='post_insert.jsp'"></div>
  <div class="my_mat">
  
            <%@ include file="My_page_Mat_DB.jsp" %> 

               </div>
   <div class="matmodify">
    <input class="modifybutton" type="button" value="Mat" onclick="list_open()"></div>
  </div>

	 <div class="decoy_div" style="display:none;">
		<div class="material_list_div"><!-- action으로 넘겨서 파라미터 값 넘겨서 검색에 사용 -->
					<form class="mat_search" style="display:none" action="Search_page.jsp">
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
					<div class="for_hwakin2">
						    <input class="hwakin_button2" type="submit" onclick="searchgo()" value="search">
					  </div>
					</form>
					
					<form class="mat_change" style="display:none" action="mat_change.jsp">
					<div class="flex-container">
						<div>
							양파	<input class="mount_text" name="conion" type="number" value="0"> 개
							</div>
						<div>
							감자 <input class="mount_text" name="cpotato" type="number" value="0"> 개
						</div>
					</div>
					<div class="flex-container">
						<div>
							파&nbsp;&nbsp;&nbsp;&nbsp;<input class="mount_text" name="cgreen_onion" type="number" value="0"> 단
						</div>
						<div>
							마늘 <input class="mount_text" name="cgarlic" type="number" value="0"> 쪽
						</div>
					</div>
					<div class="flex-container">
						<div>
							계란<input class="mount_text" name="cegg" type="number" value="0"> 개
						</div>
						<div>
							닭고기 <input class="mount_text" name="cchicken" type="number" value="0"> G
						</div>
					</div>
					<div class="flex-container">
						<div>
							소고기<input class="mount_text" name="cbeef" type="number" value="0"> G
						</div>
						<div>
							돈육 <input class="mount_text" name="cfork" type="number" value="0"> G
						</div>
					</div>
					<div class="flex-container">
						<div>
							김치<input class="mount_text" name="ckimchi" type="number" value="0"> G
						</div>
						<div>
							버섯 <input class="mount_text" name="cmushroom" type="number" value="0"> 개
						</div>
					</div>
						<div class="for_hwakin">
						    <input class="hwakin_button" type="submit" onclick="complete()" value="complete">
					  </div>
					</form>
					  <div class="for_x">
						    <input class="x_button" type="button" onclick="list_close()" value="X">
					  </div>

			  </div>
  </div>
  

</body>
</html>