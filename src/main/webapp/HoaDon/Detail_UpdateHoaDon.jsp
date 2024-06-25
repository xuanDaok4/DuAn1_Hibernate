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

<form action="/HoaDon-update?id=${hoaDon.id}" method="post">
    <div class="mb-3">
        <label for="masv1" class="form-label">ID</label>
        <input type="text" class="form-control" id="masv1" name="id" value="${hoaDon.id}">
    </div>
    <div class="mb-3">
        <label for="masv" class="form-label">Dia Chi</label>
        <input type="text" class="form-control" id="masv" name="diaChi" value="${hoaDon.diaChi}">
    </div>
    <div class="mb-3">
        <label for="tensv" class="form-label">SDT </label>
        <input type="number" class="form-control" id="tensv" name="sdt" value="${hoaDon.soDienThoai}">
    </div>

    <label class="form-label">Tên Khach Hang </label>
    <select class="form-select" aria-label="Default select example" name="khachHang">
        <c:forEach items="${listKH}" var="lop">
            <option value="${lop.id}">${lop.hoTen}</option>
                    <c:if test="${hoaDon.khachHang.hoTen == lop.hoTen}">
                        selected
                    </c:if>

        </c:forEach>
    </select>

    <%--  Radio--%>
    <div class="row">
        <label  class="form-label col-4">Trạng Thái</label>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Chua thanh toan" name="trangThai"
            <c:if test="${hoaDon.trangThai == 'Chua thanh toan'}">
                    checked
            </c:if>
            >
            <label class="form-check-label">
                Chua thanh Toan
            </label>
        </div>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Da Thanh Toan" name="trangThai"
            <c:if test="${hoaDon.trangThai == 'Da Thanh Toan'}">
                   checked
            </c:if>
            >
            <label class="form-check-label">
                Da Thanh Toan
            </label>
        </div>
    </div>
    <button class="btn btn-info" type="submit">Update</button>
</form>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
