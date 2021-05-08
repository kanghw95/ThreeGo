package threego.admin;


public class FAQ {
	private int faq_no;
	private String faq_subject;
	private String faq_content;
	private int admin_number;
	
	
	public FAQ() {}
	
	
	public FAQ(int faq_no, String faq_subject, String faq_content, int admin_number) {
		super();
		this.faq_no = faq_no;
		this.faq_subject = faq_subject;
		this.faq_content = faq_content;
		this.admin_number = admin_number;
	}
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public String getFaq_subject() {
		return faq_subject;
	}
	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public int getAdmin_number() {
		return admin_number;
	}
	public void setAdmin_number(int admin_number) {
		this.admin_number = admin_number;
	}
	
	
}
