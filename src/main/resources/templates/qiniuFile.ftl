<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
	  xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
	<head>
		<title>七牛云传文件</title>
		<meta charset="utf-8">
	</head>
	
	<body>
		<form action="/shangchuan" method="post" enctype="multipart/form-data">
			<input type="file" name="file">
			<input type="submit">
		</form>
	</body>
</html>