package admin;

import java.io.IOException;
import java.io.Reader;
import java.util.Date;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.EventBean;
import bean.RoomBean;

public class EventAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int currentPage;
	
	
	private int no;
	private String name;
	private String firstdate;
	private String lastdate;
	private String content;
	

	EventBean resultClass;
	EventBean paramClass;


	public EventAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	//관리자 이벤트 글 쓰기 폼
	public String insForm() throws Exception{
		
		
		
		return SUCCESS;
	}
	
	//관리자 이벤트 글 쓰기 
	public String execute() throws Exception{
		
		System.out.println("lllllll");
		
		paramClass = new EventBean();
		resultClass = new EventBean();
		
		
		System.out.println(getName());
		System.out.println(getFirstdate());
		System.out.println(getLastdate());
		System.out.println(getContent()); 		
		System.out.println(firstdate);
		System.out.println(lastdate);
		
		
		paramClass.setName(getName());
		paramClass.setFirstdate(java.sql.Date.valueOf(firstdate));
		paramClass.setLastdate(java.sql.Date.valueOf(lastdate));
		paramClass.setContent(getContent());
		
		
		if(paramClass != null){
			
			sqlMapper.insert("event.insertEvent", paramClass);
		}
		
		
		
		return SUCCESS;
	}
		

	//관리자 이벤트 글 수정 폼
	public String updForm() throws Exception{
		
		System.out.println("222222");

		paramClass = new EventBean();
		resultClass = new EventBean();
		
		System.out.println(getNo());
		paramClass.setNo(getNo());
		
		resultClass = (EventBean)sqlMapper.queryForObject("event.selectOne", paramClass);

		return SUCCESS;
	}	
	
	//관리자 이벤트 글 수정 처리
	public String update() throws Exception{
		
		/*paramClass = new EventBean();
		resultClass = new EventBean();
		
		paramClass.setName(getName());
		paramClass.setFirstdate(java.sql.Date.valueOf(firstdate));
		paramClass.setLastdate(java.sql.Date.valueOf(lastdate));
		paramClass.setContent(getContent());
		
		sqlMapper.update("event.updateEvent",paramClass);*/
		
		return SUCCESS;
	}
	
	//관리자 이벤트 글 삭제
	public String delete() throws Exception{
		
		return SUCCESS;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public String getLastdate() {
		return lastdate;
	}

	public void setLastdate(String lastdate) {
		this.lastdate = lastdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFirstdate() {
		return firstdate;
	}

	public void setFirstdate(String firstdate) {
		this.firstdate = firstdate;
	}

	public EventBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(EventBean resultClass) {
		this.resultClass = resultClass;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	


}
