package main;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class InfoAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	public InfoAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	//호텔 정보 카테고리 이동
	public String execute() throws Exception{
		
		return SUCCESS;
	}

}
