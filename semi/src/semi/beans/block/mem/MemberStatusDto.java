package semi.beans.block.mem;

public class MemberStatusDto {
	private String id;
	private String email;
	private String grade;
	private String reason;
	public MemberStatusDto() {
		super();
	}
	@Override
	public String toString() {
		return "MemberStatusDto [id=" + id + ", email=" + email + ", grade=" + grade + ", reason=" + reason + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	//추가 getter : 차단된 회원인지 아닌지 확인하는 메소드
	public boolean isBlocked() {
		return this.reason != null;
	}
}
