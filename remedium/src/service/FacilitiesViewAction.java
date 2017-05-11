package service;

import com.opensymphony.xwork2.ActionSupport;

import bean.FacilitiesBean;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;


public class FacilitiesViewAction extends ActionSupport implements SessionAware {
	
	private Map session;
	
	private FacilitiesBean paramClass;
	private FacilitiesBean resultClass;
	
	private int no;

	//편의시설의 상세보기
	public String execute() throws Exception {
		
		paramClass = new FacilitiesBean();
		resultClass = new FacilitiesBean();
		
		paramClass.setNo(getNo());
		
		resultClass = (FacilitiesBean)util.ProjectUtil.sqlMapper.queryForObject("facilitiesSQL.selectOne", paramClass);
		
		return SUCCESS;
	}

	public FacilitiesBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(FacilitiesBean paramClass) {
		this.paramClass = paramClass;
	}

	public FacilitiesBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(FacilitiesBean resultClass) {
		this.resultClass = resultClass;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}
	
	
}
