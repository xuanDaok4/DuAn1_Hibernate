<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 3/13/2024
  Time: 2:48 PM
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
<form action="/NhanVien" method="post">
    <div class="mb-3">
        <label for="manv" class="form-label">Mã Nhân Viên</label>
        <input type="text" class="form-control" id="manv" name="maNhanVien">
    </div>
    <div class="mb-3">
        <label for="tennv" class="form-label">Tên Nhân Viên</label>
        <input type="text" class="form-control" id="tennv" name="tenNhanVien">
    </div>
    <div class="mb-3">
        <label for="tuoi" class="form-label">Tuổi</label>
        <input type="number" class="form-control" id="tuoi" name="tuoiNhanVien">
    </div>

    <div class="row">
        <label class="col-4">Giới Tính</label>
    <div class="form-check col-4">
        <input class="form-check-input" type="radio" value="Nam" name="gioiTinhNhanVien">
        <label class="form-check-label" >
           Nam
        </label>
    </div>
    <div class="form-check col-4">
        <input class="form-check-input" type="radio" value="Nu" name="gioiTinhNhanVien">
        <label class="form-check-label">
            Nu
        </label>
    </div>
    </div>

    <div class="mb-3">
    <label>Chức vu</label>
    <select class="form-select" aria-label="Default select example" name="chucVuNhanVien">
       <c:forEach items="${chucVuNhanVien}" var="cv">
           <option>${cv}</option>
       </c:forEach>

    </select>
    </div>
    <button class="btn btn-danger" type="submit">Thêm Nhân Viên</button>
</form>

<table class="table">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Mã Nhân Viên</th>
        <th scope="col">Tên Nhân Viên</th>
        <th scope="col">Tuổi</th>
        <th scope="col">Giới Tính</th>
        <th scope="col">Chức Vụ</th>
        <th scope="col">Thao Tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listNhanVien}" var="nv" varStatus="i">
    <tr>
        <td>${i.index+1}</td>
        <td>${nv.maNv}</td>
        <td>${nv.tenNv}</td>
        <td>${nv.tuoi}</td>
         <td>${nv.gioiTinh}</td>
         <td>${nv.chucVu}</td>
        <td>
            <a href="/chitiet?id=${nv.maNv}" class="btn btn-danger">Chi Tiết Nhân Viên</a>
            <a href="/xoa?id=${nv.maNv}" class="btn btn-info">Xoa</a>
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
