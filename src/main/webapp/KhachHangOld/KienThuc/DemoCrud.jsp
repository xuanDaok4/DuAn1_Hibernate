<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 3/13/2024
  Time: 12:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>  <%--import thư viện vào JSTL--%>

<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>

<body class="container">
<h1 class="text-center">Import sinh viên</h1>
<form action="/DemoCrud" method="post">
  <div class="mb-3">
    <label for="masv" class="form-label">Mã SinhVien</label>
    <input type="text" class="form-control" id="masv" name="maSinhVien">
  </div>
  <div class="mb-3">
    <label for="tensv" class="form-label">Tên Sv</label>
    <input type="text" class="form-control" id="tensv" name="tenSinhVien">
  </div>
  <div class="mb-3">
    <label for="tuoi" class="form-label">Tuoi</label>
    <input type="number" class="form-control" id="tuoi" name="tuoiSinhVien">
  </div>
  <div class="mb-3">
    <label for="diachi" class="form-label">ĐỊa Chỉ</label>
    <input type="text" class="form-control" id="diachi" name="diachiSinhVien">
  </div>


  <%--  Radio--%>
 <div class="row">
  <label  class="form-label col-4">Giới Tính</label>
  <div class="form-check col-4">
    <input class="form-check-input" type="radio" value="Nam" name="gioiTinh" >
    <label class="form-check-label">
      Nam
    </label>
  </div>
  <div class="form-check col-4">
    <input class="form-check-input" type="radio" value="Nu" name="gioiTinh">
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
<button class="btn btn-info" type="submit">Submit</button>
</form>


<table class="table">
  <thead>
  <tr>
    <th scope="col">Stt</th>
    <th scope="col">Ma SV</th>
    <th scope="col">Ten SV</th>
    <th scope="col">Tuoi</th>
    <th scope="col">Đia Chi</th>
    <th scope="col">Giới Tính</th>
    <th scope="col">Tên Lop</th>
    <th scope="col">Chức Năng</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${listSinhVien}" var="s" varStatus="i">
    <tr>
      <td>${i.index+1}</td>
      <td>${s.maSv}</td>
      <td>${s.tenSv}</td>
      <td>${s.tuoi}</td>
      <td>${s.diaChi}</td>
      <td>${s.gioiTinh}</td>
      <td>${s.tenLop}</td>
      <td>
        <a href="/chiTiet?id=${s.maSv}" class="btn btn-primary">Chi Tiết</a>
        <a href="/xoa-sinhvien?id=${s.maSv}" class="btn btn-info">Xoá sinh viên</a>
        <button>Update</button>
      </td>
    </tr>
  </c:forEach>
  </tbody
</table>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
