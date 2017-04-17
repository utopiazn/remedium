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
	
	private List<RoomBean> list = new ArrayList<RoomBean>();
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	
	
	
	public ListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	@Override
	//검색된 객실 리스트
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	//모든 객실 리스트(관리자)
	public String all() throws Exception {
		
		list = sqlMapper.queryForList("roomSQL.selectAll");
		
		return SUCCESS;
	}

	public List<RoomBean> getList() {
		return list;
	}

	public void setList(List<RoomBean> list) {
		this.list = list;
	}
	
}


