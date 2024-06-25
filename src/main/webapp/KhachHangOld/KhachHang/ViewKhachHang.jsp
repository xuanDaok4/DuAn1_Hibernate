<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 3/19/2024
  Time: 10:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="container">
<h1 class="text-center">Hiển thị thông tin Khách Hàng</h1>
<form action="/KhachHangServlet" method="post">
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Mã Khách Hang</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="maKhachHang" >
</div>
<div class="mb-3">
    <label for="exampleFormControlInput2" class="form-label">Tên Khách Hàng</label>
    <input type="text" class="form-control" id="exampleFormControlInput2" name="tenKhachHang">
</div>

<div class="mb-3">
    <label for="exampleFormControlInput3" class="form-label">Tuổi</label>
    <input type="text" class="form-control" id="exampleFormControlInput3" name="tuoiKhachHang" >
</div>

<div class="row">
    <label class="col-4">Giới Tính</label>
    <div class="form-check col-4">
        <input class="form-check-input" value="Nam" type="radio" name="gioiTinhKhachHang" >
        <label class="form-check-label">
            Nam
        </label>
    </div>
    <div class="form-check col-4">
        <input class="form-check-input" value="Nu" type="radio" name="gioiTinhKhachHang" >
        <label class="form-check-label" >
            Nu
        </label>
    </div>
</div>

<label class="col-4">Trạng Thái</label>
<select class="form-select" aria-label="Default select example" name="trangThaiKhachHang">
  <c:forEach items="${trangThai}" var="kh">
      <option>${kh}</option>

  </c:forEach>


</select>

    <button type="submit" class="btn btn-danger">Thêm</button>
</form>
<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Mã KH</th>
        <th scope="col">Tên Kh</th>
        <th scope="col">Tuổi</th>
        <th scope="col">Giới Tính</th>
        <th scope="col">Trạng Thái</th>
        <th scope="col">Thao Tác</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listKhachHang}" var="kh" varStatus="i">
    <tr>
        <th scope="row">${i.index+1}</th>
        <td>${kh.maKH}</td>
        <td>${kh.tenKH}</td>
        <td>${kh.tuoi}</td>
        <td>${kh.gioiTinh}</td>
        <td>${kh.trangThai}</td>
        <td>
            <a href="/chitietKhachHang?id=${kh.maKH}" class="btn btn-info">Chi tiết</a>
            <a href="/xoa-khachhang?id=${kh.maKH}" class="btn btn-info">Xoá</a>
        </td>
    </tr>
    </tbody>
    </c:forEach>
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
