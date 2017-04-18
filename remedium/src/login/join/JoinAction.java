package login.join;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;

public class JoinAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private MemberBean paramClass = new MemberBean();
	
	public JoinAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	
		reader.close();
	}


	//회원 가입 정보 입력 폼
	public String joinForm() throws Exception {
		
		return SUCCESS;
	}
	
	//회원 가입 정보 입력 처리
	public String execute() throws Exception{
		return SUCCESS;
	}


	public MemberBean getParamClass() {
		System.out.println(paramClass.getMemberID());
		return paramClass;
	}


	public void setParamClass(MemberBean paramClass) {
		this.paramClass = paramClass;
	}


}
