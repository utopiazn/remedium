package login;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	
	
	//로그인에 대한 처리
	public String execute() throws Exception{
	
		return SUCCESS;
	}
	
	//로그인 ID,Pw 입력 폼
	public String form() throws Exception{
		
		return SUCCESS;
	}
	
	//로그아웃에 대한 처리	
	public String logout() throws Exception{
		
		return SUCCESS;
	}
	
	//아이디 찾기 폼	
	public String findIdForm() throws Exception{
		
		return SUCCESS;
	}
	
	//아이디 찾기 처리
	public String findId() throws Exception{
		
		return SUCCESS;
	}
	
	//비밀번호 찾기 폼
	public String findPwForm() throws Exception{
		
		return SUCCESS;
		
	}
	
	//비밀번호 찾기 처리
	public String findPw() throws Exception{
		
		return SUCCESS;
	}
}
