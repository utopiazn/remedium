<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p><h3>${resultClass.name}</h3></p>
	
<img height="510" alt="호텔로고" src='/remedium/image/roomClassImage/${imageMain}' >


<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
	<img height="100" alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_01}">
</a>

<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=2">
	<img height="100" alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_02}">
</a>

<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=3">
	<img height="100" alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_03}">
</a>

<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=4">
	<img height="100" alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_04}">
</a>

<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=5">
	<img height="100" alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_05}">
</a>



<p><h3>${resultClass.content}</h3></p>


	<img height="200" alt="메인 이미지1" src="/remedium/image/roomClassImage/${resultClass.image2}">





</body>
</html>