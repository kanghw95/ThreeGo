package threego.admin;

import java.sql.Date;


public class Report {
	private int bd_report_no;
	private int user_no;
	private int bd_content_no;
	private int user_no2;
	private String report_content;
	private Date report_date;
	private String reported;
	private String reporter;
	private String bd_content;
	
	
	public Report() {}
	
	
	public Report(int bd_report_no, int user_no, int bd_content_no, int user_no2, String report_content,
			Date report_date,String reported,String reporter,String bd_content) {
		super();
		this.bd_report_no = bd_report_no;
		this.user_no = user_no;
		this.bd_content_no = bd_content_no;
		this.user_no2 = user_no2;
		this.report_content = report_content;
		this.report_date = report_date;
		this.reported=reported;
		this.reporter=reporter;
		this.bd_content=bd_content;
	}
	
	
	public String getBd_content() {
		return bd_content;
	}


	public void setBd_content(String bd_content) {
		this.bd_content = bd_content;
	}


	public String getReported() {
		return reported;
	}


	public void setReported(String reported) {
		this.reported = reported;
	}


	public String getReporter() {
		return reporter;
	}


	public void setReporter(String reporter) {
		this.reporter = reporter;
	}


	public int getBd_report_no() {
		return bd_report_no;
	}
	public void setBd_report_no(int bd_report_no) {
		this.bd_report_no = bd_report_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getBd_content_no() {
		return bd_content_no;
	}
	public void setBd_content_no(int bc_content_no) {
		this.bd_content_no = bc_content_no;
	}
	public int getUser_no2() {
		return user_no2;
	}
	public void setUser_no2(int user_no2) {
		this.user_no2 = user_no2;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	
	
	
	
}
