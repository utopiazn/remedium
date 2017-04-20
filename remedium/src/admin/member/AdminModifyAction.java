package admin.member;
import java.io.IOException;
import java.io.Reader;
import java.util.Date;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;

public class AdminModifyAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private String memberID;
	private String memberPassword; // 회원 비밀번호
	private String memberName; // 회원 이름
	private String gender; // 회원 성별
	private String birthday; // 회원 생년월일
	private String phone; // 회원 핸드폰번호
	private String email; // 회원 이메일
	private Date regdate;
	
	private String zipcode; // 회원 우편번호
	private String addr1; // 회원 주소
	private String addr2; // 회원 상세주소
	
	private String zipcode1; // 회원 우편번호
	private String addr11; // 회원 주소
	private String addr22; // 회원 상세주소
	
	
	
	private int currentPage;
	
	MemberBean paramClass;
	MemberBean resultClass;
	
	public AdminModifyAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String modifyForm() throws Exception {
		
		paramClass = new MemberBean();
		resultClass = new MemberBean();
		
		paramClass.setMemberID(getMemberID());
		
		resultClass = (MemberBean) sqlMapper.queryForObject("member.selectOne",paramClass);
		
		
		return SUCCESS;
	}
	
	@Override
	// 가입한 고객 개별 뷰
	public String execute() throws Exception {
		
		paramClass = new MemberBean();
		
		paramClass.setMemberID(getMemberID());
		paramClass.setMemberPassword(getMemberPassword());
		paramClass.setMemberName(getMemberName());
		paramClass.setGender(getGender());
		paramClass.setBirthday(getBirthday());
		paramClass.setPhone(getPhone());
		paramClass.setEmail(getEmail());
		paramClass.setRegdate(getRegdate());
		
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
		
		sqlMapper.update("member.updateMember", paramClass);
		
		resultClass = (MemberBean) paramClass;
		
		
		return SUCCESS;
		

	}

	public String getMemberID() {
		return memberID;
	}

	public int getCurrentPage() {
		return currentPage;
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

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setParamClass(MemberBean paramClass) {
		this.paramClass = paramClass;
	}

	public void setResultClass(MemberBean resultClass) {
		this.resultClass = resultClass;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public String getMemberName() {
		return memberName;
	}

	public String getGender() {
		return gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public String getAddr1() {
		return addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setZipcode(String zipcode) {
		
	
		
		this.zipcode = zipcode;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getZipcode1() {
		return zipcode1;
	}

	public String getAddr11() {
		return addr11;
	}

	public String getAddr22() {
		return addr22;
	}

	public void setZipcode1(String zipcode1) {
		this.zipcode1 = zipcode1;
	}

	public void setAddr11(String addr11) {
		this.addr11 = addr11;
	}

	public void setAddr22(String addr22) {
		this.addr22 = addr22;
	}
	
	
	
	
	
	
	
}
