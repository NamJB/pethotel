<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>달력 예약 페이지</title>
<style>
       /* 스타일 조정 및 추가 */
       .calendar-container {
           display: flex;
           justify-content: center;
           align-items: flex-start;
           gap: 20px; /* 두 달력 사이 간격 */
       }

       .calendar-day {
           width: 50px;
           height: 50px;
           text-align: center;
           vertical-align: middle;
           cursor: pointer;
       }

       .selected {
           background-color: #4285F4;
           color: white;
           border-radius: 50%;
       }

       .in-range {
           background-color: #E3F2FD;
       }

       #selectedDates {
           margin-top: 20px;
           font-weight: bold;
       }

       #roomList {
           display: none;
           margin-top: 20px;
       }

       .container {
           background-color: white;
           padding: 20px;
           box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
       }

       .calendar {
           width: 100%;
           border-collapse: collapse;
       }

       .calendar caption {
           font-weight: bold;
           margin-bottom: 10px;
       }

       .calendar td {
           padding: 5px;
           border: 1px solid #ccc;
       }

       .calendar td a {
           text-decoration: none;
           color: #4285F4;
       }

       #roomList table {
           width: 100%;
           border-collapse: collapse;
           margin-top: 20px;
       }

       #roomList table caption {
           font-size: 18px;
           margin-bottom: 10px;
           text-align: left;
       }

       #roomList table td {
           padding: 10px;
           text-align: center;
           border: 1px solid #ccc;
       }

       #roomList table img {
           width: 100px;
           height: 80px;
       }

       .button-container {
           text-align: center;
           margin-top: 20px;
       }

       .button-container input {
           padding: 10px 20px;
           background-color: #333;
           color: white;
           border: none;
           cursor: pointer;
           font-size: 16px;
       }

       .button-container input:hover {
           background-color: #555;
       }
   </style>
   <script>
           // JavaScript code remains unchanged
           var startDate = null;
           var endDate = null;

           function clearSelections() {
               const days = document.querySelectorAll('.calendar-day');
               days.forEach(day => {
                   day.classList.remove('selected');
                   day.classList.remove('in-range');
               });
           }
           
           function selectDate(element, year, month, day) {
               var selectedDate = new Date(year, month - 1, day);

               if (!startDate || (startDate && endDate)) {
                   clearSelections();
                   startDate = selectedDate;
                   endDate = null;
                   element.classList.add('selected');
                   document.getElementById('startDate').value = formatDate(selectedDate);
                   document.getElementById('selectedDates').textContent = "선택된 날짜: " + formatDate(selectedDate);
               } else if (!endDate) {
                   endDate = selectedDate;
                   if (startDate > endDate) {
                       [startDate, endDate] = [endDate, startDate];
                   }
                   element.classList.add('selected');
                   highlightRange();
                   document.getElementById('endDate').value = formatDate(selectedDate);
                   document.getElementById('selectedDates').textContent = "선택된 날짜: " + formatDate(startDate) + " ~ " + formatDate(endDate);
               }
           }

           function highlightRange() {
               var days = document.querySelectorAll('.calendar-day');
               days.forEach(day => {
                   var dayDate = new Date(day.getAttribute('data-year'), day.getAttribute('data-month') - 1, day.getAttribute("data-day"));
                   if (dayDate > startDate && dayDate < endDate) {
                       day.classList.add('in-range');
                   }
               });
           }

           function formatDate(date) {
               var year = date.getFullYear();
               var month = ('0' + (date.getMonth() + 1)).slice(-2);
               var day = ('0' + date.getDate()).slice(-2);
               return year + "-" + month + "-" + day;
           }

           function roomshow() {
               var startDateValue = document.getElementById('startDate').value;
               var endDateValue = document.getElementById('endDate').value;

               if (!startDateValue || !endDateValue) {
                   alert("날짜를 선택하세요.");
                   return;
               }

               var dayDifference = calculateDateDifference();
               document.getElementById('dayDifference').value = dayDifference;
               document.getElementById('dateDifference').textContent = "총 예약 기간: " + dayDifference + "일";

               var roomList = document.getElementById('roomList');
               roomList.style.display = "block";
           }

           function calculateDateDifference() {
               if (startDate && endDate) {
                   var timeDifference = endDate - startDate; 
                   var dayDifference = timeDifference / (1000 * 60 * 60 * 24);
                   return Math.round(dayDifference);
               } else {
                   return 0;
               }
           }

           function submitRoomForm(roomid, title, price) {
               document.getElementById('roomid').value = roomid;
               document.getElementById('roomSelectionForm').submit();
           }
       </script>
	   </head>
