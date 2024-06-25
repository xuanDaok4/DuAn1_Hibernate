
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>Khách Hàng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="container">
<h1 class="text-center">Hiển thị thông tin Khách Hàng</h1>
<form action="/update-khachhang" method="post">
<div class="mb-3">
    <label for="exampleFormControlInput1" class="form-label">Mã Khách Hang</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="maKhachHang" value="${khachHang.maKH}">
</div>
<div class="mb-3">
    <label for="exampleFormControlInput2" class="form-label">Tên Khách Hàng</label>
    <input type="text" class="form-control" id="exampleFormControlInput2" name="tenKhachHang" value="${khachHang.tenKH}">
</div>

<div class="mb-3">
    <label for="exampleFormControlInput3" class="form-label">Tuổi</label>
    <input type="text" class="form-control" id="exampleFormControlInput3" name="tuoiKhachHang" value="${khachHang.tuoi}">
</div>

<div class="row">
    <label class="col-4">Giới Tính</label>
<div class="form-check col-4">
    <input class="form-check-input" type="radio" value="Nam" name="gioiTinhKhachHang"
    <c:if test="${khachHang.gioiTinh == 'Nam' } ">
            checked
    </c:if>
    >
    <label class="form-check-label" >
        Nam
    </label>
</div>
<div class="form-check col-4">
    <input class="form-check-input" type="radio" value="Nu" name="gioiTinhKhachHang"
    <c:if test="${khachHang.gioiTinh == 'Nu'} ">
           checked
    </c:if>
    >
    <label class="form-check-label" >
        Nu
    </label>
</div>
</div>

<label class="col-4">Trạng Thái</label>
<select class="form-select" aria-label="Default select example" name="trangThaiKhachHang" >
    <c:forEach items="${trangThai}" var="kh">
        <option
                <c:if test="${khachHang.trangThai == kh}">
                    selected
                </c:if>
        >${kh}</option>

    </c:forEach>
</select>
<button type="submit" class="btn btn-danger">Update</button>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
