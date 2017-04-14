package bean;

import java.sql.Date;

public class BoardBean {

	private int no; 	//글 번호
	private String subject; 	//제목
	private String memberID; 	//회원 ID
	private String name; 	//작성자
	private String content; 	//글 내용
	private String ref; 	//글 구분
	private String re_step; 	//글 답변
	private Date regdate; 	//등록날짜
	private String type; 	//답변상태
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public String getRe_step() {
		return re_step;
	}
	public void setRe_step(String re_step) {
		this.re_step = re_step;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	
	

}
