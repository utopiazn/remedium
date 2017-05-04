<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link href="css/board.css" rel="stylesheet" style="text/css">
<style type="text/css">
a{
color: black;
}
.event{
margin : 20px; 
line-height: 2.5em;
color: black;
text-align: center;
}

.button{
    border: 3px solid #202f58;
    background-color : #202f58;
    display: inline-block;
    cursor: pointer;
    font-size: 13px;
    text-decoration: none;
    color: white;
}
.bottom{
  padding-left: 46%;
  padding-top: 3%;
}
.top{
	background-color:#202f58;
	color: white;
}


</style>
</head>
<body>
<div class="event">
<table width="1000" border="0" cellspacing="0" cellpadding="2" align="center">
  		<tr>
  		
  			<td align="center"><h2>FAQ</h2>
 			<hr align="center" width="60%" size="1" color="gray">
  			<br/>
  			</td>
  			
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
  
	<table width="1000" border="0" cellspacing="0" cellpadding="0" align="center">
	      <tr class="top" align="center" bgcolor="#A2D5FF">
      		<td width="50"><strong>질문유형</strong></td>
			<td width="450"><strong>제목</strong></td>
      	    
      	      </tr>
      	      <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
      	      </tr>

	      <s:iterator value="list" status="stat">

		<s:url id="viewURL" action="faqView" >
			<s:param name="faqId">
				<s:property value="faqId" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
			
     	      <tr bgcolor="#FFFFFF"  align="center">
        		<td style="border-bottom: 1px solid #666;"><s:property value="type" /></td>
        		<td style="border-bottom: 1px solid #666;" align="left"> &nbsp;<s:a href="%{viewURL}">Q. <s:property value="subject" /></s:a></td>
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
    	  	<s:if test ="${ session.userAdmin == '1' }">
    	  	<td colspan="5"><input class="button" type="button" value="추 가"  onClick="javascript:location.href='faqWriteForm.action'"> 
    	  	</td>
    	  	</s:if>
    	  </tr>
	</table> 
			</div>
</body>
</html>