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


  <form method = "post" action = "roomUpdateOk">
  <input type = "hidden"  name = "roomid" value = "${rlist.roomid }" >
 <table width = "1000" border = "1">
 
 
   <tr>
     <td>방이름</td>
     <td><input type = "text" name = "title" id = "title" value = "${rlist.title }"></td>
    
   </tr>
    
   
   <tr>
     <td>가격</td>
     <td><input type = "text" name = "price" id = "price" value = "${rlist.price }"></td>
     
   </tr>
   
   <tr>
     <td>사진</td>
     <td><input type = "text" name = "rimg" id = "rimg" value = "${rlist.rimg }"></td>
     
   </tr>
   
   <tr>
     <td>방 설명</td>
     <td><textarea name = "content" id = "content">${rlist.content }</textarea></td>
     
   </tr>
   
   <tr>
     <td>펫수</td>
     <td>최소</td>
     <td><input type = "text" name = "min" value = "0" readonly></td>
     <td>최대</td>
     <td> 
     <select name="max">
        <c:forEach begin="1" end="10" var="i">
            <option value="${i}" 
            <c:if test="${i == rlist.max}">selected
            </c:if>>${i}</option>
        </c:forEach>
    </select>
       </td>
   </tr>
 
    <tr>
      
    </tr>
 </table>
     <input type= "submit" value = "방 수정하기">
</form>


</body>
</html>