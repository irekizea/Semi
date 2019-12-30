package semi.beans.board;

public class HistoryDto {

	private int no;
	private int board_no;
	private String writer;
	private String boardtitle;
	private String boardtextudate;
	private String content;
	private String ip_addr;
	private int rn;
	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public HistoryDto() {
		super();
	}

	@Override
	public String toString() {
		return "HistoryDto [no=" + no + ", board_no=" + board_no + ", writer=" + writer + ", boardtitle="
				+ boardtitle + ", boardtextudate=" + boardtextudate + ", content=" + content + ", ip_addr=" + ip_addr
				+ "]";
	}

	public HistoryDto(int no, int board_no, String writer, String boardtitle, String boardtextudate, String content, String ip_addr) {
		super();
		this.no = no;
		this.board_no = board_no;
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

	public int getboard_no() {
		return board_no;
	}

	public void setboard_no(int board_no) {
		this.board_no = board_no;
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

	public HistoryDto(int no, int board_no, String writer, String boardtitle, String boardtextudate, String content,
			String ip_addr, int rn) {
		super();
		this.no = no;
		this.board_no = board_no;
		this.writer = writer;
		this.boardtitle = boardtitle;
		this.boardtextudate = boardtextudate;
		this.content = content;
		this.ip_addr = ip_addr;
		this.rn = rn;
	}
	
	
	
}
