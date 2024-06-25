<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 3/25/2024
  Time: 4:21 PM
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
<form action="/mau-sac-update?id=${mauSacDetail.id}" method="post">
    <div class="mb-3">
        <label for="masv1" class="form-label">Ma Mau</label>
        <input type="text" class="form-control" id="masv1" name="maMau" value="${mauSacDetail.id}">
    </div>
    <div class="mb-3">
        <label for="masv" class="form-label">Ma Mau</label>
        <input type="text" class="form-control" id="masv" name="maMau" value="${mauSacDetail.maMau}">
    </div>
    <div class="mb-3">
        <label for="tensv" class="form-label">Tên </label>
        <input type="text" class="form-control" id="tensv" name="tenMau" value="${mauSacDetail.tenMau}">
    </div>
    <%--  Radio--%>
    <div class="row">
        <label  class="form-label col-2">Trạng Thái</label>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="DEPRECATED" name="trangThai"
            <c:if test="${mauSacDetail.trangThai == 'DEPRECATED'}">
                checked
            </c:if>
            ><label class="form-check-label">
                DEPRECATED
            </label>
        </div>
        <div class="form-check col-2">
            <input class="form-check-input" type="radio" value="INACTIVE" name="trangThai"
            <c:if test="${mauSacDetail.trangThai == 'INACTIVE'}">
                   checked
            </c:if>
            >
            <label class="form-check-label">
                INACTIVE
            </label>
        </div>
        <div class="form-check col-2">
            <input class="form-check-input" type="radio" value="ACTIVE" name="trangThai"
            <c:if test="${mauSacDetail.trangThai == 'ACTIVE'}">
                   checked
            </c:if>
            >
            <label class="form-check-label">
                ACTIVE
            </label>
        </div>
    </div>
    </div>
    <%--  Selection--%>
    <button class="btn btn-info" type="submit">Update</button>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>

