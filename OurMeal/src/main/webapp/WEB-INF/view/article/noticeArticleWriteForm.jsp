<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="writeSuccess" method="post">
        <h1>게시글작성페이지</h1>
        <input type="text" name="notice_title">게시글 제목<br>
        <input type="text" name="admin_id">작성자<br>
        <textarea rows="5" cols="30" name="notice_content"/>
        <input type="submit" value="등록">
    </form>
</body>
</html>