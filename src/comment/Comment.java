package comment;

public class Comment {
	private int cCode;
	private int bCode;
	private String comment;
	private String userID;
	private String regDatetime;
	
	public int getcCode() {
		return cCode;
	}
	public void setcCode(int cCode) {
		this.cCode = cCode;
	}
	public int getbCode() {
		return bCode;
	}
	public void setbCode(int bCode) {
		this.bCode = bCode;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getRegDatetime() {
		return regDatetime;
	}
	public void setRegDatetime(String regDatetime) {
		this.regDatetime = regDatetime;
	}
	
	public Comment(int cCode, int bCode, String comment, String userID, String regDatetime) {
		super();
		this.cCode = cCode;
		this.bCode = bCode;
		this.comment = comment;
		this.userID = userID;
		this.regDatetime = regDatetime;
	}
}
