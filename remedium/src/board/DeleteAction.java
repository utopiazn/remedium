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

public class DeleteAction extends ActionSupport  implements SessionAware {
	
	private Map session;
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int no;
	private int ref;
	private int re_step;
	 
	BoardBean paramClass;
	BoardBean resultClass;
	
	public DeleteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	// 문의사항 게시판 삭제 처리 
	public String execute() throws Exception {
		
		paramClass = new BoardBean();
		resultClass = new BoardBean();
		
		paramClass.setNo(getNo());
		paramClass.setRef(getRef());
		paramClass.setRe_step(getRe_step());
		
		System.out.println(getRe_step());
		
		if(re_step != 0){
			sqlMapper.delete("board.deleteReply",paramClass);
		}
		else{
			sqlMapper.delete("board.deleteBoard",paramClass);
		}
		
		
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
	

	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}
	
	
	
}	
