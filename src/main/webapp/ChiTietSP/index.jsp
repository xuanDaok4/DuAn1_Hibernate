<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 3/26/2024
  Time: 12:09 AM
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

<form action="/ChiTietSanPham-add" method="post">
    <div class="mb-3">
        <label for="masv" class="form-label">Giá Bán</label>
        <input type="text" class="form-control" id="masv" name="giaBan">
    </div>
    <div class="mb-3">
        <label for="tensv" class="form-label">Số Lượng </label>
        <input type="text" class="form-control" id="tensv" name="soLuong">
    </div>

    <label for="tensv" class="form-label">Tên Màu Sắc </label>
    <select class="form-select" aria-label="Default select example" name="mauSac">
        <c:forEach items="${listMauSac}" var="lop">
            <option value="${lop.id}">${lop.tenMau}
            </option>
        </c:forEach>
    </select>

    <label for="tensv" class="form-label">Tên SIZe </label>
    <select class="form-select" aria-label="Default select example" name="size">
        <c:forEach items="${listSize}" var="lops">
            <option value="${lops.id}">${lops.tenSize}</option>
        </c:forEach>
    </select>

    <label for="tensv" class="form-label">Tên Sản Phẩm </label>
    <select class="form-select" aria-label="Default select example" name="sanPham">
        <c:forEach items="${listSP}" var="lopa">
            <option value="${lopa.id}">${lopa.tenSP}</option>
        </c:forEach>
    </select>

    <%--  Radio--%>
    <div class="row">
        <label  class="form-label col-4">Trạng Thái</label>

        <div class="form-check col-2">
            <input class="form-check-input" type="radio" value="DEPRECATED" name="trangThai">
            <label class="form-check-label">
         DEPRECATED
            </label>
        </div>

        <div class="form-check col-2">
            <input class="form-check-input" type="radio" value="INACTIVE" name="trangThai">
            <label class="form-check-label">
                INACTIVE
            </label>
        </div>

    <div class="form-check col-2">
        <input class="form-check-input" type="radio" value="ACTIVE" name="trangThai">
        <label class="form-check-label">
        ACTIVE
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
        <th scope="col">Gia Ban</th>
        <th scope="col">SoLuong</th>
        <th scope="col">Trang Thai</th>
        <th scope="col">Ngay Tao</th>
        <th scope="col">Ngay Sua</th>
        <th scope="col">Tên Màu</th>
        <th scope="col">Tên Size</th>
        <th scope="col">Tên Sản Phẩm</th>
        <th scope="col">Tên Danh Mục</th>
        <th scope="col">Chuc nang</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="s">
        <tr>
            <td>${s.id}</td>
            <td>${s.giaBan}</td>
            <td>${s.soLuong}</td>
            <td>${s.trangThai}</td>
            <td>${s.ngayTao}</td>
            <td>${s.ngaySua}</td>
            <td>${s.mauSac.tenMau}</td>
            <td>${s.size.tenSize}</td>
            <td>${s.sanPham.tenSP}</td>
            <td>${s.sanPham.danhMuc.tenDanhMuc}</td>
            <td>
                <a href="/ChiTietSanPham-detaill?idChiTiet=${s.id}" class="btn btn-danger">Chi Tiet</a>
                <a href="/ChiTietSanPham-delete?id=${s.id}" class="btn btn-danger">Xoa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody
</table>
</body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
