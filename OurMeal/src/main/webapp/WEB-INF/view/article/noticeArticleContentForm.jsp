<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
    <h1>게시글내용페이지</h1>
    <table>
        <tr>
            <td>${notice_no}</td>
            <td>${notice_title}</td>
            <td>${admin_id}</td>
        </tr>
        <tr>
            <td colspan="3">${notice_content}</td>
        </tr>
        <tr>
            <td colspan="3">${notice_c_date}</td>
        </tr>
    </table>
    <form action="noticeUpdate" method="post">
        <input type="submit" value="수정">
    </form>
    <form action="noticeDelete" method="get">
        <input type="submit" value="삭제">
    </form>
</body>
</html>