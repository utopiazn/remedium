package login;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;

public class LoginDeleteAction extends ActionSupport{
	
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
	//회원 탈퇴
	public String execute() throws Exception{
		
		paramClass = new MemberBean();
		
		paramClass.setMemberID(getMemberID());
		
		System.out.println(memberID);
		
		sqlMapper.delete("member.deleteMember",paramClass);
		return SUCCESS;
	}
	
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
	
	
	
	

}

