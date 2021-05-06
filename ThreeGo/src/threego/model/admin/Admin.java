package threego.model.admin;

public class Admin {
	private int yh_no;
	private String yh_name;
	private String yh_id;
	private String yh_passwd;
	
	
	public Admin() {}


	public Admin(int yh_no, String yh_name, String yh_id, String yh_passwd) {
		super();
		this.yh_no = yh_no;
		this.yh_name = yh_name;
		this.yh_id = yh_id;
		this.yh_passwd = yh_passwd;
	}


	public int getYh_no() {
		return yh_no;
	}


	public void setYh_no(int yh_no) {
		this.yh_no = yh_no;
	}


	public String getYh_name() {
		return yh_name;
	}


	public void setYh_name(String yh_name) {
		this.yh_name = yh_name;
	}


	public String getYh_id() {
		return yh_id;
	}


	public void setYh_id(String yh_id) {
		this.yh_id = yh_id;
	}


	public String getYh_passwd() {
		return yh_passwd;
	}


	public void setYh_passwd(String yh_passwd) {
		this.yh_passwd = yh_passwd;
	};
	
	
	
}
