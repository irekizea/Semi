package semi.beans.board;

public class BoardDto {
	private int no, searchCount;
	private String writer, title, content, wdate, udate;
	private boolean editCheck;	// 승인된 최초글(수정이전), 수정된글인지 판단할 변수
	private int rn; 	// 검색어순위  rn
	
	
	public BoardDto(int no, int searchCount, String writer, String title, String content, String wdate, String udate, boolean editCheck, int rn) {
		super();
		this.no = no;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.udate = udate;
		this.searchCount = searchCount;
		this.editCheck = editCheck;
		this.rn = rn;
	}

	public BoardDto() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public int getSearchCount() {
		return searchCount;
	}

	public void setSearchCount(int searchCount) {
		this.searchCount = searchCount;
	}

	public boolean getEditCheck() {
		return editCheck;
	}

	public void setEditCheck(Boolean editCheck) {
		this.editCheck = editCheck;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}
	
	
}
