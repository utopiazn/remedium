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
public class LoginModifyAction extends ActionSupport implements SessionAware {
	
	private Map session;
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private String memberID;
	
	private String memberPassword; //회원 비밀번호
	private String memberName;    //회원이름
	private String gender; 		 //회원 성별
	private String birthday; 	//회원 생년월일
	private String phone; 		//회원 전화번호
	private String email;		//회원 이메일
	private String zipcode;		// 회원 우편번호
	private String addr1; 		// 회원 주소
	private String addr2; 		// 회원 상세주소
	private String zipcode1; 	// 회원 우편번호
	private String addr11; 		// 회원 주소
	private String addr22; 		// 회원 상세주소
	
	
	
	MemberBean paramClass;
	MemberBean resultClass;
	
	
	
	public LoginModifyAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	//마이페이지 회원 수정 폼
	public String modifyForm() throws Exception {
		
		paramClass = new MemberBean();
		resultClass = new MemberBean();
		
		paramClass.setMemberID(getMemberID());
		
		resultClass = (MemberBean) sqlMapper.queryForObject("member.selectOne",paramClass);
		
		return SUCCESS;
	}
	
	//마이페이지 회원 수정 처리
	public String execute() throws Exception {
		
		paramClass = new MemberBean();
		
		System.out.println("111"+getMemberName());
		
		paramClass.setMemberID(getMemberID());
		paramClass.setMemberPassword(getMemberPassword());
		paramClass.setMemberName(getMemberName());
		paramClass.setGender(getGender());
		paramClass.setBirthday(getBirthday());
		paramClass.setPhone(getPhone());
		paramClass.setEmail(getEmail());
		
		if(!zipcode1.equals("")){
			zipcode = zipcode1;
		}
		
		if(!addr11.equals("")){
			addr1 = addr11;
		}
		
		if(!addr22.equals("")){
			addr2 = addr22;
		}
		
		paramClass.setZipcode(getZipcode()); //회원 우편번호
		paramClass.setAddr1(getAddr1()); 	 // 회원 주소
		paramClass.setAddr2(getAddr2());
		
		System.out.println("11111");
		sqlMapper.update("member.updateMember", paramClass);
		
		/*resultClass = (MemberBean) paramClass;*/
		
		
		
		return SUCCESS;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public String getZipcode1() {
		return zipcode1;
	}

	public void setZipcode1(String zipcode1) {
		this.zipcode1 = zipcode1;
	}

	public String getAddr11() {
		return addr11;
	}

	public void setAddr11(String addr11) {
		this.addr11 = addr11;
	}

	public String getAddr22() {
		return addr22;
	}

	public void setAddr22(String addr22) {
		this.addr22 = addr22;
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

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}

	
}
