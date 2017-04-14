package login;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	public LoginAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	// 로그인에 대한 처리
	public String execute() throws Exception {

		return SUCCESS;
	}

	// 로그인 ID,Pw 입력 폼
	public String form() throws Exception {

		return SUCCESS;
	}

	// 로그아웃에 대한 처리
	public String logout() throws Exception {

		return SUCCESS;
	}

	// 아이디 찾기 폼
	public String findIdForm() throws Exception {

		return SUCCESS;
	}

	// 아이디 찾기 처리
	public String findId() throws Exception {

		return SUCCESS;
	}

	// 비밀번호 찾기 폼
	public String findPwForm() throws Exception {

		return SUCCESS;

	}

	// 비밀번호 찾기 처리
	public String findPw() throws Exception {

		return SUCCESS;
	}
}
