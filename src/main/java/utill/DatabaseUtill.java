package utill;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtill {
	public static Connection getConnection() {
		try {
			String dbURL ="jdbc:mysql://localhost:3306/user";
			String dbID = "root";
			String dbPassword ="0000";
			//Driver, connector를 lib에 넣어주지 않으면 오류가 생김
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
}
