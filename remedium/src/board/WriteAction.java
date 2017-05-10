package board;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.BoardBean;
import bean.MemberBean;

public class WriteAction extends ActionSupport implements SessionAware{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private Map session;
	
	private int no;
	private String subject;
	private String content;
	private int ref;
	private int re_step;
	private String type;
	private String memberID;
	private String name;
	
	private boolean reply = false;
	
	BoardBean resultClass;
	BoardBean paramClass;
	
	MemberBean result;
	MemberBean param;
	
	
	public WriteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	// 문의 사항 게시글 쓰기 폼
	public String form() throws Exception {	
		
		return SUCCESS;
		
	}

	// 문의 사항 게시글 쓰기 처리
	public String execute() throws Exception {
		
		paramClass = new BoardBean();
		resultClass = new BoardBean();	
		
		param = new MemberBean();
		result = new MemberBean();	
		
		param.setMemberID(session.get("memberId").toString());
			
		result = (MemberBean) sqlMapper.queryForObject("member.selectOne",param);
		
		paramClass.setMemberID(result.getMemberID());
		paramClass.setName(result.getMemberName()); 
		
	
		System.out.println("ref : "+ref);
		if(ref==0){
			paramClass.setRe_step(0);
			paramClass.setType("0");
		}
		
		else {
			paramClass.setRef(getRef());
			paramClass.setRe_step(getRe_step() + 1);
			paramClass.setRef(getRef());
			paramClass.setType("1");
			
			sqlMapper.update("board.updateType",paramClass);
		
		}
		System.out.println("type: "+getType());
		paramClass.setNo(getNo());
		paramClass.setSubject(getSubject());
		paramClass.setContent(getContent());		
	
		
		if(ref==0){
			sqlMapper.insert("board.insertBoard",paramClass);
		}
		else {
			sqlMapper.insert("board.insertReplyBoard",paramClass);
		}
		
		resultClass = (BoardBean) paramClass;
		
		
		
		return SUCCESS;
		
	}
	
	public String reply() throws Exception {
		
		reply = true;
		
		resultClass = new BoardBean();
		
		resultClass = (BoardBean) sqlMapper.queryForObject("board.selectOne",getNo());
		resultClass.setSubject("Re : " + resultClass.getSubject());
		resultClass.setContent("");
		resultClass.setName("");
		
		return SUCCESS;
		
		
	}

	public int getNo() {
		return no;
	}

	public String getSubject() {
		return subject;
	}

	public String getContent() {
		return content;
	}

	public int getRef() {
		return ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public String getType() {
		return type;
	}

	public BoardBean getResultClass() {
		return resultClass;
	}

	public BoardBean getParamClass() {
		return paramClass;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setResultClass(BoardBean resultClass) {
		this.resultClass = resultClass;
	}

	public void setParamClass(BoardBean paramClass) {
		this.paramClass = paramClass;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public String getMemberID() {
		return memberID;
	}

	public String getName() {
		return name;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public void setName(String name) {
		this.name = name;
	}

	public MemberBean getResult() {
		return result;
	}

	public MemberBean getParam() {
		return param;
	}

	public void setResult(MemberBean result) {
		this.result = result;
	}

	public void setParam(MemberBean param) {
		this.param = param;
	}

	public boolean isReply() {
		return reply;
	}

	public void setReply(boolean reply) {
		this.reply = reply;
	}
	
	
	
	



	
	
	
	
}
