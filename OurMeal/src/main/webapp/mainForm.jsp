<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

    <table>
        <tr>
            <td>
                <form action="${pageContext.request.contextPath}/memberRegist" method="get">
                    <p><input type="submit" value="사용자회원가입">
                </form>
            </td>
        </tr>
        <tr>
            <td>
                <form action="${pageContext.request.contextPath}/partnerRegist" method="get">
                    <p><input type="submit" value="사업자회원가입">
                </form>
            </td>
        </tr>
        <tr>
            <td>
                <form action="${pageContext.request.contextPath}/myPage" method="post">
                    <p>아이디<input type="text" name="member_id">
                    <p><input type="submit" value="마이페이지">
                </form>
            </td>
        </tr>
    </table>
    
</body>
</html>