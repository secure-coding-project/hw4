package userid;

public class UserDTO {

	String user_id;
	String user_pw;
	
	public String getUserID() {
		return user_id;
	}
	public void setUserID(String userID) {
		this.user_id = userID;
	}
	public String getUserPassword() {
		return user_pw;
	}
	public void setUserPassword(String userPassword) {
		this.user_pw = userPassword;
	}
	
}
