package semi.beans.block.mem;

public class BlockMemberDto {
	
	private String b_id;
	private String bdate;
	private String badmin;
	private String breason;
	private String b_ip;
	
	public String getB_ip() {
		return b_ip;
	}

	public void setB_ip(String b_ip) {
		this.b_ip = b_ip;
	}

	public BlockMemberDto() {
		super();
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	
	public String getBadmin() {
		return badmin;
	}

	public void setBadmin(String badmin) {
		this.badmin = badmin;
	}

	public String getBreason() {
		return breason;
	}

	public void setBreason(String breason) {
		this.breason = breason;
	}
	

}
