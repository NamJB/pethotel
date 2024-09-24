<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
    function validateForm() {
        // 입력 필드 값 가져오기
        var title = document.getElementById("title").value;
        var price = document.getElementById("price").value;
        var content = document.getElementById("content").value;
        var rimg = document.getElementById("rimg").value;
        
        // 오류 메시지 요소 가져오기
        var titleChk = document.getElementById("titlechk");
        var priceChk = document.getElementById("pricechk");
        var rimgChk = document.getElementById("rimgchk");
        var contentChk = document.getElementById("contentchk");
        
      
        titleChk.innerText = "";
        priceChk.innerText = "";
        rimgChk.innerText = "";
        contentChk.innerText = "";

    
        
        // 방 이름 유효성 검사
        if (title == "") {
            titleChk.innerText = "방 이름을 입력하세요.";
            titleChk.style.color = "red";
            return false;
        }

        // 가격 유효성 검사
        if (price == "" || isNaN(price)) {
            priceChk.innerText = "유효한 가격을 입력하세요.";
            priceChk.style.color = "red";
            return false;
        }

        // 사진 유효성 검사
        if (rimg == "") {
            rimgChk.innerText = "사진을 선택하세요.";
            rimgChk.style.color = "red";
            return false;
        }

        // 방 설명 유효성 검사
        if (content == "") {
            contentChk.innerText = "방 설명을 입력하세요.";
            contentChk.style.color = "red";
            return  false;
        }

        return true; // 모든 유효성 검사를 통과하면 true 반환
    }
</script>
</head>

<body>
<form method="post" action="roomCreateOk" onsubmit="return validateForm()" enctype="multipart/form-data">
    <table width="1000" border="1">
        <tr>
            <td>방 이름</td>
            <td><input type="text" name="title" id="title"></td>
            <td><span id="titlechk"></span></td>
        </tr>
        <tr>
            <td>가격</td>
            <td><input type="text" name="price" id="price"></td>
            <td><span id="pricechk"></span></td>
        </tr>
        <tr>
            <td>사진</td>
            <!-- multiple 속성을 추가하여 여러 장의 파일을 업로드할 수 있도록 설정 -->
            <td><input type="file" name="rimg" id="rimg" multiple></td>
            <td><span id="rimgchk"></span></td>
        </tr>
        <tr>
            <td>방 설명</td>
            <td><textarea name="content" id="content"></textarea></td>
            <td><span id="contentchk"></span></td>
        </tr>
        <tr>
            <td>최소 인원</td>
            <td><input type="text" name="min" value="0" readonly></td>
        </tr>
        <tr>
            <td>최대 인원</td>
            <td>
                <select name="max">
                    <c:forEach begin="1" end="10" var="i">
                        <option value="${i}">${i}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
    </table>
    <input type="submit" value="방 생성하기">
</form>

</body>
</html>