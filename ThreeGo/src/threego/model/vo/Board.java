package threego.model.vo;

import java.sql.Date;

public class Board { 
private int bd_content_no;
private int user_no;
private String bd_writer;
private String bd_subject;
private String bd_content;
private Date bd_date;
private int bd_likecnt;
private String bd_category;






@Override
public String toString() {
	return "Board [bd_content_no=" + bd_content_no + ", user_no=" + user_no + ", bd_writer=" + bd_writer
			+ ", bd_subject=" + bd_subject + ", bd_content=" + bd_content + ", bd_date=" + bd_date + ", bd_likecnt="
			+ bd_likecnt + ", bd_category=" + bd_category + "]";
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
public String getBd_writer() {
	return bd_writer;
}
public void setBd_writer(String bd_writer) {
	this.bd_writer = bd_writer;
}
public String getBd_subject() {
	return bd_subject;
}
public void setBd_subject(String bd_subject) {
	this.bd_subject = bd_subject;
}
public String getBd_content() {
	return bd_content;
}
public void setBd_content(String bd_content) {
	this.bd_content = bd_content;
}
public Date getBd_date() {
	return bd_date;
}
public void setBd_date(Date bd_date) {
	this.bd_date = bd_date;
}
public int getBd_likecnt() {
	return bd_likecnt;
}
public void setBd_likecnt(int bd_likecnt) {
	this.bd_likecnt = bd_likecnt;
}
public String getBd_category() {
	return bd_category;
}
public void setBd_category(String bd_category) {
	this.bd_category = bd_category;
}


}