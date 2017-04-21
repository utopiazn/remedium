package board;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.BoardBean;
import bean.MemberBean;

public class WriteAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	
	private int no;
	private String subject;
	private String content;
	private int ref;
	private int re_step;
	private String type = "0";
	
	BoardBean resultClass;
	BoardBean paramClass;
	
	public WriteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	// 문의 사항 게시글 쓰기 폼
	public String form() throws Exception {	
		
		return SUCCESS;
		
	}

	// 문의 사항 게시글 쓰기 처리
	public String execute() throws Exception {
		
		paramClass = new BoardBean();
		resultClass = new BoardBean();
		
		paramClass.setNo(getNo());
		paramClass.setSubject(getSubject());
		paramClass.setContent(getContent());
		paramClass.setRef(getRef());
		paramClass.setRe_step(getRe_step());			
		paramClass.setType(getType());
		
		sqlMapper.queryForObject("insertBoard",paramClass);
		
		return SUCCESS;
		
	}

	public int getNo() {
		return no;
	}

	public String getSubject() {
		return subject;
	}

	public String getContent() {
		return content;
	}

	public int getRef() {
		return ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public String getType() {
		return type;
	}

	public BoardBean getResultClass() {
		return resultClass;
	}

	public BoardBean getParamClass() {
		return paramClass;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setResultClass(BoardBean resultClass) {
		this.resultClass = resultClass;
	}

	public void setParamClass(BoardBean paramClass) {
		this.paramClass = paramClass;
	}



	
	
	
	
}
