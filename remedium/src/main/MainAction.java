package main;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import bean.RoomclassBean;
import util.ProjectUtil;


public class MainAction extends ActionSupport implements SessionAware{
	
	private List<RoomclassBean> list;
	
	private Map session;
	
	//사이트 메인 페이지
	public String main() throws Exception{
		
		list = new ArrayList<RoomclassBean>();
		
		list = util.ProjectUtil.sqlMapper.queryForList("roomclassSQL.selectAll");
		System.out.println(list.size());
		session.put("RClist", list);
		
		
		return SUCCESS;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

}
