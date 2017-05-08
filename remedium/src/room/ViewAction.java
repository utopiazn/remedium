package room;


import com.opensymphony.xwork2.ActionSupport;

import bean.RoomBean;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class ViewAction extends ActionSupport implements SessionAware {
	
	private Map session;
	
	private RoomBean paramClass = new RoomBean();
	private RoomBean resultClass = new RoomBean();
	
	private int num;
	private int no;
	private String firstDate;
	private String lastDate;
	private int people;
	private String classInfo;
	
	@Override
	//객실 개별 뷰
	public String execute() throws Exception {
		
		System.out.println("넘버"+ getNo());
		if(getNo()!=0){
			setNum(getNo());
		}
		resultClass = (RoomBean)util.ProjectUtil.sqlMapper.queryForObject("roomSQL.selectOne", getNum());	
		classInfo = util.ProjectUtil.getRoomClassInfo(resultClass.getRoom_class());
		
		return SUCCESS;
	}

	public RoomBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(RoomBean paramClass) {
		this.paramClass = paramClass;
	}

	public RoomBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(RoomBean resultClass) {
		this.resultClass = resultClass;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getFirstDate() {
		return firstDate;
	}

	public void setFirstDate(String firstDate) {
		this.firstDate = firstDate;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}
	
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}

	public String getClassInfo() {
		return classInfo;
	}

	public void setClassInfo(String classInfo) {
		this.classInfo = classInfo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	
	
}
