package admin.member;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;

public class AdminDeleteAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private String memberID;
	
	MemberBean paramClass;
	MemberBean resultClass;

	public AdminDeleteAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	//회원 탈퇴
	public String execute() throws Exception{
		
		paramClass = new MemberBean();
		resultClass = new MemberBean();
		
		paramClass.setMemberID(getMemberID());
		
		sqlMapper.delete("member.deleteMember", paramClass);
				
		return SUCCESS;
	}
	
	public String getMemberID() {
		return memberID;
	}
	public MemberBean getParamClass() {
		return paramClass;
	}
	public MemberBean getResultClass() {
		return resultClass;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public void setParamClass(MemberBean paramClass) {
		this.paramClass = paramClass;
	}
	public void setResultClass(MemberBean resultClass) {
		this.resultClass = resultClass;
	}
	
	
	
}

