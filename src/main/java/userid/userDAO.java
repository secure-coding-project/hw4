package userid;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utill.DatabaseUtill;

public class userDAO {

	public int Sign_up(UserDTO userDTO) {
		// 사용자의 입력값을 받는 부분
		String SQL_user_info = "INSERT INTO user_info VALUES (?, ?)";
		String SQL_user_mat_info = "INSERT INTO user_mat_info VALUES (?, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)";
		Connection conn = DatabaseUtill.getConnection();
		try {

			conn.setAutoCommit(false); // 트랜잭션 시작

			// user_info 테이블에 데이터 추가
			PreparedStatement pstmt_user_info = conn.prepareStatement(SQL_user_info);
			pstmt_user_info.setString(1, userDTO.getUserID()); // 받은 값을 ID에 저장
			pstmt_user_info.setString(2, userDTO.getUserPassword()); // 받은 값을 Password에 저장
			pstmt_user_info.executeUpdate();

			// user_mat_info 테이블에 데이터 추가
			PreparedStatement pstmt_user_mat_info = conn.prepareStatement(SQL_user_mat_info);
			pstmt_user_mat_info.setString(1, userDTO.getUserID()); // 받은 값을 ID에 저장
			pstmt_user_mat_info.executeUpdate();

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
		// 사용자의 입력값을 받아와서 DB에 있는지 확인하는 부분
		String SQL = "SELECT * FROM user_info WHERE user_id = ? AND user_pw = ?";
		try {
			Connection conn = DatabaseUtill.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pw);
			ResultSet rs = pstmt.executeQuery();

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