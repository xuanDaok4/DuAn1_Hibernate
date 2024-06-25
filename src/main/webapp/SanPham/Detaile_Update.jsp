<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 3/29/2024
  Time: 11:58 AM
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
<form action="/san-pham/update?idSanPham=${sanPham.id}" method="post">
    <div class="mb-3">
        <label  class="form-label">ID</label>
        <input type="text" class="form-control" name="idSanPham" value="${sanPham.id}" readonly>
    </div>
    <div class="mb-3">
        <label  class="form-label">Mã SinhVien</label>
        <input type="text" class="form-control" name="maSanPham" value="${sanPham.maSP}">
    </div>
    <div class="mb-3">
        <label  class="form-label">Tên </label>
        <input type="text" class="form-control"  name="tenSanPham" value="${sanPham.tenSP}">
    </div>

    <label class="form-label">Tên Danh Mục </label>
    <select class="form-select" aria-label="Default select example" name="danhMuc">
        <c:forEach items="${listDanhMuc}" var="lop">
            <option value="${lop.id}"
                    <c:if test="${sanPham.danhMuc.tenDanhMuc == lop.tenDanhMuc}">
                        selected
                    </c:if>
            >${lop.tenDanhMuc}</option>
        </c:forEach>
    </select>

    <%--  Radio--%>
    <div class="row">
        <label  class="form-label col-4">Trạng Thái</label>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Available" name="trangThai"
            <c:if test="${sanPham.trangThai == 'Available'}">
                    checked
            </c:if>
            >
            <label class="form-check-label">
                Available
            </label>
        </div>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Unavailable" name="trangThai"
            <c:if test="${sanPham.trangThai == 'Unavailable'}">
                   checked
            </c:if>
            >
            <label class="form-check-label">
                Unavailable
            </label>
        </div>
    </div>
    <%--  Selection--%>
    <button class="btn btn-info" type="submit">Update</button>
</form>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</html>
