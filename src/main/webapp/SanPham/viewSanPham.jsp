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

<form action="" method="post">
    <div class="mb-3">
        <label for="masv" class="form-label">Mã SinhVien</label>
        <input type="text" class="form-control" id="masv" name="maSanPham">
    </div>
    <div class="mb-3">
        <label for="tensv" class="form-label">Tên </label>
        <input type="text" class="form-control" id="tensv" name="tenSanPham">
    </div>

    <label for="tensv" class="form-label">Tên Danh Mục </label>
    <select class="form-select" aria-label="Default select example" name="danhMuc">
        <c:forEach items="${listDanhMuc}" var="lop">
        <option selected></option>
        <option value="${lop.id}">${lop.tenDanhMuc}</option>
        </c:forEach>
    </select>

    <%--  Radio--%>
    <div class="row">
        <label  class="form-label col-4">Trạng Thái</label>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Available" name="trangThai">
            <label class="form-check-label">
                Available
            </label>
        </div>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Unavailable" name="trangThai">
            <label class="form-check-label">
                Unavailable
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
        <th scope="col">Ma SP</th>
        <th scope="col">Ten SP</th>
        <th scope="col">Ten DanhMuc</th>
        <th scope="col">Trang Thai</th>
        <th scope="col">Ngay Tao</th>
        <th scope="col">Ngay Sua</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="s">
        <tr>
            <td>${s.id}</td>
            <td>${s.maSP}</td>
            <td>${s.tenSP}</td>
            <td>${s.danhMuc.tenDanhMuc}</td>
            <td>${s.trangThai}</td>
            <td>${s.ngayTao}</td>
            <td>${s.ngaySua}</td>
            <td>
                <a href="/san-pham/delete?id=${s.id}" class="btn btn-danger">Xoá</a>
                <a href="/san-pham/detaile?id=${s.id}" class="btn btn-danger">Chi Tiết</a>

            </td>
        </tr>
    </c:forEach>
    </tbody
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
