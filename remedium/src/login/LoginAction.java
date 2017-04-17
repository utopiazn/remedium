package login;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.struts2.interceptor.SessionAware;

import bean.MemberBean;

public class LoginAction extends ActionSupport implements SessionAware {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private MemberBean paramClass;
	private MemberBean resultClass;
	
	private Map session;
	
	private String memberId;
	private String memberPasswd;

	public LoginAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	// 로그인 ID,Pw 입력 폼
	public String form() throws Exception {
		
		return SUCCESS;
	}
	
	// 로그인에 대한 처리
	public String execute() throws Exception {
		
		paramClass = new MemberBean();
		resultClass = new MemberBean();
		
		paramClass.setMemberID(getMemberId());
		paramClass.setMemberPassword(getMemberPasswd());
		
		System.out.println(memberId);
		System.out.println(memberPasswd);
		
		resultClass = (MemberBean)sqlMapper.queryForObject("member.selectPassword", paramClass);
		
		if(resultClass != null){
			System.out.println( "resultClass.getMemberID() : " + resultClass.getMemberID());
			session.put("memberId", resultClass.getMemberID()); 
			session.put("memberPasswd", resultClass.getMemberPassword());
			
			return SUCCESS;
		}
		return ERROR;
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

	public MemberBean getParamClass() {
		return paramClass;
	}

	public MemberBean getResultClass() {
		return resultClass;
	}

	public void setParamClass(MemberBean paramClass) {
		this.paramClass = paramClass;
	}

	public void setResultClass(MemberBean resultClass) {
		this.resultClass = resultClass;
	}

	public String getMemberId() {
		return memberId;
	}

	public String getMemberPasswd() {
		return memberPasswd;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public void setMemberPasswd(String memberPasswd) {
		this.memberPasswd = memberPasswd;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	

	
	
}
