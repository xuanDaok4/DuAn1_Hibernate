<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 3/25/2024
  Time: 1:22 PM
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

<form action="/khach-hang/add" method="post">
    <div class="mb-3">
        <label for="masv" class="form-label">Họ Tên</label>
        <input type="text" class="form-control" id="masv" name="hoTenKhachHang">
    </div>
    <div class="mb-3">
        <label for="tensv" class="form-label">Địa Chỉ </label>
        <input type="text" class="form-control" id="tensv" name="diaChiKhachHang">
    </div>

    <div class="mb-3">
        <label for="tensvv" class="form-label">Số Điện Thoại </label>
        <input type="number" class="form-control" id="tensvv" name="sdtKhachHang">
    </div>

    <div class="row">
        <label  class="form-label col-4">Trạng Thái</label>
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
        <th scope="col">id</th>
        <th scope="col">Họ tên</th>
        <th scope="col">Địa Chỉ</th>
        <th scope="col">SDT</th>
        <th scope="col">Trạng Thái</th>
        <th scope="col">Ngày Tạo</th>
        <th scope="col">Ngay Sua</th>
        <th scope="col">Chức Năng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listKhachHang}" var="s" varStatus="i">
        <tr>
            <td>${i.index+1}</td>
            <td>${s.id}</td>
            <td>${s.hoTen}</td>
            <td>${s.diaChi}</td>
            <td>${s.sdt}</td>
            <td>${s.trangThai}</td>
            <td>${s.ngayTao}</td>
            <td>${s.ngaySua}</td>
            <td>
                <a href="/khach-hang/delete?idKhachHang=${s.id}" class="btn btn-danger">Xoá</a>
                <a href="/khach-hang-detail?idKhachHang=${s.id}" class="btn btn-danger">Chi Tiết</a>

            </td>
        </tr>
    </c:forEach>
    </tbody
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>

