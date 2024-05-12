<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="userid.UserDTO"%>
<%@ page import="userid.userDAO"%>
<%@ page import="utill.DatabaseUtill"%>
<%@ page import="java.io.PrintWriter"%>

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

    if(userID == null || userPassword == null){
        script.println("<script>");
        // 사용자가 ID, PW 두 값을 모두 입력하지 않으면 발생하는 알람
        script.println("alert('Check your account');");
        // 다시 페이지를 이전으로 넘기는 것
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    }

    userDAO userDAO = new userDAO();
    if (!userID.matches("[A-Za-z0-9_]+") || !userPassword.matches("[A-Za-z0-9_]+")) {
        script.println("<script>alert('Invalid user ID.'); history.back();</script>");
        script.close();
        return;
    }
    int result = userDAO.login(userID, userPassword); // 로그인 시도
    if(result == 1){
        // 로그인 성공 시 세션을 설정하고 메인 페이지로 이동
        session.setAttribute("userID", userID);
        response.sendRedirect("Main.jsp");
    } else {
        // 로그인 실패 시 알림을 띄우고 이전 페이지로 이동
        script.println("<script>");
        script.println("alert('Login failed. Check your ID and password.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    }
%>
