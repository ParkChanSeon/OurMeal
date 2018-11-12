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
                <form action="${pageContext.request.contextPath}/partnerRegist" method="post">
                    <p><input type="text" name="partner_id">아이디<br/>
                    <p><input type="text" name="partner_pw">비밀번호<br/>
                    <p><input type="text" name="store_code">가게코드<br/>
                    <p><input type="text" name="store_title">가게이름<br/>
                    <p><input type="submit" value="저장"><br/>
                </form>
            </td>
        </tr>
    </table>

</body>
</html>