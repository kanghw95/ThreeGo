package threego.admin;

public class QNA_USER {
	private int qna_no;
	private int user_no;
	private String nickname;
	private String a_content;
	
	public QNA_USER() {}
	
	public QNA_USER(int qna_no, int user_no, String nickname, String a_content) {
		super();
		this.qna_no = qna_no;
		this.user_no = user_no;
		this.nickname = nickname;
		this.a_content = a_content;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	
	
}
