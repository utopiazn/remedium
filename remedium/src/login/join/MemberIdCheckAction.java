package login.join;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;

public class MemberIdCheckAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	
	private MemberBean paramClass;
	private MemberBean resultClass;

	private String memberId;
	
	int check =0;
	
	public MemberIdCheckAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	// 회원 가입 아이디 중복 체크
	public String execute() throws Exception {
		
				
		paramClass = new MemberBean();
		resultClass = new MemberBean();
		

		paramClass.setMemberID(getMemberId());
		
		resultClass = (MemberBean)sqlMapper.queryForObject("member.selectDistinctID", paramClass);
		
		
		
		if(resultClass == null){ //ID 사용가능
			
			//resultClass.setMemberID(getMemberId());
			setCheck(1);
		}
		
		
		return SUCCESS;
	}
	
	
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}
	
	
	
}
