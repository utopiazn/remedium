package room;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.RoomBean;

public class ListAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	/*private List<RoomBean> list;
	private RoomBean paramClass;
	
	private Date firstdate;
	private Date lastdate;
	private int people;*/
	
	
	
	public ListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	@Override
	//검색된 객실 리스트
	public String execute() throws Exception {
		System.out.println("되냐?");
		/*
		list = new ArrayList<RoomBean>();
		paramClass = new RoomBean();
		System.out.println(getPeople());
		paramClass.setRoom_capacity(getPeople());
		
		if(paramClass.getRoom_capacity()==0){
			System.out.println("여기까지");
			list = sqlMapper.queryForList("roomSQL.selectSerchGroup", paramClass);
		}else{
			list = sqlMapper.queryForList("roomSQL.selectSerch", paramClass);
		}*/
		return SUCCESS;
	}
	
	//모든 객실 리스트(관리자)
	/*public String all() throws Exception {
		
		list = new ArrayList<RoomBean>();
		
		list = sqlMapper.queryForList("roomSQL.selectAll");
		
		return SUCCESS;
	}*/

	/*public List<RoomBean> getList() {
		return list;
	}

	public void setList(List<RoomBean> list) {
		this.list = list;
	}

	public Date getFirstdate() {
		return firstdate;
	}

	public void setFirstdate(Date firstdate) {
		this.firstdate = firstdate;
	}

	public Date getLastdate() {
		return lastdate;
	}

	public void setLastdate(Date lastdate) {
		this.lastdate = lastdate;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}*/
	
	
}


