package semi.beans.board;

public class BoardReplyDto {
	int rn, reply_no;
	String board_title, writer, ip, content, wdate;
	
	
	public BoardReplyDto(int rn, int reply_no, String board_title, String writer, String ip, String content, String wdate) {
		super();
		this.rn = rn;
		this.reply_no = reply_no;
		this.board_title = board_title;
		this.ip = ip;
		this.writer = writer;
		this.content = content;
		this.wdate = wdate;
	}

	public BoardReplyDto() {
		super();
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
}