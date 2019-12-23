package semi.beans.board;

public class BoardTextDto {
	int no;	// boardTxt 글번호
	int board_no; // 메인상세글 글번호
	String writer, sub_title, content, udate;
	String ip_addr;
	
	@Override
	public String toString() {
		return "BoardTextDto [no=" + no + ", board_no=" + board_no + ", writer=" + writer + ", sub_title=" + sub_title
				+ ", content=" + content + ", udate=" + udate + ", ip_addr=" + ip_addr + "]";
	}
	
	public BoardTextDto(int no, int board_no, String writer, String sub_title, String content, String udate, String ip_addr) {
		super();
		this.no = no;
		this.board_no = board_no;
		this.writer = writer;
		this.sub_title = sub_title;
		this.content = content;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
	
}
