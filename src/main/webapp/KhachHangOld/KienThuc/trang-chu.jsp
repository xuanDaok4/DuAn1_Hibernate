<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 3/8/2024
  Time: 1:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>  <%--import thư viện vào JSTL--%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="container">
<h1>Trang chủ</h1>
<p>Chào mừng đến với bình nguyên vô tận</p>

<h1>Họ và tên : ${sinhVien.tenSv}</h1>
<h1>Tuổi : ${sinhVien.tuoi}</h1>
<h1>Địa Chỉ : ${sinhVien.diaChi}</h1>

<h1>Họ và tên : ${name}</h1>
<h1>Tuổi : ${tuoi}</h1>
<h1>Địa Chỉ : ${diaChi}</h1>
<img src="${img}" alt="">


<h1>Danh sách sinh viên</h1>

<table class="table">
    <thead>
    <tr>
        <th scope="col">Stt</th>
        <th scope="col">Ten SV</th>
        <th scope="col">Tuoi</th>
        <th scope="col">Đia Chi</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listSinhVien}" var="s" varStatus="i">
    <tr>
        <td>${i.index+1}</td>
        <td>${s.tenSv}</td>
        <td>${s.tuoi}</td>
        <td>${s.diaChi}</td>
    </tr>
    </c:forEach>
    </tbody
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
