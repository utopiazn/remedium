package room;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.RoomBean;

public class ListAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<RoomBean> list;
	private RoomBean paramClass;
	
	private String firstDate;
	private String lastDate;
	private int people;
	
	
	
	public ListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	@Override
	//검색된 객실 리스트
	public String execute() throws Exception {
		
		list = new ArrayList<RoomBean>();
		paramClass = new RoomBean();
		paramClass.setRoom_capacity(getPeople());
		
		if(paramClass.getRoom_capacity()==0){
			list = sqlMapper.queryForList("roomSQL.selectSerchGroup", paramClass);
		}else{
			list = sqlMapper.queryForList("roomSQL.selectSerch", paramClass);
		}
		return SUCCESS;
	}
	
	//모든 객실 리스트(관리자)
	public String all() throws Exception {
		
		list = new ArrayList<RoomBean>();
		
		list = sqlMapper.queryForList("roomSQL.selectAll");
		
		return SUCCESS;
	}

	public List<RoomBean> getList() {
		return list;
	}

	public void setList(List<RoomBean> list) {
		this.list = list;
	}

	public String getFirstDate() {
		return firstDate;
	}

	public void setFirstDate(String firstDate) {
		this.firstDate = firstDate;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public RoomBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(RoomBean paramClass) {
		this.paramClass = paramClass;
	}
	
	
}