<body>

	<!-- 메인 컨테이너 -->
	    <div class="container">
	        <div class="calendar-container">
	            <!-- 첫 번째 달력 -->
	            <table class="calendar">
	                <caption>
	                    <c:choose>
	                        <c:when test="${month == 1}">
	                            <a href="reserve?year=${year-1}&month=12"> 이전 </a>
	                        </c:when>
	                        <c:otherwise>
	                            <a href="reserve?year=${year}&month=${month-1}"> 이전 </a>
	                        </c:otherwise>
	                    </c:choose>
	                    ${year}년 ${month}월
	                </caption>
	                <tr>
	                    <td>일</td>
	                    <td>월</td>
	                    <td>화</td>
	                    <td>수</td>
	                    <td>목</td>
	                    <td>금</td>
	                    <td>토</td>
	                </tr>
	                <c:forEach begin="1" end="${ju}" var="i">
	                    <tr>
	                        <c:forEach begin="0" end="6" var="j">
	                            <c:if test="${ (i==1 && j<yoil) || day>lastday }">
	                                <td></td>
	                            </c:if>
	                            <c:if test="${ !((i==1 && j<yoil) || day>lastday) }">
	                                <td class="calendar-day" data-year="${year}" data-month="${month}" data-day="${day}" 
	                                    onclick="selectDate(this, '${year}', '${month}', '${day}')">
	                                    ${day}
	                                </td>
	                                <c:set var="day" value="${day+1}"/>
	                            </c:if>
	                        </c:forEach>
	                    </tr>
	                </c:forEach>
	            </table>

	            <!-- 두 번째 달력 -->
	            <table class="calendar">
	                <caption>
	                    <c:set var="nextMonth" value="${month == 12 ? 1 : month + 1}"/>
	                    <c:set var="nextYear" value="${month == 12 ? year + 1 : year}"/>
	                    ${nextYear}년 ${nextMonth}월

	                    <c:choose>
	                        <c:when test="${month == 12}">
	                            <a href="reserve?year=${year+1}&month=1"> 다음 </a>
	                        </c:when>
	                        <c:otherwise>
	                            <a href="reserve?year=${year}&month=${month+1}"> 다음 </a>
	                        </c:otherwise>
	                    </c:choose>
	                </caption>
	                <tr>
	                    <td>일</td>
	                    <td>월</td>
	                    <td>화</td>
	                    <td>수</td>
	                    <td>목</td>
	                    <td>금</td>
	                    <td>토</td>
	                </tr>
	                <c:forEach begin="1" end="${juNext}" var="i">
	                    <tr>
	                        <c:forEach begin="0" end="6" var="j">
	                            <c:if test="${ (i==1 && j<nextYoil) || nextDay>nextLastDay }">
	                                <td></td>
	                            </c:if>
	                            <c:if test="${ !((i==1 && j<nextYoil) || nextDay>nextLastDay) }">
	                                <td class="calendar-day" data-year="${nextYear}" data-month="${nextMonth}" data-day="${nextDay}" 
	                                    onclick="selectDate(this, '${nextYear}', '${nextMonth}', '${nextDay}')">
	                                    ${nextDay}
	                                </td>
	                                <c:set var="nextDay" value="${nextDay+1}"/>
	                            </c:if>
	                        </c:forEach>
	                    </tr>
	                </c:forEach>
	            </table>
	        </div>

	        <!-- 선택한 날짜를 표시하는 영역 -->
	        <div id="selectedDates">선택된 날짜: 없음</div>

	        <!-- 방 목록 보기 버튼 -->
	        <div class="button-container">
	            <input type="button" value="방 목록 보기" onclick="roomshow()">
	        </div>

	        <!-- 방 목록을 표시하는 섹션 -->
	        <section>
	            <div id="roomList">
	                <table>
	                    <caption>예약 가능한 방 목록</caption>
	                    <div id="dateDifference">총 예약 기간: 0일</div>
	                    <tr>
	                        <td>방 사진</td>
	                        <td>방 호수</td>
	                        <td>가격</td>
	                        <td>객실 선택</td>
	                    </tr>
	                    <c:forEach items="${rdto}" var="rdto">
	                        <tr>
	                            <td><img src="/rooms/${rdto.rimgPaths}" alt="방 사진"></td>
	                            <td>${rdto.title}</td>
	                            <td>${rdto.price}</td>
	                            <td>
	                                <button type="button" onclick="submitRoomForm('${rdto.roomid}', '${rdto.title}', '${rdto.price}')">예약하기</button>
	                            </td>
	                        </tr>
	                    </c:forEach>
	                </table>

	                <!-- 방 선택 후 폼을 동적으로 제출 -->
	                <form id="roomSelectionForm" method="post" action="reserveContent">
	                    <input type="hidden" id="roomid" name="roomid">
	                    <input type="hidden" id="startDate" name="startDate">
	                    <input type="hidden" id="endDate" name="endDate">
	                    <input type="hidden" id="dayDifference" name="dayDifference">
	                </form>
	            </div>
	        </section>
	    </div>


</body>
</html>