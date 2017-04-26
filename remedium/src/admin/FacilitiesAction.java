package admin;

import com.opensymphony.xwork2.ActionSupport;

import bean.FacilitiesBean;

public class FacilitiesAction extends ActionSupport{
	
	private FacilitiesBean paramClass;
	private FacilitiesBean resultClass;
	
	private int no;
	private String name;
	private String content;
	private String time;
	
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
		
		return SUCCESS;
	}
	
	//관리자 편의시설 글 삭제
	public String delete() throws Exception{
		
		paramClass = new FacilitiesBean();
		paramClass.setNo(getNo());
		System.out.println("삭제하잣!");
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
	
	
	
	
	
	
	
	
	
}
