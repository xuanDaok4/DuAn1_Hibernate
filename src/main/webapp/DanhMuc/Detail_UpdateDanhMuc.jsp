<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 3/22/2024
  Time: 12:57 PM
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

<form action="/danh-muc/update?id=${danhMuc.id}" method="post">
    <div class="mb-3">
        <label for="masv1" class="form-label">ID</label>
        <input type="text" class="form-control" id="masv1" name="id" value="${danhMuc.id}">
    </div>
    <div class="mb-3">
        <label for="masv" class="form-label">Mã DanhMuc</label>
        <input type="text" class="form-control" id="masv" name="maDanhMuc" value="${danhMuc.maDanhMuc}">
    </div>
    <div class="mb-3">
        <label for="tensv" class="form-label">Tên </label>
        <input type="text" class="form-control" id="tensv" name="tenDanhMuc" value="${danhMuc.tenDanhMuc}">
    </div>

    <%--  Radio--%>
    <div class="row">
        <label  class="form-label col-4">Trang Thai</label>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Active" name="trangThai"
            <c:if test="${danhMuc.trangThai == 'Active'}">checked</c:if>
            >
            <label class="form-check-label">
                Active
            </label>
        </div>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Inactive" name="trangThai"
                   <c:if test="${danhMuc.trangThai == 'Inactive'}">checked</c:if>
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

