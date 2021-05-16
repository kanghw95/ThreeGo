package threego.model.vo;

public class BoardLike {
	private int bd_content_no;
	private int user_no;
	private int likecheck;
	
	
	public BoardLike() {}
	
	
	public BoardLike(int bd_content_no, int user_no, int likecheck) {
		super();
		this.bd_content_no = bd_content_no;
		this.user_no = user_no;
		this.likecheck = likecheck;
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
	public int getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}
	
	
	
	
}
