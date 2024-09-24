<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.LocalDate, java.time.ZoneId, java.util.Date" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<style>
   body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    .navi {
        width: 100%;
        padding: 20px;
        background-color: #333;
        color: white;
        text-align: center;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .container {
        width: 80%;
        margin: 40px auto;
        padding: 20px;
        background-color: white;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        border-radius: 10px;
    }
    #username {
        font-size: 24px;
        font-weight: bold;
        color: #fff;
    }
    .action-button {
        display: inline-block;
        margin: 20px 10px;
        padding: 15px 30px;
        background-color: #333;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        transition: background-color 0.3s ease, color 0.3s ease;
    }
    .action-button:hover {
        background-color: #555;
        color: white;
    }
    
    .calendar-table {
        width: 100%;
        border-collapse: collapse;
        text-align: center;
    }
    .calendar-table th, .calendar-table td {
        padding: 10px;
        border: 1px solid #ddd;
    }
    .room-name {
        background-color: #f5f5f5;
        font-weight: bold;
    }
    .reserved {
        background-color: #f44336;  /* 예약 완료 */
        color: white;
    }
    .middle-reserved {
        background-color: #ffa500; /* 예약 중간 날짜 색상 (주황색) */
        color: white;
    }
    .customer {
        background-color: #ddd; /* 예약자 이름 표시 */
    } 
</style>
 

</head>
<body>

<nav class="navi">
    <h2 id="username">관리자:${sessionScope.username}</h2>
</nav>

<div>
   <span><a style = "color:black;"href = "/admin/roomList">방 리스트</a></span>
   <span></span>

</div>

<section>
    <div>
        <table class="calendar-table">
            <caption>
                <!-- 이전 달 링크 -->
                <c:choose>
                    <c:when test="${month == 1}">
                        <a href="mypage?year=${year - 1}&month=12"> 이전 </a>
                    </c:when>
                    <c:otherwise>
                        <a href="mypage?year=${year}&month=${month - 1}"> 이전 </a>
                    </c:otherwise>
                </c:choose>
                
                ${year}년 ${month} 월
                
                <!-- 다음 달 링크 -->
                <c:choose>
                    <c:when test="${month == 12}">
                        <a href="mypage?year=${year + 1}&month=1"> 다음 </a>
                    </c:when>
                    <c:otherwise>
                        <a href="mypage?year=${year}&month=${month + 1}"> 다음 </a>
                    </c:otherwise>
                </c:choose>
            </caption>
<thead>
    <tr>
        <th>객실</th>
        <c:forEach begin="1" end="${lastday}" var="day">
           
            <c:set var="dateString" value="${year}-${month}-${day}" />
            <fmt:parseDate value="${dateString}" pattern="yyyy-M-d" var="dateObject" />
            <fmt:formatDate value="${dateObject}" pattern="u" var="dayOfWeek" />

            <th>
                <c:choose>
        <c:when test="${dayOfWeek == 7}">
        <!-- 일요일인 경우 -->
        <span style="color:red;">${day}일</span>
        </c:when>
         <c:when test="${dayOfWeek == 6}">
        <!-- 토요일인 경우 -->
        <span style="color:blue;">${day}일</span>
        </c:when>
         <c:otherwise>
        <!-- 평일인 경우 -->
        ${day}일
       </c:otherwise>
          </c:choose>
            </th>
        </c:forEach>
    </tr>
</thead>

                        <tbody>
                <c:forEach var="room" items="${roomList}">
                    <tr>
                        <td class="room-name">${room.title}</td>
                        
                        <c:forEach begin="1" end="${lastday}" var="day">
                          
                            <c:set var="currentDate" value="${year}-${month}-${day}" />
                            <fmt:parseDate value="${currentDate}" pattern="yyyy-M-d" var="currentDateParsed" />
                            <fmt:formatDate value="${currentDateParsed}" pattern="yyyy-MM-dd" var="formattedCurrentDate" />

                            <c:set var="statusClass" value="" />
                            <c:set var="reservationName" value="" />

                            
                            <c:forEach var="res" items="${reserveList}">
                                <!-- 시작 날짜인지 확인 -->
                                <c:if test="${room.roomid == res.roomid && formattedCurrentDate == res.startDate}">
                                    <c:set var="statusClass" value="reserved" />
                                    <c:set var="Name" value="${res.username}" />
                                    <c:set var="reserveNum" value="${res.reserveNum}" />
                                </c:if>

                                <!-- 끝나는 날짜인지 확인 -->
                                <c:if test="${room.roomid == res.roomid && formattedCurrentDate == res.endDate}">
                                    <c:set var="statusClass" value="reserved" />
                                    <c:set var="Name" value="${res.username}" />
                                    <c:set var="reserveNum" value="${res.reserveNum}" />
                                </c:if>

                                <!-- 시작과 끝 사이 날짜인지 확인 -->
                                <c:if test="${room.roomid == res.roomid && formattedCurrentDate > res.startDate && formattedCurrentDate < res.endDate}">
                                    <c:set var="statusClass" value="middle-reserved" />
                                    <c:set var="Name" value="${res.username}" />
                                    <c:set var="reserveNum" value="${res.reserveNum}" />
                                </c:if>
                            </c:forEach>

                            <!-- 예약 상태에 따른 출력 -->
                            <c:choose>
                                <c:when test="${statusClass == 'reserved'}">
                                    <td class="${statusClass}">
                                        <c:if test="${!empty Name}">
                                            <a href="/admin/reserveContent?reserveNum=${reserveNum}">${Name}</a>
                                        </c:if>
                                    </td>
                                </c:when>
                                <c:when test="${statusClass == 'middle-reserved'}">
                                    <td class="${statusClass}">
                                        <c:if test="${!empty Name}">
                                            ${Name}
                                        </c:if>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td>-</td>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</section>


<div class="container">
    <a href="../admin/update" class="action-button">UPDATE MY INFORMATION</a>
    <a href="../admin/delete" class="action-button">DELETE MY ACCOUNT</a>
</div>



</body>
</html>








