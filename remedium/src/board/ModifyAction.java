package board;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.BoardBean;

public class ModifyAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int no;
	
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
	
	
}
