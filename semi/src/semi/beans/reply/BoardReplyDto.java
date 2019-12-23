package semi.beans.reply;


public class BoardReplyDto {
	private int board_no;
	private String writer;
	private String title;
	private String content;
	private String wdate;
	private String udate;
	private String ip;
	public BoardReplyDto(int board_no, String writer, String title, String content, String wdate, String udate,
			String ip) {
		super();
		this.board_no = board_no;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.udate = udate;
		this.ip = ip;
	}
	public BoardReplyDto() {
		super();
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getUdate() {
		return udate;
	}
	public void setUdate(String udate) {
		this.udate = udate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
	
	
	
	
}
