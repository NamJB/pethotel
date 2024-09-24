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

   <table>
     <tr>
     <td> 방사진 </td>
     <td><img src = "../static/reserve/${rlist.rimg}"></td>
     
     </tr>
   
     <tr>
     <td> 방이름 </td>
     <td>${rlist.title }</td>
     
     </tr>
     
     <tr>
     <td> 가격 </td>
     <td>${rlist.price }</td>
     
     </tr>
     
     <tr>
     <td> 방 소개 </td>
     <td>${rlist.content }</td>
     
     </tr>
     
     <tr>
     <td>최대 최소 펫 </td>
     <td>${rlist.min } ~ ${rlist.max }</td>
     
     </tr>
   
   
   </table>
   
   <a href = "roomUpdate?roomid=${rlist.roomid }" style = "color:black;">방 수정하기</a>
   <a href = "roomDelete?roomid=${rlist.roomid }" style = "color:black;">방 삭제하기</a>

</body>
</html>