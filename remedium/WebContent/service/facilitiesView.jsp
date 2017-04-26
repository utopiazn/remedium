<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
  <body>
<img height="400" alt="시설사진" src="/remedium/image/facImage/<s:property value='resultClass.image'/>" >
<s:property value="resultClass.no" /><br/>  
<s:property value="resultClass.name" /><br/>  
<s:property value="resultClass.content" /><br/>
<s:property value="resultClass.time" /><br/>

<input type="button" value="시설정보수정"onClick="location.href='facilitiesModifyForm.action?no=<s:property value="resultClass.no" />'">  
<input type="button" value="시설삭제"onClick="location.href='facilitiesDelete.action?no=<s:property value="resultClass.no" />'">
<input type="button" value="시설목록"onClick="location.href='facilitiesList.action'">
 
  </body>
</html>