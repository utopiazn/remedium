<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

		CHECK:${check}
		ID:${memberId}
		
	<s:if test="%{check == 1}">
	
		${memberId} 는 사용가능합니다.
		
	</s:if>		
		
		
</body>
</html>