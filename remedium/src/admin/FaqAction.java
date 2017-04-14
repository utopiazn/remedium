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
	
	public String insForm() throws Exception{
		
		return SUCCESS;
	}
	
	public String execute() throws Exception{
		
		return SUCCESS;
	}
	
	public String updForm() throws Exception{
		
		return SUCCESS;
	}
	
	public String update() throws Exception{
		
		return SUCCESS;
	}
	
	public String delete() throws Exception{
		
		return SUCCESS;
	}

}
