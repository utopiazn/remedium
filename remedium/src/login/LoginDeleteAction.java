package login;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class LoginDeleteAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	public LoginDeleteAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	//회원 정보 삭제
	public String execute() throws Exception{
		
		return SUCCESS;
	}
	
	//회원 탈퇴
	
	public String execute2() throws Exception{
		
		return SUCCESS;
	}

}

