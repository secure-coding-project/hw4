<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <style>
   @import url('https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap');
   </style>
  <style type="text/css">
  @import "Sign_up.css";
  @import "decoy.css"
  </style>
  <script src="decoy.js"></script>
  <title>Insert title here</title>
</head>
<body>
  <div class="back_ground">
   <div class="title">
    <div class="Title">
      <div class="Title_sign">Sign Up</div>
    </div>
    
    <div class="Login_Sign">
      <div class="Account_form">
        <div class="SubTitle">Join and share your recipe!</div>
      </div>
    </div>
    </div>
    <form method="post" action="userJoinAction.jsp">
      <div class="EM">
        <div class="email">Email</div>
        <div class="email_form"><input class=input_form name="user_id" type="text" placeholder="Email"></div>
      </div>

      <div class="PW">
        <div class="password">Password</div>
        <div class="password_form"><input class=input_form name="user_password" type="password" placeholder="password">
        </div>
        
      </div>
      <div class="submit_button2"><input class="submit_form" type="button" value="Mat" onclick="list_open()" style="display:none;"></div> 
      <div class="submit_button"><input class="submit_form" type="submit" value="Join!"></div> 
  </form>
  </div>
  <div class="decoy_div" style="display:none;">
      <div class="material_list_div">
               <div class="mat_list">
                  <tr>
                     <td>양파&nbsp;</td>
                     <td>
                        <input class="mount_text" name="countnum" type="number" value="0">개
                     </td>
                     
                  </tr>
                                    <tr>
                     <td>감자&nbsp;</td>
                     <td>
                        <input class="mount_text" name="countnum" type="number" value="0">개
                     </td>
                  </tr>
                                    <tr><br>
                     <td>파&nbsp;&nbsp;</td>
                     <td>
                        <input class="mount_text" name="countnum" type="number" value="0">단
                     </td>
                  </tr>
                                    <tr>
                     <td>마늘&nbsp;</td>
                     <td>
                        <input class="mount_text" name="countnum" type="number" value="0">쪽
                     </td>
                  </tr>
                                    <tr><br>
                     <td>계란&nbsp;</td>
                     <td>
                        <input class="mount_text" name="countnum" type="number" value="0">개
                     </td>
                  </tr>
                                    <tr>
                     <td>닭고기</td>
                     <td>
                        <input class="mount_text" name="countnum" type="number" value="0"><font-style="itailic"> g</font-style>
                     </td>
                  </tr>
                                    <tr><br>
                     <td>소고기</td>
                     <td>
                        <input class="mount_text" name="countnum" type="number" value="0">g
                     </td>
                  </tr>
                                    <tr>
                     <td>돈육&nbsp;</td>
                     <td>
                        <input class="mount_text" name="countnum" type="number" value="0">g
                     </td>
                  </tr>
                                    <tr><br>
                     <td>김치&nbsp;</td>
                     <td>
                        <input class="mount_text" name="countnum" type="number" value="0">g
                     </td>
                  </tr>
                                    <tr>
                     <td>버섯&nbsp;</td>
                     <td>
                        <input class="mount_text" name="countnum" type="number" value="0">개
                     </td>
                  </tr>
                  
                  
               </div>
                 <div class="for_x">
                      <input class="x_button" type="button" onclick="list_close()" value="X">
                 </div>
                 <div class="for_hwakin">
                      <input class="hwakin_button" type="submit" onclick="complete()" value="complete">
                 </div>
           </div>
   </div>
</body>

</html>