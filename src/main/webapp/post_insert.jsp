<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap');
</style>
  <style type="text/css">
    @import "post_insert.css";
    @import "decoy.css";
</style>
<title> 게시판 </title>
<script src="decoy.js"></script>
</head>
<body>
	<form class="post-page" action="post_insert_DB.jsp" enctype="multipart/form-data" method="post">
			  <div class="title-div">
			  		<textarea class="title_text_input" name="title" placeholder="title text area"></textarea>
			  </div>
			  <div class="main-text-div">
			  
				    <div class="imginsertdiv">
				    	<label for="file">img</label> 
					      <input class="imginsertbutton" name="file" id="file" type="file">
				    </div>
				    
				    <textarea class="main_text_input" name="content" placeholder="Content text area"></textarea>
			  </div>
			 <div class="Logo">
				 <a href="Main.jsp"><img src="images/Logo.png"></a>
			 </div>
		  <div class="submit-and-material">
			    <div class="submit">
				      <input class="submit_button" type="button" onclick="post_insert_open()" value="submit">
			    </div>
			    
			    <div class="material" style="display:none;">
				      <input class="material_button" type="button" onclick="post_insert_open()" value="mat">
			    </div>
		  </div>
	  <div class="decoy_div" style="display:none;">
		<div class="material_list_div"><!-- action으로 넘겨서 파라미터 값 넘겨서 검색에 사용 -->
					<div class="mat_change" style="display:none">
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
						    <input class="hwakin_button" type="submit" value="complete">
					  </div>
					</div>
					  <div class="for_x">
						    <input class="x_button" type="button" onclick="list_close()" value="X">
					  </div>

			  </div>
  </div>
  </form>
</body>
</html>