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

<form action="/ChiTietSanPham-update?id=${chiTietSanPham.id}" method="post">
    <div class="mb-3">
        <label for="masvid" class="form-label">ID</label>
        <input type="text" class="form-control" id="masvid" name="id" value="${chiTietSanPham.id}">
    </div>
    <div class="mb-3">
        <label for="masv" class="form-label">Giá Bán</label>
        <input type="text" class="form-control" id="masv" name="giaBan" value="${chiTietSanPham.giaBan}">
    </div>
    <div class="mb-3">
        <label for="tensv" class="form-label">Số Lượng </label>
        <input type="text" class="form-control" id="tensv" name="soLuong" value="${chiTietSanPham.soLuong}">
    </div>

    <label for="tensv" class="form-label">Tên Màu Sắc </label>
    <select class="form-select" aria-label="Default select example" name="mauSac">
        <c:forEach items="${listMauSac}" var="lop">
            <option value="${lop.id}"
            <c:if test="${chiTietSanPham.mauSac.tenMau == lop.tenMau}">
                selected
            </c:if>
                    >${lop.tenMau}</option>
        </c:forEach>
    </select>

    <label for="tensv" class="form-label">Tên SIZe </label>
    <select class="form-select" aria-label="Default select example" name="size">
        <c:forEach items="${listSize}" var="lops">
            <option value="${lops.id}"
                    <c:if test="${chiTietSanPham.size.tenSize == lops.tenSize}">
                        selected
                    </c:if>
            >${lops.tenSize}</option>
        </c:forEach>
    </select>

    <label for="tensv" class="form-label">Tên Sản Phẩm </label>
    <select class="form-select" aria-label="Default select example" name="sanPham">
        <c:forEach items="${listSP}" var="lopa">
            <option value="${lopa.id}"
                    <c:if test="${chiTietSanPham.sanPham.tenSP == lopa.tenSP}">
                        selected
                    </c:if>
            >${lopa.tenSP}</option>
        </c:forEach>
    </select>

    <%--  Radio--%>
    <div class="row">
        <label  class="form-label col-4">Trạng Thái</label>

        <div class="form-check col-2">
            <input class="form-check-input" type="radio" value="DEPRECATED" name="trangThai"
            <c:if test="${chiTietSanPham.trangThai == 'DEPRECATED'}">
                   checked
            </c:if>
            >
            <label class="form-check-label">
                DEPRECATED
            </label>
        </div>

        <div class="form-check col-2">
            <input class="form-check-input" type="radio" value="INACTIVE" name="trangThai"
            <c:if test="${chiTietSanPham.trangThai == 'INACTIVE'}">
                   checked
            </c:if>
            >
            <label class="form-check-label">
                INACTIVE
            </label>
        </div>

        <div class="form-check col-2">
            <input class="form-check-input" type="radio" value="ACTIVE" name="trangThai"
            <c:if test="${chiTietSanPham.trangThai == 'ACTIVE'}">
                   checked
            </c:if>
            >
            <label class="form-check-label">
                ACTIVE
            </label>
        </div>
    </div>
    <%--  Selection--%>
    <button class="btn btn-info" type="submit">Update</button>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
