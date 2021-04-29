package first.member.model.vo;

import java.sql.Date;

public class Member {
	private static final long serialVersionUID = 1L;
	private String id;
	private String passwd;
	private String name;
	private String email;
	private String grade;
	private char gender;
	private Date regdate;
	
	public Member() {}


	public Member(String id, String passwd, String name, String email, String grade, char gender, Date regdate) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.grade = grade;
		this.gender = gender;
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "Member [id=" + id + ", passwd=" + passwd + ", name=" + name + ", email=" + email + ", grade=" + grade
				+ ", gender=" + gender + ", regdate=" + regdate + "]";
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

}
