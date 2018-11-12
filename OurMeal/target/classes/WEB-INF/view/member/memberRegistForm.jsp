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
                <form action="${pageContext.request.contextPath}/regist" method="post">
                    <p>아디<input type="text" name="member_id"><br/>
                    <p>비번<input type="text" name="member_pw"><br/>
                    <p>이름<input type="text" name="member_name"><br/>
                    <p>메일<input type="text" name="member_email"><br/>
                    <p>전화<input type="text" name="member_phone"><br/>
                    <p>성별<input type="text" name="member_sex"><br/>
                    <p><input type="submit" value="저장"><br/>
                </form>
            </td>
        </tr>
    </table>

</body>
</html>