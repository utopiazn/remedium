package board;

import java.io.IOException;
import java.io.Reader;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class WriteAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
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
		
		return SUCCESS;
		
	}
}
