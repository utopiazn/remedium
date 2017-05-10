package service;



import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.EventBean;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;


public class EventViewAction extends ActionSupport implements SessionAware {
	
	private Map session;

	
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체	

	private int currentPage;
	
	private int no;
	private String name;
	private String content;


	EventBean resultClass;
	EventBean paramClass;
	
	
	//생성자
	public EventViewAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정 내용을 가져온다
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);  //sqlMapConfig.xml 내용을 적용한 sqlMapper 객체 생성
		
		reader.close();
	}

	//이벤트의 상세보기
	@Override
	public String execute() throws Exception {
		paramClass = new EventBean();
		
		paramClass.setNo(getNo());
	
		resultClass = (EventBean) sqlMapper.queryForObject("event.selectOne", paramClass);

		
		return SUCCESS;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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


	public EventBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(EventBean resultClass) {
		this.resultClass = resultClass;
	}

	public EventBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(EventBean paramClass) {
		this.paramClass = paramClass;
	}
	
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}
	

}
