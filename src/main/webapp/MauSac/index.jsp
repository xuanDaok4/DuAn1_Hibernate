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
<form action="/mau-sac-add" method="post">
    <div class="mb-3">
        <label for="masv" class="form-label">Ma Mau</label>
        <input type="text" class="form-control" id="masv" name="maMau">
    </div>
    <div class="mb-3">
        <label for="tensv" class="form-label">Tên </label>
        <input type="text" class="form-control" id="tensv" name="tenMau">
    </div>
    <%--  Radio--%>
    <div class="row">
        <label  class="form-label col-2">Trạng Thái</label>
        <div class="form-check col-4">
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
    </div>
    <%--  Selection--%>
    <button class="btn btn-info" type="submit">ADD</button>
</form>
<table class="table">
    <thead>
    <tr>
        <th scope="col">Stt</th>
        <th scope="col">Ma Mau</th>
        <th scope="col">Ten</th>
        <th scope="col">Trang Thai</th>
        <th scope="col">Ngay Tao</th>
        <th scope="col">Ngay Sua</th>
        <th scope="col">Thao tac</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="s">
        <tr>
            <td>${s.id}</td>
            <td>${s.maMau}</td>
            <td>${s.tenMau}</td>
            <td>${s.trangThai}</td>
            <td>${s.ngaySua}</td>
            <td>${s.ngayTao}</td>
            <td>
                <a href="/mau-sac-detail?idMauSac=${s.id}" class="btn btn-info">Chi Tiet</a>
                <a href="/mau-sac-delete?id=${s.id}" class="btn btn-info">Xoa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
