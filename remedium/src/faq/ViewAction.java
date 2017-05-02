package faq;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.FAQBean;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;


public class ViewAction extends ActionSupport implements SessionAware {
	
	private Map session;
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private String faqId;
	
	FAQBean paramClass;
	FAQBean resultClass;

	
	public ViewAction() throws IOException {		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); 
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	
		reader.close();
	}
	
	//자주묻는 질문 상세보기
	public String execute() throws Exception{
		
		paramClass = new FAQBean();
		resultClass = new FAQBean();
		
		//System.out.println(getFaqId());
		
		paramClass.setFaqId(getFaqId());
		
		resultClass = (FAQBean) sqlMapper.queryForObject("faq.selectOne",getFaqId());
			
		
		return SUCCESS;
	}

	public String getFaqId() {
		return faqId;
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

	public void setParamClass(FAQBean paramClass) {
		this.paramClass = paramClass;
	}

	public void setResultClass(FAQBean resultClass) {
		this.resultClass = resultClass;
	}
	
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}

	
}
