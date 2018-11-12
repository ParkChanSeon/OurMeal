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
                <form action="${pageContext.request.contextPath}/memberRegist" method="post">
                    <p><input type="text" name="member_id">아이디<br/>
                    <p><input type="text" name="member_pw">비밀번호<br/>
                    <p><input type="text" name="member_name">이름<br/>
                    <p><input type="text" name="member_email">이메일<br/>
                    <p><input type="text" name="loc_code">위치<br/>
                    <p><input type="text" name="member_phone">전화번호<br/>
                    <p><input type="text" name="member_sex">성별<br/>
                    <p><input type="text" name="member_image">사진<br/>
                    <p><input type="text" name="member_grade">등급<br/>
                    <p><input type="submit" value="저장"><br/>
                </form>
            </td>
        </tr>
    </table>

</body>
</html>