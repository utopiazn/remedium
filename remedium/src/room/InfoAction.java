package room;

import com.opensymphony.xwork2.ActionSupport;

public class InfoAction extends ActionSupport {

	@Override
	//객실 클래스 리스트
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	
	//객실 클래스 개별 뷰
	public String view() throws Exception {
		
		return SUCCESS;
	}
	
	//객실 클래스를 추가 폼
	public String insForm() throws Exception {
		
		return SUCCESS;
	}
	
	//객실 클래스를 추가
	public String insert() throws Exception {
		
		return SUCCESS;
	}
	
	//객실 클래스를 수정 폼
	public String updForm() throws Exception {
		
		return SUCCESS;
	}
	
	//객실 클래스를 수정
	public String update() throws Exception {
		
		return SUCCESS;
	}
	
	//객실 클래스를 삭제
	public String delete() throws Exception {
		
		return SUCCESS;
	}
}
