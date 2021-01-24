package tp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class TpDAO {
	
	private Connection conn;
	private ResultSet rs;

	public TpDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/conseq?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
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
		String SQL = "SELECT tpID FROM TP ORDER BY tpID DESC"; 
	
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
			} 
			return 1; 
				
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public int write(String tpTitle, String userID, String tpContent) 
	{
		String SQL = "INSERT INTO TP VALUES (?, ?, ?, ?, ?, ?)"; 
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()); 
			pstmt.setString(2, tpTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, tpContent);
			pstmt.setInt(6, 1); 
			
			return pstmt.executeUpdate();
				
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public ArrayList<Tp> getList(int pageNumber){ 
		String SQL = "SELECT * FROM TP WHERE tpID < ? AND tpAvailable = 1 ORDER BY tpID DESC LIMIT 10";
		ArrayList<Tp> list = new ArrayList<Tp>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Tp tp = new Tp();
				tp.setTpID(rs.getInt(1));
				tp.setTpTitle(rs.getString(2));
				tp.setUserID(rs.getString(3));
				tp.setTpDate(rs.getString(4));
				tp.setTpContent(rs.getString(5));
				tp.setTpAvailable(rs.getInt(6));
				list.add(tp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	public boolean nextPage (int pageNumber) {
		String SQL = "SELECT * FROM TP WHERE tpID < ? AND tpAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; 		
	}
	
	public Tp getTp(int tpID) {
		String SQL = "SELECT * FROM TP WHERE tpID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, tpID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Tp tp = new Tp();
				tp.setTpID(rs.getInt(1));
				tp.setTpTitle(rs.getString(2));
				tp.setUserID(rs.getString(3));
				tp.setTpDate(rs.getString(4));
				tp.setTpContent(rs.getString(5));
				tp.setTpAvailable(rs.getInt(6));

				return tp;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public int update(int tpID, String tpTitle, String tpContent) {
		String SQL = "UPDATE TP SET tpTitle = ?, tpContent = ? WHERE tpID LIKE ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, tpTitle);
				pstmt.setString(2, tpContent);
				pstmt.setInt(3, tpID);
				
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
		}
		return -1;
	}
	
	
	public int delete(int tpID) {
		String SQL = "UPDATE TP SET tpAvailable = 0 WHERE tpID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);   
			pstmt.setInt(1, tpID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
}


