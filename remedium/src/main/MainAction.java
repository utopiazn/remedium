package main;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class MainAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	public MainAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	//사이트 메인 페이지
	public String main() throws Exception{
		
		return SUCCESS;
	}

}
