<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 3/25/2024
  Time: 12:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>  <%--import thư viện vào JSTL--%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

</head>
<body>
<h1>Size</h1>
<form action="/Size-update?id=${size.id}" method="post">
    <div class="mb-3">
        <label for="masvi" class="form-label">ID</label>
        <input type="text" class="form-control" id="masvi" name="id" value="${size.id}">
    </div>
    <div class="mb-3">
        <label for="masv" class="form-label">Mã SIze</label>
        <input type="text" class="form-control" id="masv" name="maSize" value="${size.maSize}">
    </div>
    <div class="mb-3">
        <label for="tensv" class="form-label">Tên </label>
        <input type="text" class="form-control" id="tensv" name="tenSize" value="${size.tenSize}">
    </div>

    <%--  Radio--%>
    <div class="row">
        <label  class="form-label col-4">Trang Thai</label>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="INACTIVE" name="trangThai"
            <c:if test="${size.trangThai == 'INACTIVE'}">
                    checked
            </c:if>
            >
            <label class="form-check-label">
                INACTIVE
            </label>
        </div>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="DEPRECATED" name="trangThai"
            <c:if test="${size.trangThai == 'DEPRECATED'}">
                   checked
            </c:if>
            >
            <label class="form-check-label">
                DEPRECATED
            </label>
        </div>
    </div>
    <%--  Selection--%>
    <button class="btn btn-info" type="submit">Update</button>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
