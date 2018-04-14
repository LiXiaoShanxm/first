<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>使用JSP+Servlet实现文件的上传下载</title>   
</head>
<body>
	<form action="fileupload" method="post" enctype="multipart/form-data">
		<input type="text" name="username"><br>
		<input type="file" name="filename"><br>
		<input type="submit" value="上传文件">
	</form>
</body>
</html>