package threego.admin;

public class UserQNA {
	private int qna_no;
	private int user_no;
	private String qna_subject;
	private String qna_content;
	private String qna_pwd;
	private int qna_open;
	
	public UserQNA() {}
	
	public UserQNA(int qna_no, int user_no, String qna_subject, String qna_content, String qna_pwd, int qna_open) {
		super();
		this.qna_no = qna_no;
		this.user_no = user_no;
		this.qna_subject = qna_subject;
		this.qna_content = qna_content;
		this.qna_pwd = qna_pwd;
		this.qna_open = qna_open;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_pwd() {
		return qna_pwd;
	}
	public void setQna_pwd(String qna_pwd) {
		this.qna_pwd = qna_pwd;
	}
	public int getQna_open() {
		return qna_open;
	}
	public void setQna_open(int qna_open) {
		this.qna_open = qna_open;
	}
	
	
}
