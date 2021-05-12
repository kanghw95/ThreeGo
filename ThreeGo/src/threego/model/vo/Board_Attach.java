package threego.model.vo;

public class Board_Attach {
	
	private int file_no ;
	private int bd_content_no;
	private String fullname;
	private String contents_type;
	private String filepath;
	@Override
	public String toString() {
		return "Board_Attach [file_no=" + file_no + ", bd_content_no=" + bd_content_no + ", fullname=" + fullname
			 + ", contents_type=" + contents_type + ", filepath=" + filepath + "]";
	}
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public int getBd_content_no() {
		return bd_content_no;
	}
	public void setBd_content_no(int bd_content_no) {
		this.bd_content_no = bd_content_no;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getContents_type() {
		return contents_type;
	}
	public void setContents_type(String contents_type) {
		this.contents_type = contents_type;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	

}
