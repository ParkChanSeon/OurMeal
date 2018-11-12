<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회 원 가 입</title>
</head>
<body>

    <table>
        <tr>
            <td>
                <form action="${pageContext.request.contextPath}/memberLogin" method="post">
                    <p><input type="text" name="member_id">아이디<br/>
                    <p><input type="text" name="member_pw">비밀번호<br/>
                </form>
            </td>
        </tr>
    </table>

</body>
</html>