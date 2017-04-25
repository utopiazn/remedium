package bean;

import java.sql.Date;

public class EventBean {
	private int no; // 이벤트 순서 번호
	private String name; // 이벤트 이름
	private String content; // 이벤트 내용
	private Date firstdate; // s이벤트 시작 날짜
	private Date lastdate; // 이벤트 종료 날짜
	private String image; // 이벤트 이미지
	
	public int getNo() {
		return no;
	}
	public String getName() {
		return name;
	}
	public String getContent() {
		return content;
	}
	public Date getFirstdate() {
		return firstdate;
	}
	public Date getLastdate() {
		return lastdate;
	}
	public String getImage() {
		return image;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setFirstdate(Date firstdate) {
		this.firstdate = firstdate;
	}
	public void setLastdate(Date lastdate) {
		this.lastdate = lastdate;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
}
