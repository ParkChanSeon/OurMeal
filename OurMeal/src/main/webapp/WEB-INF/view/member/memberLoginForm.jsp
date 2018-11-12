<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <table>
        <tr>
            <td>
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <p>아디<input type="text" name="member_id"><br/>
                    <p>비번<input type="text" name="member_pw"><br/>
                </form>
            </td>
        </tr>
    </table>

</body>
</html>