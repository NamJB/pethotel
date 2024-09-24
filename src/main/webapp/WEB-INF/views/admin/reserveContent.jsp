<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

   .container {
        width: 80%;
        margin: 40px auto;
        padding: 20px;
        background-color: blcak;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        border-radius: 10px;
        color:black;
    }
    

</style>
</head>
<body>

<table width  = "1000" border ="1">

  <tr>
    <td>성함</td>
    <td>${rList.username}</td>
  </tr>
  
  <tr>
    <td>휴대폰번호</td>
    <td>${rList.phone}</td>
  </tr>
  
  <tr>
    <td>방이름</td>
    <td>${rList.roomid}</td>
  </tr>
  
  <tr>
    <td>예약 하신 날짜</td>
    <td>${rList.reserveday }</td>
    
  </tr>
  
  <tr>
    <td>예약날짜</td>
    <td>${rList.startDate} ~ ${rList.endDate }</td>
  </tr>
  
  <tr>
    <td>펫 수</td>
    <td>${rList.petsu}</td>
  </tr>
  
  <tr>
    <td>요청사항</td>
    <td>${rList.content}</td>
  </tr>
  
  <tr>
    <td>총 가격</td>
    <td>${rList.chongprice}</td>
  </tr>
  
  
 
  


</table>

<a style= "color:black;" href = "/admin/reserveAdelete?reserveNum=${rList.reserveNum}"> 예약삭제</a>




</body>
</html>