package admin;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.FAQBean;
import org.apache.struts2.interceptor.SessionAware;
public class FaqAction extends ActionSupport implements SessionAware {
	
	private Map session;
	
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
		
		resultClass = paramClass;
		
		return SUCCESS;
	}
	
	//관리자 글 삭제
	public String delete() throws Exception{
		paramClass = new FAQBean();
		
		paramClass.setFaqId(getFaqId());
		
		sqlMapper.delete("faq.deleteFaq",paramClass);
		
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

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
	
	
}
