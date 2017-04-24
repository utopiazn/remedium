package login;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;

public class LoginModifyAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private String memberID;
	
	private String password; 
	private String memberName;  //회원이름
	private String gender; 		//회원 성별
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
	MemberBean resulteClass;
	
	
	
	public LoginModifyAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	//마이페이지 회원 수정 폼
	public String modifyForm() throws Exception {
		
		paramClass = new MemberBean();
		resulteClass = new MemberBean();
		
		paramClass.setMemberID(getMemberID());
		
		resulteClass = (MemberBean) sqlMapper.queryForObject("member.selectOne",paramClass);
		
		return SUCCESS;
	}
	
	//마이페이지 회원 수정 처리
	public String execute() throws Exception {
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public MemberBean getResulteClass() {
		return resulteClass;
	}

	public void setResulteClass(MemberBean resulteClass) {
		this.resulteClass = resulteClass;
	}
}
