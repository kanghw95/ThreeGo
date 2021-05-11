package threego.admin;

public class Admin {
	private int admin_number;
	private String admin_name;
	private String admin_id;
	private String admin_pwd;
	
	public Admin() {}

	

	public Admin(int admin_number, String admin_name, String admin_id, String admin_pwd) {
		super();
		this.admin_number = admin_number;
		this.admin_name = admin_name;
		this.admin_id = admin_id;
		this.admin_pwd = admin_pwd;
	}



	public int getAdmin_number() {
		return admin_number;
	}


	public void setAdmin_number(int admin_number) {
		this.admin_number = admin_number;
	}


	public String getAdmin_name() {
		return admin_name;
	}


	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}


	public String getAdmin_id() {
		return admin_id;
	}


	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}


	public String getAdmin_pwd() {
		return admin_pwd;
	}


	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}


	
	
	
}
