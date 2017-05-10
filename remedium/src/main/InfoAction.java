package main;

import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class InfoAction extends ActionSupport   implements SessionAware {
	
	private Map session;

	//호텔 정보 카테고리 이동
	public String execute() throws Exception{
		
		return SUCCESS;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}



}
