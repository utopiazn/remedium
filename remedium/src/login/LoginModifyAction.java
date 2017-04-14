package login;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class LoginModifyAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public LoginModifyAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	//마이페이지 회원 수정 폼
	public String modifyForm() throws Exception {
		return SUCCESS;
	}
	
	//관리자 회원 수정 처리
	public String admin() throws Exception {
		return SUCCESS;
	}
	
	//마이페이지 회원 수정 처리
	public String execute() throws Exception {
		return SUCCESS;
	}
}
