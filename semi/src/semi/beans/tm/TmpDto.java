package semi.beans.tm;

public class TmpDto {
	private int no, Baorigin;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBaorigin() {
		return Baorigin;
	}
	public void setBaorigin(int baorigin) {
		this.Baorigin = baorigin;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWip() {
		return wip;
	}
	public void setWip(String wip) {
		this.wip = wip;
	}
	public String getRpcontent() {
		return rpcontent;
	}
	public void setRpcontent(String rpcontent) {
		this.rpcontent = rpcontent;
	}
	private String wdate, writer, wip, rpcontent;
	public TmpDto(int no, int baorigin, String wdate, String writer, String wip, String rpcontent) {
		super();
		this.no = no;
		this.Baorigin = baorigin;
		this.wdate = wdate;
		this.writer = writer;
		this.wip = wip;
		this.rpcontent = rpcontent;
	}
	public TmpDto() {
		super();
	}
	
}
