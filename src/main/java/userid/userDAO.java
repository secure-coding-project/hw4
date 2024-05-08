package userid;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import utill.DatabaseUtill;

public class userDAO {
		
	public int Sign_up(UserDTO userDTO) {
	    // 사용자의 입력값을 받는 부분
	    String SQL_user_info = "INSERT INTO user_info VALUES ('" + userDTO.getUserID() + "', '" + userDTO.getUserPassword() + "')";
	    String SQL_user_mat_info = "INSERT INTO user_mat_info VALUES ('" + userDTO.getUserID() + "', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)";
	    Connection conn = DatabaseUtill.getConnection();
	    try {
	        conn.setAutoCommit(false); // 트랜잭션 시작

	        // user_info 테이블에 데이터 추가
	        Statement stmt_user_info = conn.createStatement();
	        stmt_user_info.executeUpdate(SQL_user_info);

	        // user_mat_info 테이블에 데이터 추가
	        Statement stmt_user_mat_info = conn.createStatement();
	        stmt_user_mat_info.executeUpdate(SQL_user_mat_info);

	        conn.commit(); // 트랜잭션 커밋
	        return 1; // 정상적으로 입력되었다면 1을 반환
	    } catch (Exception e) {
	        e.printStackTrace();
	        try {
	            conn.rollback(); // 에러 발생 시 롤백
	        } catch (SQLException se) {
	            se.printStackTrace();
	        }
	    } finally {
	        try {
	            conn.setAutoCommit(true); // 트랜잭션 종료 후 다시 자동 커밋으로 변경
	        } catch (SQLException se) {
	            se.printStackTrace();
	        }
	    }
	    return -1; // 오류 시 -1 반환
	}

	
	public int login(String user_id, String user_pw) {
	    // 사용자의 입력값을 직접 쿼리에 포함
	    String SQL = "SELECT * FROM user_info WHERE user_id = '" + user_id + "' AND user_pw = '" + user_pw + "'";
	    try {
	        Connection conn = DatabaseUtill.getConnection();
	        Statement stmt = conn.createStatement();
	        ResultSet rs = stmt.executeQuery(SQL);

	        if (rs.next()) {
	            // 로그인 성공
	            return 1;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    // 로그인 실패
	    return -1;
	}
}
