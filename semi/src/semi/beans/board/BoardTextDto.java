
package semi.beans.board;

public class BoardTextDto {
	int no;	// boardTxt 글번호
	int board_no; // 메인상세글 글번호

	String writer, sub_title, text_content, udate, ip_addr;
	
	
	
	@Override
	public String toString() {
		return "BoardTextDto [no=" + no + ", board_no=" + board_no + ", writer=" + writer + ", sub_title=" + sub_title
				+ ", text_content=" + text_content + ", udate=" + udate + ", ip_addr=" + ip_addr + ", file_no="
				+ file_no + ", text_no=" + text_no + ", uploadname=" + uploadname + ", savename=" + savename
				+ ", filetype=" + filetype + ", filesize=" + filesize + "]";
	}

	// 파일등록을 위한 변수
	private int file_no; //파일 no
	private int text_no; // 목차(sub_title) no
	private String uploadname, savename, filetype;
	private long filesize;

//	목차추가 생성자
	public BoardTextDto(int no, int board_no, String writer, String sub_title, String text_content, String udate, String ip_addr) {

		super();
		this.no = no;
		this.board_no = board_no;
		this.writer = writer;
		this.sub_title = sub_title;
		this.text_content = text_content;
		this.udate = udate;
		this.ip_addr = ip_addr;
	}

	public BoardTextDto() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getSub_title() {
		return sub_title;
	}

	public void setSub_title(String sub_title) {
		this.sub_title = sub_title;
	}

	public String getText_content() {
		return text_content;
	}

	public void setText_content(String text_content) {
		this.text_content = text_content;
	}

	public String getUdate() {
		return udate;
	}

	public void setUdate(String udate) {
		this.udate = udate;
	}

	public String getIp_addr() {
		return ip_addr;
	}

	public void setIp_addr(String ip_addr) {
		this.ip_addr = ip_addr;
	}

	
//	파일 생성자	
	public BoardTextDto(int file_no, int text_no, String uploadname, String savename, String filetype, int filesize) {
		super();
		this.file_no = file_no;
		this.text_no = text_no;
		this.uploadname = uploadname;
		this.savename = savename;
		this.filetype = filetype;
		this.filesize = filesize;
	}

	public int getFile_no() {
		return file_no;
	}

	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}

	public int getText_no() {
		return text_no;
	}

	public void setText_no(int text_no) {
		this.text_no = text_no;
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

	
}
