package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommentDAO {
	
	private Connection conn;
	private ResultSet rs;
	private ResultSet rs1;
	private ResultSet rs2;


	public CommentDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/conseq?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "conseq";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate()
	{
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
				
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext()
	{
		String SQL = "SELECT cCode FROM COMMENT ORDER BY 1 DESC"; 
	
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs1 = pstmt.executeQuery();
			
			if(rs1.next()) {
				return rs1.getInt(1) + 1;
			} 
			return 1; 
				
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	
	public int write(int tpID, String comment, String userID) 
	{
		String SQL = "INSERT INTO COMMENT VALUES (?, ?, ?, ?, ?)"; 

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()); 
			pstmt.setInt(2, tpID);
			pstmt.setString(3, comment);
			pstmt.setString(4, userID);
			pstmt.setString(5, getDate()); 
			
			return pstmt.executeUpdate();
				
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public ArrayList<Comment> getList(int bCode){ 
		String SQL = "SELECT * FROM COMMENT WHERE bCode=?";
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bCode);
			rs2 = pstmt.executeQuery();
			while (rs2.next()) {
				Comment co = new Comment(
						rs2.getInt(1),
						rs2.getInt(2),
						rs2.getString(3),
						rs2.getString(4),
						rs2.getString(5)
						);
				list.add(co);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}

}

