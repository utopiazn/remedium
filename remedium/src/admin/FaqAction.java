package admin;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class FaqAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	public FaqAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	//관리자 글쓰기 폼
	public String insForm() throws Exception{
		
		return SUCCESS;
	}
	
	//관리자 글쓰기	
	public String execute() throws Exception{
		
		return SUCCESS;
	}
	
	//관리자 수정폼	
	public String updForm() throws Exception{
		
		return SUCCESS;
	}
	
	//관리자 글 수정 처리	
	public String update() throws Exception{
		
		return SUCCESS;
	}
	
	//관리자 글 삭제
	public String delete() throws Exception{
		
		return SUCCESS;
	}

}
