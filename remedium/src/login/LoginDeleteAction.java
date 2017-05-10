package login;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class LoginDeleteAction extends ActionSupport implements SessionAware {
	
	private Map session;
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private String memberID;

	
	private MemberBean paramClass;
	private MemberBean resultClass;
	
	
	public LoginDeleteAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	//회원 탈퇴 처리
	public String execute() throws Exception{
		
		paramClass = new MemberBean();
		
		paramClass.setMemberID(getMemberID());
		
		sqlMapper.delete("member.deleteMember",paramClass);
		return SUCCESS;
	}
	
	//회원 탈퇴 폼
	public String delete() throws Exception{
		
	 paramClass = new MemberBean();
	 resultClass = new MemberBean();
	 
	 paramClass.setMemberID(getMemberID());
	 
	 resultClass = (MemberBean) sqlMapper.queryForObject("member.selectOne",paramClass);

		return SUCCESS;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public MemberBean getParamClass() {
		return paramClass;
	}
	public void setParamClass(MemberBean paramClass) {
		this.paramClass = paramClass;
	}
	public MemberBean getResultClass() {
		return resultClass;
	}
	public void setResultClass(MemberBean resultClass) {
		this.resultClass = resultClass;
	}
		
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}
	

}

