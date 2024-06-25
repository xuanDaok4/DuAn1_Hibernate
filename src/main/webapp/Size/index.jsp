<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 3/25/2024
  Time: 12:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>  <%--import thư viện vào JSTL--%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

</head>
<body>
<h1>Size</h1>
<form action="/size/add" method="post">
    <div class="mb-3">
        <label for="masv" class="form-label">Mã SIze</label>
        <input type="text" class="form-control" id="masv" name="maSize" value="${size.maSize}">
    </div>
    <div class="mb-3">
        <label for="tensv" class="form-label">Tên </label>
        <input type="text" class="form-control" id="tensv" name="tenSize" value="${size.tenSize}">
    </div>

    <%--  Radio--%>
    <div class="row">
        <label  class="form-label col-4">Trang Thai</label>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="INACTIVE" name="trangThai">
            <label class="form-check-label">
                INACTIVE
            </label>
        </div>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="DEPRECATED" name="trangThai">
            <label class="form-check-label">
                DEPRECATED
            </label>
        </div>
    </div>
    <%--  Selection--%>
    <button class="btn btn-info" type="submit">ADD</button>
</form>
<table class="table">
    <thead>
    <tr>
        <th scope="col">Stt</th>
        <th scope="col">Ma Size</th>
        <th scope="col">Ten</th>
        <th scope="col">Trang Thai</th>
        <th scope="col">Ngay Tao</th>
        <th scope="col">Ngay Sua</th>
        <th scope="col">Chuc Nang</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="s">
        <tr>
            <td>${s.id}</td>
            <td>${s.maSize}</td>
            <td>${s.tenSize}</td>
            <td>${s.trangThai}</td>
            <td>${s.ngayTao}</td>
            <td>${s.ngay_sua}</td>
            <td>
                <a href="/Size-delete?idSize=${s.id}" class="btn btn-primary">Xoa</a>
                <a href="/Size-detail?idSize=${s.id}" class="btn btn-primary">Chi Tiet</a>
            </td>
        </tr>
    </c:forEach>
    </tbody
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
