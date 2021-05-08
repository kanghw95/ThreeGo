package threego.model.vo;

import java.sql.Date;

public class Comment_tb {
	private  int com_no;
	private  int bd_content_no;
	private  int user_no;
	private String  com_writer;
	private String com_contents;
	private Date  rv_date;
	private int com_ref;
	private int com_re_step;
	private int com_re_level;
	
	
	
	
	
	@Override
	public String toString() {
		return "Comment_tb [com_no=" + com_no + ", bd_content_no=" + bd_content_no + ", user_no=" + user_no
				+ ", com_writer=" + com_writer + ", com_contents=" + com_contents + ", rv_date=" + rv_date
				+ ", com_ref=" + com_ref + ", com_re_step=" + com_re_step + ", com_re_level=" + com_re_level + "]";
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
	public int getCom_ref() {
		return com_ref;
	}
	public void setCom_ref(int com_ref) {
		this.com_ref = com_ref;
	}
	public int getCom_re_step() {
		return com_re_step;
	}
	public void setCom_re_step(int com_re_step) {
		this.com_re_step = com_re_step;
	}
	public int getCom_re_level() {
		return com_re_level;
	}
	public void setCom_re_level(int com_re_level) {
		this.com_re_level = com_re_level;
	}
	

	
}