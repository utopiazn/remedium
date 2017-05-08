package bean;

public class FAQBean {

	private String type; // 질문 종류
	private String subject; // 질문 제목
	private String content; // 질문 종류
	private String faqId;
	
	
	public String getType() {
		return type;
	}
	public String getSubject() {
		return subject;
	}
	public String getContent() {
		return content;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFaqId() {
		return faqId;
	}
	public void setFaqId(String faqId) {
		this.faqId = faqId;
	}
	
	
}
