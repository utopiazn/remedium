<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>EVENT</title>
<link href="css/board.css" rel="stylesheet" style="text/css">
<style type="text/css">
a{
color: black;
}
.event{
margin : 5% auto; line-height: normal;
}

.button{
    display: inline-block;
    zoom: 1;
    vertical-align: baseline;
    margin: 0 2px;
    outline: none;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    font: 14px/100% Arial, Helvetica, sans-serif;
    padding: .5em 2em .55em;
    -webkit-border-radius: .5em;
    -moz-border-radius: .5em;
    border-radius: .5em;
    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
    -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
    box-shadow: 0 1px 2px rgba(0,0,0,.2);
    font-size: 11px;
    padding: .2em 1em .275em;
    }
 .blue {
    color: #d9eef7;
    border: solid 1px #0076a3;
    background: #0095cd;
    background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));
    background: -moz-linear-gradient(top, #00adee, #0078a5);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5');
}  
    

</style>
</head>
<body>
<div class="event">

<table width="600" border="0" cellspacing="0" cellpadding="0" align="center" >
  		<tr>
  		<br>
  		<br>
  			<td align="center"><h2>EVENT＊PROMOTION</h2>
  			<hr align="center" width="50%" size="1" color="gray">
  			<br>
  			<br>
  			
  			</td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
  
	<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
	      <tr align="center" bgcolor="#A2D5FF">
      		<td width="50"><strong>NO</strong></td>
		<td width="350"><strong>이벤트</strong></td>
        		<td width="140"><strong>이벤트 시작</strong></td>
				<td width="140"><strong>이벤트 종료</strong></td>
				<td width="130"><strong>수정 / 삭제</strong></td>
      	      </tr>
      	      <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
      	      </tr>

	      <s:iterator value="list" >

			<s:url id="viewURL" action="eventView" >
				<s:param name="no">
					<s:property value="no" />
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>
				
	     	      <tr bgcolor="#FFFFFF"  align="center">
	        		<td><s:property value="no" /></td>
	        		<td align="center"> &nbsp;<s:a href="%{viewURL}"><s:property value="name" /></s:a></td>
	        		<td align="center"><s:property value="firstdate" /></td>
					<td align="center"><s:property value="lastdate" /></td>
	        	    <td align="center">
		 		
		 			<a href='eventModifyForm.action?no=<s:property value="no"/>'>수정</a>&nbsp;/ 
		 			<a href='eventDelete.action?no=<s:property value="no"/>'>삭제</a>
		 		</td>		
	      	      </tr>
	      	      <tr bgcolor="#777777">
	        		<td height="1" colspan="5"></td>
	      	      </tr>
      
	      </s:iterator>
			
	      <s:if test="list.size() <= 0">
				
	      <tr bgcolor="#777777">
      		<td height="1" colspan="5"></td>
    	      </tr>
    		
	      </s:if>
			
	      <tr align="center">
    		<td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
    	  </tr>
    	  
    	  <tr align="right">
    	  	<td colspan="5">
    	  	<input class="button blue" type="button" value="글쓰기" class="inputb" onClick="javascript:location.href='eventInsertForm.action'">
    	  	</td>
    	  </tr>
	</table><br/>
	
</div>
</body>
</html>