<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    #username {
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
</style>

</head>
<body>

 <div class="container">
    <h2 id="username">${sessionScope.username}님</h2>
 </div>
 <table>
    <thead>
     <tr>
       <th>QUESTIONS</th>
       <th>CREATE_AT</th>
      </tr>
    </thead>
    <tr>
       <td>${ title }</td>
       <td>${ time }</td>
    </tr>
 </table>

</body>
</html>