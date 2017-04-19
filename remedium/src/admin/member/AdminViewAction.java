package admin.member;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;


import bean.MemberBean;

public class AdminViewAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private String memberID;
	private int currentPage;
	
	MemberBean paramClass;
	MemberBean resultClass;
	
	public AdminViewAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	@Override
	//가입한 고객 개별 뷰
	public String execute() throws Exception {
		
		paramClass = new MemberBean();
		
		paramClass.setMemberID(getMemberID());
		
		resultClass = (MemberBean) sqlMapper.queryForObject("member.selectOne",paramClass);
		
		return SUCCESS;
	}
	

	public String getMemberID() {
		return memberID;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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
	
	
	
	
	
}
