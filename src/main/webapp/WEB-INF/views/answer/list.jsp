<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    .container {
        width: 80%;
        margin: 20px auto;
        padding: 2px;
        background-color: white;
        box-shadow: 0 0 10px rgba(0, 0, 0, 1);
    }
    #title {
        text-align: center;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 12px;
        text-align: left;
    }
    th {
        background-color: #333;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #ddd;
    }
    tr a {
        display: block;
        color: inherit;
        text-decoration: none;
    }
	.action-buttons {
	    width: 100%;
	}
	.action-buttons form {
	    margin: 0;
	    padding: 0;
	}
	.action-buttons input[type="submit"] {
	    width: 100%;
	    padding: 15px;
	    background-color: #808080;
	    color: white;
	    border: none;
	    cursor: pointer;
	    font-size: 16px;
	    text-align: center;
	}
	.action-buttons input[type="submit"]:hover {
	    background-color: #A9A9A9; /* 커서를 올렸을 때 색상 변화 */
	}</style>
</head>
<body>
<div class="container">
    <h2 id="title">Q&A -- LIST</h2>
 </div>
  <table>
        <thead>
            <tr>
                <th>USER--ID</th>
                <th>QUESTIONS</th>
                <th>CREATE_AT</th>
                <th>ANSWER</th>
				<th>DELETE</th>
            </tr>
        </thead>
        <tbody>
         <c:forEach var="qnaList"  items="${ allList }">
            <tr>
                <td><a href="../answer/content?id=${qnaList.id}">${ qnaList.userid }</a></td>
                <td><a href="../answer/content?id=${qnaList.id}">${ qnaList.title }</a></td>
                <td><a href="../answer/content?id=${qnaList.id}">${ qnaList.qtime }</a></td>
				<td>${ qnaList.acontent == null ? "no answer" : "done" }</td>
                <td>
					<form action="/question/delete" method="post" style="display:inline;">
					   <input type="hidden" name="questionId" value="${qnaList.id}">
					   <input type="submit" value="DELETE">
				    </form>				
				</td>
            </tr>
         </c:forEach>
        </tbody>
 </table>
 
   
</body>
</html>