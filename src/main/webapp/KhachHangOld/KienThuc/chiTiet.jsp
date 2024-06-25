
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

</head>
<body class="container">
<h1 class="text-center">Import sinh viên</h1>
<form action="/chitiet-update" method="post">
    <div class="mb-3">
        <label for="masv" class="form-label">Mã SinhVien</label>
        <input type="text" class="form-control" id="masv" name="maSinhVien" value="${sinhVien.maSv}">
    </div>
    <div class="mb-3">
        <label for="tensv" class="form-label">Tên Sv</label>
        <input type="text" class="form-control" id="tensv" name="tenSinhVien" value="${sinhVien.tenSv}">
    </div>
    <div class="mb-3">
        <label for="tuoi" class="form-label">Tuoi</label>
        <input type="number" class="form-control" id="tuoi" name="tuoiSinhVien" value="${sinhVien.tuoi}">
    </div>
    <div class="mb-3">
        <label for="diachi" class="form-label">ĐỊa Chỉ</label>
        <input type="text" class="form-control" id="diachi" name="diachiSinhVien" value="${sinhVien.diaChi}">
    </div>


    <%--  Radio--%>
    <div class="row">
        <label  class="form-label col-4">Giới Tính</label>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Nam" name="gioiTinh"
            <c:if test="${sinhVien.gioiTinh == 'Nam'}">
               checked
            </c:if>
            >
            <label class="form-check-label">
                Nam
            </label>
        </div>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Nu" name="gioiTinh"
            <c:if test="${sinhVien.gioiTinh == 'Nu'}">
                   checked
            </c:if>
            >
            <label class="form-check-label">
                Nu
            </label>
        </div>
    </div>
    <%--  Selection--%>
    <div class="mb-3">
        <label class="form-label">Ten Lớp</label>
        <select class="form-select" aria-label="Default select example" name="tenLop">
            <option selected>Chọn Lớp</option>
            <c:forEach items="${lops}" var="lop">
                <option value="${lop}">${lop}</option>
            </c:forEach>
        </select>
    </div>
    <button class="btn btn-info" type="submit">Update</button>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
