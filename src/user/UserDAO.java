package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private ResultSet rs2;
	private ResultSet result;
	private String dbid;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/conseq?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).contentEquals(userPassword))
					return 1;
				else 
					return 0; 
			}
			return -1; 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?)";
		
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public String idFindAction(String userName, String userEmail) {
		String SQL = "SELECT userID FROM USER WHERE userName = ? and userEmail = ? ";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userName);
			pstmt.setString(2,userEmail);
			result = pstmt.executeQuery();
			if(result.next()) { 
				dbid = result.getString("userID");
			}
			return dbid; //id ����
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "no data";
	}
	
	public int passwdFindAction(String userID, String userName, String userEmail) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ? and userName =? and userEmail =?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			pstmt.setString(2,userName);
			pstmt.setString(3,userEmail);
			rs2 = pstmt.executeQuery();
			if(rs2.next()) {
					return 1;
			}
			return -1; 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; 
	}
	
	public int newpasswdAction(String userID, String userPassword) {
		String SQL = "UPDATE USER SET userPassword = ? WHERE userID = ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userPassword);
			pstmt.setString(2, userID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}