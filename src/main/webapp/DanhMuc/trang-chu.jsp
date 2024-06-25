<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 3/22/2024
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>

<form action="/danh-muc/add" method="post">
    <div class="mb-3">
        <label for="masv" class="form-label">Mã SIze</label>
        <input type="text" class="form-control" id="masv" name="maDanhMuc" value="">
    </div>
    <div class="mb-3">
        <label for="tensv" class="form-label">Tên </label>
        <input type="text" class="form-control" id="tensv" name="tenDanhMuc" value="">
    </div>

    <%--  Radio--%>
    <div class="row">
        <label  class="form-label col-4">Trang Thai</label>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Active" name="trangThai">
            <label class="form-check-label">
                Active
            </label>
        </div>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Inactive" name="trangThai">
            <label class="form-check-label">
                Inactive
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
        <th scope="col">Ma DM</th>
        <th scope="col">Ten DM</th>
        <th scope="col">Trang Thai</th>
        <th scope="col">Ngay Tao</th>
        <th scope="col">Ngay Sua</th>
        <th scope="col">Chưc Nang</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="s">
        <tr>
            <td>${s.id}</td>
            <td>${s.maDanhMuc}</td>
            <td>${s.tenDanhMuc}</td>
            <td>${s.trangThai}</td>
            <td>${s.ngayTao}</td>
            <td>${s.ngaySua}</td>
            <td>
                <a href="/DanhMuc-detail?idDM=${s.id}" class="btn btn-primary">Chi Tiet</a>
                <a href="/DanhMuc-delete?idDM=${s.id}" class="btn btn-primary">Xoa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
