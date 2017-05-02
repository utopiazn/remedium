package board;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.BoardBean;


import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;


public class ViewAction extends ActionSupport  implements SessionAware {
	
	private Map session;
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int no;
	private int currentPage;
	private int ref;
	
	BoardBean paramClass;
	BoardBean resultClass;
	
	
	
	public ViewAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	// 문의사항 게시판 상세보기
	public String execute() throws Exception {
		
		paramClass = new BoardBean();
		resultClass = new BoardBean();
		
		paramClass.setNo(getNo());
		paramClass.setRef(getRef());
		
		System.out.println("ID : "+paramClass.getNo());
		
		resultClass = (BoardBean) sqlMapper.queryForObject("board.selectOne",paramClass);
		
		return SUCCESS;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public BoardBean getParamClass() {
		return paramClass;
	}

	public BoardBean getResultClass() {
		return resultClass;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setParamClass(BoardBean paramClass) {
		this.paramClass = paramClass;
	}

	public void setResultClass(BoardBean resultClass) {
		this.resultClass = resultClass;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}
	
}	
