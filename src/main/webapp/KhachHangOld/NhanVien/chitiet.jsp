
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="container">
<form action="/chitiet-update-nhanvien" method="post">
    <div class="mb-3">
        <label for="manv" class="form-label">Mã Nhân Viên</label>
        <input type="text" class="form-control" id="manv" name="maNhanVien" value="${nhanVien.maNv}" readonly>
    </div>
    <div class="mb-3">
        <label for="tennv" class="form-label">Tên Nhân Viên</label>
        <input type="text" class="form-control" id="tennv" name="tenNhanVien" value="${nhanVien.tenNv}">
    </div>
    <div class="mb-3">
        <label for="tuoi" class="form-label">Tuổi</label>
        <input type="number" class="form-control" id="tuoi" name="tuoiNhanVien" value="${nhanVien.tuoi}">
    </div>


    <div class="row" >
        <label class="col-4">Giới tính</label>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Nam" name="gioiTinhNhanVien"
            <c:if test="${nhanVien.gioiTinh == 'Nam'}">
                    checked
            </c:if>
            >
            <label class="form-check-label" >
                Nam
            </label>
        </div>
        <div class="form-check col-4">
            <input class="form-check-input" type="radio" value="Nu" name="gioiTinhNhanVien"
            <c:if test="${nhanVien.gioiTinh == 'Nu' }">
                   checked
            </c:if>
            >
            <label class="form-check-label">
                Nu
            </label>
        </div>
    </div>

    <div class="mb-3">
        <label>Chức vu</label>
        <select class="form-select" aria-label="Default select example" name="chucVuNhanVien" value="${nhanVien.chucVu}">
            <c:forEach items="${chucVuNhanVien}" var="cv">
                <option
                        <c:if test="${nhanVien.chucVu == cv }">
                            selected
                        </c:if>
                >${cv}</option>
            </c:forEach>

        </select>
    </div>
    <button class="btn btn-danger" type="submit">UpdateNhân Viên</button>
</form>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
