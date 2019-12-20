package semi.beans.board;

public class HistoryDto {

	private int no;
	private int board_text_no;
	private String writer;
	private String boardtitle;
	private String boardtextudate;
	private String content;
	private String ip_addr;
	
	public HistoryDto() {
		super();
	}

	public HistoryDto(int no, int board_text_no, String writer, String boardtitle, String boardtextudate, String content, String ip_addr) {
		super();
		this.no = no;
		this.board_text_no = board_text_no;
		this.writer = writer;
		this.boardtitle = boardtitle;
		this.boardtextudate = boardtextudate;
		this.content=content;
		this.ip_addr=ip_addr;
	}
	public void setIp_addr(String ip_addr) {
		this.ip_addr=ip_addr;
	}
	
	public String getIp_addr() {
		return ip_addr;
	}
	
	public void setContent(String content) {
		this.content=content;
	}
	
	public String getContent() {
		return content;
	}

	public int getNo() {
		return no;
	}
		
	public void setNo(int no) {
		this.no = no;
	}

	public int getBoard_text_no() {
		return board_text_no;
	}

	public void setBoard_text_no(int board_text_no) {
		this.board_text_no = board_text_no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getBoardtitle() {
		return boardtitle;
	}

	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}

	public String getBoardtextudate() {
		return boardtextudate;
	}

	public void setBoardtextudate(String boardtextudate) {
		this.boardtextudate = boardtextudate;
	}
	
	
	
}
