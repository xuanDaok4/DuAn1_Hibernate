<%--
  Created by IntelliJ IDEA.
  User: nguyenvv
  Date: 12/03/2024
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="jsmain.js"></script>
</head>
<body>
<div class="row">
    <div class="col-7">
        <h2>Danh sách hoá đơn</h2>
        <table class="table">
            <thead>
            <tr>
                <td>STT</td>
                <td>ID</td>
                <td>Ten khach hang</td>
                <td>Ngay tao</td>
                <td>Tong tien</td>
                <td>Trang Thai</td>
                <td>Chuc nang</td>
            </tr>
            </thead>
            <c:forEach items="${listHoaDon}" var="hoaDon" varStatus="i">
            <tbody>
            <tr>
                <td>${i.index+1}</td>
                <td>${hoaDon.id}</td>
                <td>${hoaDon.khachHang.hoTen}</td>
                <td>${hoaDon.ngayTao}</td>
                <td>0</td>
                <td>${hoaDon.trangThai}</td>
                <td>
                    <a href="/hoa-don-detail?idHoaDon=${hoaDon.id}" class="btn btn-info">Chọn</a>
                </td>
            </tr>
            </tbody>
            </c:forEach>
        </table>
        <h2>Danh sách hoá đơn chi tiết</h2>
<%--        <c:if test="${not empty hoaDonChiTiet || empty hoaDonChiTiet} ">--%>
            <table class="table">
                <thead>
                <tr>
                    <td>STT</td>
                    <td>ID</td>
                    <td>Ten san pham</td>
                    <td>So luong</td>
                    <td>Gia ban</td>
                    <td>Tong tien</td>
                    <td>Trang Thai</td>
                    <td>Chuc nang</td>
                </tr>
                </thead>
                <c:forEach items="${hoaDonChiTiet}" var="s" varStatus="i">
                    <tbody>
                    <tr>
                        <td>${i.index+1}</td>
                        <td>${s.id}</td>
                        <td>${s.chiTietSanPham.sanPham.tenSP}</td>
                        <td>${s.soLuong}</td>
                        <td>${s.giaBan}</td>
                        <td>${s.tongTien}</td>
                        <td>${s.trangThai}</td>
                        <td>
                            <a href="idHDCT" class="btn btn-danger">Xoa HD</a>
                        </td>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
<%--        </c:if>--%>

    </div>
    <div class="col-5">
        <h2>Tạo hoá đơn</h2>
        <form action="/tao-hoa-don" method="post">
        <div class="row">
            <div>
                <div>
                    <label class="mb-3 col-3">Số điện thoại</label>
                    <input type="text" class="col-7">
                </div>
                <button  class="btn btn-primary">Search</button>
            </div>
            <div class="mb-3">
                <label class="col-3">Ten Khach hang</label>
                <input type="text" class="col-7" readonly value="${listDetail.khachHang.hoTen}">
            </div>
            <div class="mb-3">
                <label class="col-3">ID Hoa don</label>
                <input type="text" class="col-7" readonly name="idHoaDon" value="${listDetail.id}">
            </div>
            <div class="mb-3">
                <label class="col-3">Tong tien</label>
                <input type="text" class="col-7" name="tongTien" readonly value="${tongTien}">
            </div>
            <div>
<%--               <a href="/tao-hoa-don?idHoaDon=${hoaDon.id}" class="btn btn-primary">Tạo hoá đơn</a>--%>
                <button class="btn btn-info" type="submit">Tạo hoá đơn</button>
<%--                <a href="/hoa-don-chi-tiet/thanhToan?idHD=${listDetail.id}" onclick="handleClick()">--%>
                    <button class="btn btn-primary" type="submit" onclick="handleClick()">Thanh toán</button>
<%--                </a>--%>
            </div>
        </div>
        </form>
    </div>
</div>
<div>
    <h2>Danh sách chi tiếtsản phẩm</h2>
    <table class="table">
        <thead>
        <tr>
            <td>STT</td>
            <td>ID CTSP</td>
            <td>Ten san pham</td>
            <td>Mau sac</td>
            <td>Size</td>
            <td>Gia ban</td>
            <td>So luong ton</td>
            <td>Trang Thai</td>
            <td>Chuc nang</td>
        </tr>
        </thead>
        <c:forEach items="${listSPCT}" var="spct" varStatus="i">
        <tbody>
        <tr>
            <td>${i.index+1}</td>
            <td>${spct.id}</td>
            <td>${spct.sanPham.tenSP}</td>
            <td>${spct.mauSac.tenMau}</td>
            <td>${spct.size.tenSize}</td>
            <td>${spct.giaBan}</td>
            <td>${spct.soLuong}</td>
            <td>${spct.trangThai}</td>
            <td>
             <a href="/hoa-don-chi-tiet/add?idCtsp=${spct.id}" class="btn btn-primary">Chọn mua</a>
            </td>
        </tr>
        </tbody>
        </c:forEach>
    </table>
</div>
</body>
</html>