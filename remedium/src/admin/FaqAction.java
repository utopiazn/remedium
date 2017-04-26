package admin;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.FAQBean;

public class FaqAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private String faqId;
	private String type;
	private String content;
	private String subject;
	
	FAQBean paramClass;
	FAQBean resultClass;

	public FaqAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	//관리자 글쓰기 폼
	public String insForm() throws Exception{
		
		
		return SUCCESS;
	}
	
	//관리자 글쓰기	
	public String execute() throws Exception{
		
		paramClass = new FAQBean();
		resultClass = new FAQBean();
		
		paramClass.setContent(getContent());
		paramClass.setFaqId(getFaqId());
		paramClass.setSubject(getSubject());
		paramClass.setType(getType());
		
		sqlMapper.insert("faq.insertFaq",paramClass);
		
		resultClass = (FAQBean) paramClass;
		
		return SUCCESS;
	}
	
	//관리자 수정폼	
	public String updForm() throws Exception{
		paramClass = new FAQBean();
		resultClass = new FAQBean();
		
		paramClass.setFaqId(getFaqId());
		
		resultClass = (FAQBean) sqlMapper.queryForObject("faq.selectOne",paramClass);
		
		
		/*String Q = resultClass.getSubject();
		
		Q = Q.replace("Q. ", "");
		
		resultClass.setSubject(Q);*/
		return SUCCESS;
	}
	
	//관리자 글 수정 처리	
	public String update() throws Exception{
		paramClass = new FAQBean();
		resultClass = new FAQBean();
		
		paramClass.setContent(getContent());
		paramClass.setFaqId(getFaqId());
	/*	String Q = getSubject();
		
		Q = Q.replace("Q. ", "");*/
		
		paramClass.setSubject(getSubject());
		paramClass.setType(getType());
		
		sqlMapper.update("faq.updateFaq",paramClass);
		
		
		return SUCCESS;
	}
	
	//관리자 글 삭제
	public String delete() throws Exception{
		
		
		
		return SUCCESS;
	}

	public String getFaqId() {
		return faqId;
	}

	public String getType() {
		return type;
	}

	public String getContent() {
		return content;
	}

	public String getSubject() {
		return subject;
	}

	public FAQBean getParamClass() {
		return paramClass;
	}

	public FAQBean getResultClass() {
		return resultClass;
	}

	public void setFaqId(String faqId) {
		this.faqId = faqId;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setParamClass(FAQBean paramClass) {
		this.paramClass = paramClass;
	}

	public void setResultClass(FAQBean resultClass) {
		this.resultClass = resultClass;
	}
	
	
}
