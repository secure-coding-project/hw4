<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="userid.UserDTO"%>
<%@ page import="userid.userDAO"%>
<%@ page import="utill.DatabaseUtill"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // 이 페이지는 Sign_up에서 사용자가 입력한 값을 DB에 넣어주는 부분
    request.setCharacterEncoding("EUC-KR");
    String userID = null;
    String userPassword = null;
    PrintWriter script = response.getWriter();

    // userID를 입력받는 부분
    userID = request.getParameter("user_id");
    userPassword = request.getParameter("user_password");
    // userPassword를 입력받는 부분

    if (userID == null || userPassword == null) {
        script.println("<script>");
        // 사용자가 ID,PW 두 값을 모두 입력하지 않으면 발생하는 알람
        script.println("alert('Check your account');");
        // 다시 페이지를 이전으로 넘기는 것
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    }

    UserDTO userDTO = new UserDTO();
    userDTO.setUserID(userID);
    userDTO.setUserPassword(userPassword);

    userDAO userDAO = new userDAO();
    int result = userDAO.Sign_up(userDTO);

    if (result == 1) {
        script.println("<script>");
        // 사용자가 회원가입 성공시 뜨는 알람
        script.println("alert('Join!!');");
        // 로그인 성공 시 메인 화면으로 이동
        script.println("location.href ='login.jsp';");
        script.println("</script>");
        script.close();
        return;
    }
%>
