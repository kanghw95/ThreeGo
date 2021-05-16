package threego.model.vo;

public class Review {
	private int parking_code;
	private int user_no;
	private int grade;
	private int simple_rv_no;
	private String nickname;
	private String s_contents;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public int getParking_code() {
		return parking_code;
	}
	public void setSimple_rv_no(int simple_rv_no) {
		this.simple_rv_no = simple_rv_no;
	}
	public int getSimple_rv_no() {
		return simple_rv_no;
	}
	public void setParking_code(int parking_code) {
		this.parking_code = parking_code;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getS_contents() {
		return s_contents;
	}
	public void setS_contents(String s_contents) {
		this.s_contents = s_contents;
	}
}
