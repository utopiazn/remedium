package room;

import com.opensymphony.xwork2.ActionSupport;

public class ListAction extends ActionSupport {

	@Override
	//검색된 객실 리스트
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	//모든 객실 리스트(관리자)
	public String all() throws Exception {
		return SUCCESS;
	}
	
}
