package hospital;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class HospitalDAO {
	private Connection conn;

	public HospitalDAO() {
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
	public ArrayList<Hospital> getList(String category, String region, String search, int pageNumber){
		if(category.contentEquals("전체")) {
			category="";
		}
		if(region.contentEquals("전체")) {
			region="";
		}

		
		ArrayList<Hospital> list = null;
		String SQL ="";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			SQL = "SELECT * FROM HOSPITAL WHERE category LIKE ? AND region LIKE ? AND CONCAT(category, region, address, name, phone) LIKE ? ORDER BY category DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + category + "%");
			pstmt.setString(2, "%" + region + "%");
			pstmt.setString(3, "%" + search + "%");
			rs = pstmt.executeQuery();
			list = new ArrayList<Hospital>();

			while(rs.next()) {
				Hospital hospital = new Hospital(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5)
						);
				list.add(hospital);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return list;
		
		}
	}
