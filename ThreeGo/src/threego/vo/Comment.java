package threego.vo;

import java.sql.Date;

public class Comment {
	private  int com_no;
	private  int bd_content_no;
	private  int user_no;
	private String  com_writer;
	private String com_contents;
	private Date  rv_date;
	@Override
	public String toString() {
		return "Comment [com_no=" + com_no + ", bd_content_no=" + bd_content_no + ", user_no=" + user_no
				+ ", com_writer=" + com_writer + ", com_contents=" + com_contents + ", rv_date=" + rv_date + "]";
	}
	public int getCom_no() {
		return com_no;
	}
	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}
	public int getBd_content_no() {
		return bd_content_no;
	}
	public void setBd_content_no(int bd_content_no) {
		this.bd_content_no = bd_content_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getCom_writer() {
		return com_writer;
	}
	public void setCom_writer(String com_writer) {
		this.com_writer = com_writer;
	}
	public String getCom_contents() {
		return com_contents;
	}
	public void setCom_contents(String com_contents) {
		this.com_contents = com_contents;
	}
	public Date getRv_date() {
		return rv_date;
	}
	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}
	
	
}
