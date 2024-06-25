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

<form action="HoaDon-add" method="post">
    <div class="mb-3">
        <label for="masv" class="form-label">Dia Chi</label>
        <input type="text" class="form-control" id="masv" name="diaChi">
    </div>
    <div class="mb-3">
        <label for="tensv" class="form-label">SDT </label>
        <input type="number" class="form-control" id="tensv" name="sdt">
    </div>

    <label for="tensv" class="form-label">Tên Khach Hang </label>
    <select class="form-select" aria-label="Default select example" name="khachHang">
        <c:forEach items="${listKH}" var="lop">
            <option value="${lop.id}">${lop.hoTen}</option>
        </c:forEach>
    </select>

    <%--  Radio--%>
    <div class="row">
        <label  class="form-label col-4">Trạng Thái</label>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Chua Thanh Toan" name="trangThai"
<%--            <c:if test="${}"--%>
<%--            >--%>
            <label class="form-check-label">
                Chua Thanh Toan
            </label>
        </div>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Da Thanh Toan" name="trangThai">
            <label class="form-check-label">
                Da Thanh Toan
            </label>
        </div>
    </div>
    <%--  Selection--%>
    <button class="btn btn-info" type="submit">ADD</button>
</form>

<table class="table">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Ten KH</th>
        <th scope="col">Dia Chi</th>
        <th scope="col">SDT</th>
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
            <td>${s.khachHang.hoTen}</td>
            <td>${s.diaChi}</td>
            <td>${s.soDienThoai}</td>
            <td>${s.trangThai}</td>
            <td>${s.ngayTao}</td>
            <td>${s.ngaySua}</td>
            <td>
                <a href="/HoaDon-delete?idHoaDon=${s.id}" class="btn btn-primary">Xoa</a>
                <a href="/HoaDon-detail?idHoaDon=${s.id}" class="btn btn-primary">Chi Tiet</a>
            </td>
        </tr>
    </c:forEach>
    </tbody
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
