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

  <c:forEach items ="${roomList}" var = "rlist">
  
  <table>
    <tr>
      <td><a href = "/admin/roomContent?roomid=${rlist.roomid }"><img src = "../static/rooms/${rlist.rimgPaths}"></a></td>
    </tr>
    <tr>
      <td >${rlist.title }</td>
    </tr>
  
  </table>
  
  </c:forEach>
  
  
  <a style = "color:black;"href = "/admin/roomCreate">방추가</a>
  

</body>
</html>