package main;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import bean.RoomclassBean;
import util.ProjectUtil;



public class MainAction extends ActionSupport implements SessionAware {
	

	private List<RoomclassBean> list;
	
	
	
	private Map session;
	
	//사이트 메인 페이지
	public String main() throws Exception{
		
		
		//객실소개 이름 리스트 가져오기
		ProjectUtil rcs = new ProjectUtil(session);		
		rcs.roomClassSession();
		
		return SUCCESS;
	}
	
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}
	
}
