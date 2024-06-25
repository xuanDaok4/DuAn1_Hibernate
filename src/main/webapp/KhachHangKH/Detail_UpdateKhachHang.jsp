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

<form action="/khach-hang/update?idKhachHang=${khachHang.id}" method="post">
    <div class="mb-3">
        <label for="masvư" class="form-label">ID</label>
        <input type="text" class="form-control" id="masvư" name="idKhachHang" value="${khachHang.id}">
    </div>
    <div class="mb-3">
        <label for="masv" class="form-label">Họ Tên</label>
        <input type="text" class="form-control" id="masv" name="hoTenKhachHang" value="${khachHang.hoTen}">
    </div>
    <div class="mb-3">
        <label for="tensv" class="form-label">Địa Chỉ </label>
        <input type="text" class="form-control" id="tensv" name="diaChiKhachHang" value="${khachHang.diaChi}">
    </div>

    <div class="mb-3">
        <label for="tensvv" class="form-label">Số Điện Thoại </label>
        <input type="number" class="form-control" id="tensvv" name="sdtKhachHang" value="${khachHang.sdt}">
    </div>
    <div class="row">
        <label  class="form-label col-4">Trạng Thái</label>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Active" name="trangThai"
            <c:if test="${khachHang.trangThai == 'Active'}">
                    checked
            </c:if>
            >
            <label class="form-check-label">
                Active
            </label>
        </div>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Inactive" name="trangThai"
            <c:if test="${khachHang.trangThai == 'Inactive'}">
                   checked
            </c:if>
            >
            <label class="form-check-label">
                Inactive
            </label>
        </div>
    </div>
    <%--  Selection--%>
    <button class="btn btn-info" type="submit">Update</button>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>

