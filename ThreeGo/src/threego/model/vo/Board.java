package threego.model.vo;

import java.sql.Date;

public class Board { 
private int bd_content_no;
private int user_no;
private String bd_writer;
private String bd_subject;
private String bd_content;
private Date bd_date;
private int bd_ref;
private int bd_re_step;
private int bd_re_level;
private int bd_likecnt;
@Override
public String toString() {
	return "Board [bd_content_no=" + bd_content_no + ", user_no=" + user_no + ", bd_writer=" + bd_writer
			+ ", bd_subject=" + bd_subject + ", bd_content=" + bd_content + ", bd_date=" + bd_date + ", bd_ref="
			+ bd_ref + ", bd_re_step=" + bd_re_step + ", bd_re_level=" + bd_re_level + ", bd_likecnt=" + bd_likecnt
			+ "]";
}

public Board () {}
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
public int getBd_ref() {
	return bd_ref;
}
public void setBd_ref(int bd_ref) {
	this.bd_ref = bd_ref;
}
public int getBd_re_step() {
	return bd_re_step;
}
public void setBd_re_step(int bd_re_step) {
	this.bd_re_step = bd_re_step;
}
public int getBd_re_level() {
	return bd_re_level;
}
public void setBd_re_level(int bd_re_level) {
	this.bd_re_level = bd_re_level;
}
public int getBd_likecnt() {
	return bd_likecnt;
}
public void setBd_likecnt(int bd_likecnt) {
	this.bd_likecnt = bd_likecnt;
}





}