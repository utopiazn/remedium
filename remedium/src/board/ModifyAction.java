package board;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.BoardBean;
import bean.MemberBean;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class ModifyAction extends ActionSupport implements SessionAware {
	
	private Map session;
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int no;
	
	private String subject;
	private String content;
	private String name;
	
	BoardBean paramClass;
	BoardBean resultClass;
	
	public ModifyAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception {
		
		paramClass = new BoardBean();
		resultClass = new BoardBean();
		
		paramClass.setNo(getNo());
		
		System.out.println("ID : "+paramClass.getNo());
		
		resultClass = (BoardBean) sqlMapper.queryForObject("board.selectOne",paramClass);
		
		return SUCCESS;
	}
	
	// 문의사항 게시판 수정 처리
	public String execute() throws Exception {
		
		paramClass = new BoardBean();
		
		paramClass.setNo(getNo());
		paramClass.setSubject(getSubject());
		paramClass.setName(getName());
		paramClass.setContent(getContent());
		
		sqlMapper.update("board.updateBoard",paramClass);
		
		resultClass = (BoardBean) paramClass;
		
		return SUCCESS;
	}

	public int getNo() {
		return no;
	}

	public BoardBean getParamClass() {
		return paramClass;
	}

	public BoardBean getResultClass() {
		return resultClass;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setParamClass(BoardBean paramClass) {
		this.paramClass = paramClass;
	}

	public void setResultClass(BoardBean resultClass) {
		this.resultClass = resultClass;
	}

	public String getSubject() {
		return subject;
	}

	public String getContent() {
		return content;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}

	
}
