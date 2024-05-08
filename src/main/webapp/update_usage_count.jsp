<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.InputStream" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.io.PrintWriter"%>
<%
    String url = "jdbc:mysql://localhost:3306/user";
    String username = "root";
    String password = "0000";
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    PreparedStatement preparedStatement2 = null;
    ResultSet resultSet = null;
    ResultSet resultSet2 = null;
    // 받아온 title 값 -> post_num으로 수정 
    int post_num = Integer.parseInt(request.getParameter("post_num"));
    String userId = (String) session.getAttribute("userID");
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, password);

        // 해당 title에 대한 usage_count 증가 쿼리"?
        String updateQuery = "UPDATE post_info SET usage_count = usage_count + 1 WHERE post_num = ?";
        preparedStatement2 = connection.prepareStatement(updateQuery);
        preparedStatement2.setInt(1, post_num);
        preparedStatement2.executeUpdate();
        
        String postQuery = "SELECT * FROM post_info WHERE post_num = ?";
        preparedStatement = connection.prepareStatement(postQuery);
        preparedStatement.setInt(1, post_num);
        resultSet = preparedStatement.executeQuery();
        int monion = 0;
        int mpotato =  0;
        int mgreenonion =  0;
        int mgarlic =  0;
        int megg =  0;
        int mchicken =  0;
        int mbeef =  0;
        int mfork =  0;
        int mkimchi =  0;
        int mmushroom =  0;
        while (resultSet.next()) {
	        monion = resultSet.getInt("mat_Onion");
	        mpotato = resultSet.getInt("mat_Potato");
	        mgreenonion = resultSet.getInt("mat_Greenonion");
	        mgarlic = resultSet.getInt("mat_Garlic");
	        megg = resultSet.getInt("mat_Egg");
	        mchicken = resultSet.getInt("mat_Chicken");
	        mbeef = resultSet.getInt("mat_Beef");
	        mfork = resultSet.getInt("mat_Pork");
	        mkimchi = resultSet.getInt("mat_Kimchi");
	        mmushroom = resultSet.getInt("mat_Mushroom");
        }
        
        String userMatQuery = "SELECT * FROM user_mat_info WHERE user_id = ?";
        preparedStatement = connection.prepareStatement(userMatQuery);
        preparedStatement.setString(1, userId);
        resultSet2 = preparedStatement.executeQuery();
        int uonion = 0;
        int upotato = 0; 
        int ugreenonion = 0;
        int ugarlic = 0;
        int uegg = 0;
        int uchicken = 0;
        int ubeef = 0;
        int ufork = 0;
        int ukimchi = 0;
        int umushroom = 0;
        while (resultSet2.next()) {
	        uonion = resultSet2.getInt("mat_Onion");
	        upotato = resultSet2.getInt("mat_Potato");
	        ugreenonion = resultSet2.getInt("mat_Greenonion");
	        ugarlic = resultSet2.getInt("mat_Garlic");
	        uegg = resultSet2.getInt("mat_Egg");
	        uchicken = resultSet2.getInt("mat_Chicken");
	        ubeef = resultSet2.getInt("mat_Beef");
	        ufork = resultSet2.getInt("mat_Pork");
	        ukimchi = resultSet2.getInt("mat_Kimchi");
	        umushroom = resultSet2.getInt("mat_Mushroom");
        }
        
        int ronion = Math.max(0, uonion - monion);
        int rpotato = Math.max(0, upotato - mpotato);
        int rgreenonion = Math.max(0, ugreenonion - mgreenonion);
        int rgarlic = Math.max(0, ugarlic - mgarlic);
        int regg = Math.max(0, uegg - megg);
        int rchicken = Math.max(0, uchicken - mchicken);
        int rbeef = Math.max(0, ubeef - mbeef);
        int rfork = Math.max(0, ufork - mfork);
        int rkimchi = Math.max(0, ukimchi - mkimchi);
        int rmushroom = Math.max(0, umushroom - mmushroom);
        
        String updateMatQuery = "UPDATE user_mat_info SET mat_Onion=?, mat_Potato=?, mat_Greenonion=?, mat_Garlic=?, mat_Egg=?, mat_Chicken=?, mat_Beef=?, mat_Pork=?, mat_Kimchi=?, mat_Mushroom=? WHERE user_id=?";
        preparedStatement = connection.prepareStatement(updateMatQuery);
        preparedStatement.setInt(1, ronion);
        preparedStatement.setInt(2, rpotato);
        preparedStatement.setInt(3, rgreenonion);
        preparedStatement.setInt(4, rgarlic);
        preparedStatement.setInt(5, regg);
        preparedStatement.setInt(6, rchicken);
        preparedStatement.setInt(7, rbeef);
        preparedStatement.setInt(8, rfork);
        preparedStatement.setInt(9, rkimchi);
        preparedStatement.setInt(10, rmushroom);
        preparedStatement.setString(11, userId); // Replace with actual user_id

        // Execute the query
        preparedStatement.executeUpdate();

        preparedStatement.close();
        preparedStatement2.close();
        connection.close();
    } catch (Exception e) {
        out.println("DB 연동 오류입니다. : " + e.getMessage());
    }
%>
