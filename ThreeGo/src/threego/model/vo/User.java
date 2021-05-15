package threego.model.vo;

import java.sql.Timestamp;

public class User {
	private int user_no; // 회원 번호
	private String user_id; // 회원 아이디
	private String user_pwd; // 회원 패스워드
	private String user_name; // 회원 이름
	private String nickname; // 닉네임
	private String address; // 주소
	private String last_login; // 마지막 로그인 시간
	private String phone; // 전화번호
	private String email; // 이메일
	private char gender; // 성별
	private String birth; // 생년월일
	private int user_authority; // 회원자격
	
	public User() {
		
	}
	
	public User(int user_no, String user_id, String user_pwd, String user_name, String nickname, String address,
			String last_login, String phone, String email, char gender, String birth, int user_authority) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.nickname = nickname;
		this.address = address;
		this.last_login = last_login;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.birth = birth;
		this.user_authority = user_authority;
	}

	@Override
	public String toString() {
		return "User [user_no=" + user_no + ", user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_name="
				+ user_name + ", nickname=" + nickname + ", address=" + address + ", last_login=" + last_login
				+ ", phone=" + phone + ", email=" + email + ", gender=" + gender + ", birth=" + birth
				+ ", user_authority=" + user_authority + "]";
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLast_login() {
		return last_login;
	}

	public void setLast_login(String last_login) {
		this.last_login = last_login;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getUser_authority() {
		return user_authority;
	}

	public void setUser_authority(int user_authority) {
		this.user_authority = user_authority;
	}

}
