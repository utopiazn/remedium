package admin;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.EventBean;

public class EventAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int currentPage;
	
	private int no;
	private String name;
	private String content;
	private int ref;
	private int re_step;
	private String type;

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
		
		paramClass = new EventBean();
		resultClass = new EventBean();
		
		paramClass.setName(getName());
		paramClass.setContent(getContent());
		paramClass.setNo(resultClass.getNo());
		
		
		return SUCCESS;
	}
		
	//관리자 이벤트 글 수정 폼
	public String updForm() throws Exception{
		
		return SUCCESS;
	}	
	
	//관리자 이벤트 글 수정 처리
	public String update() throws Exception{
		
		
		
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

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}


}
