package admin;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.commons.io.FileUtils;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.EventBean;
import util.ProjectUtil;
import org.apache.struts2.interceptor.SessionAware;

public class EventAction extends ActionSupport implements SessionAware {
	
	private Map session;
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int currentPage;
	
	
	private int no;
	private String name;
	private String firstdate;
	private String lastdate;
	private String content;
	
	
	private File upload;
	private String uploadFileName;;
	
	private String fileUploadPath=(new ProjectUtil().getPath())+"remedium/WebContent/image/eventImage/";

	EventBean resultClass;
	EventBean paramClass;


	public EventAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	//관리자 이벤트 글 쓰기 폼
	public String insForm() throws Exception{
		
		
		
		return SUCCESS;
	}
	
	//관리자 이벤트 글 쓰기 
	public String execute() throws Exception{
		
		System.out.println("lllllll");
		
		paramClass = new EventBean();
		resultClass = new EventBean();
		
		if(!uploadFileName.equals("")){
			System.out.println("경로1"+this.getClass().getResource("/").getPath());
			
			File destFile = new File(fileUploadPath + uploadFileName);
			FileUtils.copyFile(upload, destFile); 
		}
		
		paramClass.setImage(getUploadFileName());	
		paramClass.setName(getName());
		paramClass.setFirstdate(java.sql.Date.valueOf(firstdate));
		paramClass.setLastdate(java.sql.Date.valueOf(lastdate));
		paramClass.setContent(getContent());
		
		
		if(paramClass != null){
			
			sqlMapper.insert("event.insertEvent", paramClass);
		}
		
		
		return SUCCESS;
	}
		

	//관리자 이벤트 글 수정 폼
	public String updForm() throws Exception{
		

		paramClass = new EventBean();
		resultClass = new EventBean();
		
		System.out.println(getNo());
		paramClass.setNo(getNo());
		
		resultClass = (EventBean)sqlMapper.queryForObject("event.selectOne", paramClass);

		return SUCCESS;
	}	
	
	//관리자 이벤트 글 수정 처리
	public String update() throws Exception{
		
		paramClass = new EventBean();
		resultClass = new EventBean();
		
		paramClass.setNo(getNo());
		paramClass.setName(getName());
		paramClass.setFirstdate(java.sql.Date.valueOf(firstdate));
		paramClass.setLastdate(java.sql.Date.valueOf(lastdate));
		paramClass.setContent(getContent());
			
		
		if(!uploadFileName.equals("")){
			
			resultClass = (EventBean)sqlMapper.queryForObject("event.selectOne", paramClass);
			
			File deleteFile = new File(fileUploadPath + resultClass.getImage());
			deleteFile.delete();
			
			File destFile = new File(fileUploadPath + uploadFileName);
			FileUtils.copyFile(upload, destFile); 
		
			
			paramClass.setImage(getUploadFileName());	
		}
		
		sqlMapper.update("event.updateEvent",paramClass);
		
		
		return SUCCESS;
	}
	
	//관리자 이벤트 글 삭제
	public String delete() throws Exception{
		
		paramClass = new EventBean();
		resultClass = new EventBean();
		
		
		System.out.println(getNo());
		paramClass.setNo(getNo());
		
		resultClass = (EventBean)sqlMapper.queryForObject("event.selectOne", paramClass);
		
		File deleteFile = new File(fileUploadPath + resultClass.getImage());
		deleteFile.delete();
		
		
	    sqlMapper.delete("event.deleteEvent",paramClass);
		
		return SUCCESS;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public String getLastdate() {
		return lastdate;
	}

	public void setLastdate(String lastdate) {
		this.lastdate = lastdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFirstdate() {
		return firstdate;
	}

	public void setFirstdate(String firstdate) {
		this.firstdate = firstdate;
	}

	public EventBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(EventBean resultClass) {
		this.resultClass = resultClass;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}



	public File getUpload() {
		return upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public EventBean getParamClass() {
		return paramClass;
	}


	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public void setParamClass(EventBean paramClass) {
		this.paramClass = paramClass;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	


}
