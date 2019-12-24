package semi.beans.ba_board;

public class BA_FileDto {
	private int no;
	private int origin;
	private String uploadname;
	private String savename;
	private String filetype;
	private long filesize;
	private String title_key;
	
	public BA_FileDto() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getOrigin() {
		return origin;
	}

	public void setOrigin(int origin) {
		this.origin = origin;
	}

	public String getUploadname() {
		return uploadname;
	}

	public void setUploadname(String uploadname) {
		this.uploadname = uploadname;
	}

	public String getSavename() {
		return savename;
	}

	public void setSavename(String savename) {
		this.savename = savename;
	}

	public String getFiletype() {
		return filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	public String getTitle_key() {
		return title_key;
	}

	public void setTitle_key(String title_key) {
		this.title_key = title_key;
	}
	
	

}
