package admin;

import java.io.File;

import com.opensymphony.xwork2.ActionSupport;

import bean.FacilitiesBean;
import util.ProjectUtil;

public class FacilitiesAction extends ActionSupport{
	
	private FacilitiesBean paramClass;
	private FacilitiesBean resultClass;
	
	private int no;
	private String name;
	private String content;
	private String time;
	
	//업로드 관련
		private File upload;
		private String uploadFileName;
		private String fileUploadPath=(new ProjectUtil().getPath())+"remedium/WebContent/image/facImage/";

	//관리자 편의시설 글 쓰기 폼
	public String insForm() throws Exception{
		
		return SUCCESS;
	}
	
	//관리자 편의시설 글 쓰기 
	public String execute() throws Exception{
		
		paramClass = new FacilitiesBean();
		paramClass.setNo(getNo());
		paramClass.setName(getName());
		paramClass.setContent(getContent());
		paramClass.setTime(getTime());
		
		util.ProjectUtil.sqlMapper.insert("facilitiesSQL.insertFac", paramClass);
		
		
		//이미지 업로드
		String sql = "facilitiesSQL.updateImage";
		util.ProjectUtil.imageUplode(paramClass, getNo(), uploadFileName, fileUploadPath, upload, sql);
		
		
		
		return SUCCESS;
	}
		
	//관리자 편의시설 글 수정 폼
	public String updForm() throws Exception{
		paramClass = new FacilitiesBean();
		resultClass = new FacilitiesBean();
		paramClass.setNo(getNo());
		
		resultClass = (FacilitiesBean)util.ProjectUtil.sqlMapper.queryForObject("facilitiesSQL.selectOne", paramClass);
		return SUCCESS;
	}	
	
	//관리자 편의시설 글 수정 처리
	public String update() throws Exception{
		
		paramClass = new FacilitiesBean();
		paramClass.setNo(getNo());
		paramClass.setName(getName());
		paramClass.setContent(getContent());
		paramClass.setTime(getTime());
		
		util.ProjectUtil.sqlMapper.update("facilitiesSQL.updateFac", paramClass);
		
		if(getUploadFileName().equals("")){
			return SUCCESS;
		}else{
			resultClass = new FacilitiesBean();
			resultClass = (FacilitiesBean)util.ProjectUtil.sqlMapper.queryForObject("facilitiesSQL.selectOne", paramClass);

			File deleteFile = new File(fileUploadPath + resultClass.getImage());
			deleteFile.delete();
			
			String sql = "facilitiesSQL.updateImage";
			util.ProjectUtil.imageUplode(paramClass, getNo(), uploadFileName, fileUploadPath, upload, sql);
		}
		return SUCCESS;
	}
	
	//관리자 편의시설 글 삭제
	public String delete() throws Exception{
		
		paramClass = new FacilitiesBean();
		paramClass.setNo(getNo());
		resultClass = new FacilitiesBean();
		resultClass = (FacilitiesBean)util.ProjectUtil.sqlMapper.queryForObject("facilitiesSQL.selectOne", paramClass);

		File deleteFile = new File(fileUploadPath + resultClass.getImage());
		deleteFile.delete();
		
		util.ProjectUtil.sqlMapper.update("facilitiesSQL.deleteFac", paramClass);		
		
		return SUCCESS;
	}

	
	
	
	
	
	
	
	public FacilitiesBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(FacilitiesBean paramClass) {
		this.paramClass = paramClass;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public FacilitiesBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(FacilitiesBean resultClass) {
		this.resultClass = resultClass;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	
	
	
	
	
	
	
}
