package servlet;

import com.example.sd18307.repository.ChiTietSanPhamRepository;
import com.example.sd18307.repository.HoaDonChiTietRepostory;
import com.example.sd18307.repository.HoaDonRepository;
import entities.ChiTietSanPham;
import entities.HoaDon;
import entities.HoaDonChiTiet;
import entities.SanPham;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "LayOutBHServlet", value = {
        "/ban-hang",
        "/tao-hoa-don",
        "/hoa-don-detail",
        "/hoa-don-chi-tiet/add",
        "/hoa-don-chi-tiet/delete"
})
public class LayOutBHServlet extends HttpServlet {
    HoaDonChiTietRepostory hoaDonChiTietRepostory = new HoaDonChiTietRepostory();
    HoaDonRepository hoaDonRepository = new HoaDonRepository();
    ChiTietSanPhamRepository chiTietSanPhamRepository = new ChiTietSanPhamRepository();
    ArrayList<HoaDon> listHoaDon = new ArrayList<>();
    ArrayList<HoaDonChiTiet> listhoaDonChiTiets = new ArrayList<>();

    ArrayList<ChiTietSanPham> listSPCT = new ArrayList<>();
    HoaDon listDetail;
    Integer idHoaDon = 1;
    double tongTien  = 0;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if(uri.contains("/ban-hang")) {
            this.banHang(request,response);
        }else if(uri.contains("/hoa-don-detail")) {
            this.detail(request, response);
        }else if(uri.contains("/hoa-don-chi-tiet/add")) {
            this.addHDCT(request, response);
        }else if(uri.contains("/hoa-don-chi-tiet/thanhToan")) {
            this.thanhToan(request, response);
        }else if(uri.contains("/hoa-don-chi-tiet/delete")) {
            this.deleteHDCT(request, response);
        }
    }

    private void deleteHDCT(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer id = Integer.parseInt(request.getParameter("idHDCT"));
        HoaDonChiTiet sanPham = hoaDonChiTietRepostory.getDetail(id);
        hoaDonChiTietRepostory.delete(sanPham);
        response.sendRedirect("/ban-hang");
    }

    private void thanhToan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int idHD = Integer.parseInt(request.getParameter("idHD"));
        HoaDon hd = hoaDonRepository.getDetail(idHD);
        hd.setTrangThai("Active");
        hoaDonRepository.updateHoaDon(hd);
        response.sendRedirect("/ban-hang");
    }

    private void banHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int idHD = Integer.parseInt(request.getParameter("idHD"));
//        HoaDonChiTiet listHoaDonCT =  hoaDonChiTietRepostory.getDetail(idHD);
//       request.setAttribute("listHoaDonCT",listHoaDonCT);
        //Hiển thị hoá đơn
        listHoaDon = hoaDonRepository.getList();
        request.setAttribute("listHoaDon",listHoaDon);

        //Hiển thị danh sách chi tiết san pham
        listSPCT = chiTietSanPhamRepository.getList();
        request.setAttribute("listSPCT", listSPCT);

        request.setAttribute("tongTien",tongTien);
        //Chi Tiet HoaDon
        listhoaDonChiTiets = hoaDonChiTietRepostory.getList(idHoaDon);
        request.setAttribute("hoaDonChiTiet",listhoaDonChiTiets);

        request.getRequestDispatcher("/LayOut_BanHang.jsp").forward(request,response);
    }

    private void addHDCT(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        Integer idCtsp = Integer.parseInt(request.getParameter("idCtsp"));

        ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.getDetail(idCtsp);
     listhoaDonChiTiets = hoaDonChiTietRepostory.getList(idHoaDon);
     boolean found = false;
     for(HoaDonChiTiet hoaDonChiTiet : listhoaDonChiTiets) {
         if(hoaDonChiTiet.getChiTietSanPham().getId().equals(idCtsp)) {
             hoaDonChiTiet.setSoLuong(hoaDonChiTiet.getSoLuong() + 1);
             hoaDonChiTiet.setTongTien(hoaDonChiTiet.getSoLuong() * hoaDonChiTiet.getGiaBan());
             hoaDonChiTietRepostory.addHoaDonChiTiet(hoaDonChiTiet);
             response.sendRedirect("/ban-hang");
             found = true;
             break;
         }
     }
     if(!found) {
         HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
         hoaDonChiTiet.setChiTietSanPham(chiTietSanPham);
         HoaDon hoaDon = new HoaDon();
         hoaDon.setId(idHoaDon);
         hoaDonChiTiet.setHoaDon(hoaDon);
         hoaDonChiTiet.setTongTien(chiTietSanPham.getGiaBan());
         hoaDonChiTiet.setNgaySua(new Date());
         hoaDonChiTiet.setNgayTao(new Date());
         hoaDonChiTiet.setSoLuong(1);
         hoaDonChiTiet.setGiaBan(chiTietSanPham.getGiaBan());
         hoaDonChiTietRepostory.addHoaDonChiTiet(hoaDonChiTiet);
         response.sendRedirect("/ban-hang");
     }


    }
    private void detail(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("idHoaDon"));
//Lay thong tin hoa don
        idHoaDon = id;

        listDetail = hoaDonRepository.getDetail(id);
        request.setAttribute("listDetail", listDetail);

        request.setAttribute("hoaDonChiTiet",listhoaDonChiTiets);
        request.setAttribute("listSPCT",listSPCT);
        request.setAttribute("listHoaDon",listHoaDon);
        request.setAttribute("tongTien",tongTien);
        listhoaDonChiTiets = hoaDonChiTietRepostory.getList(id);
        tongTien = 0;
        for(HoaDonChiTiet hoaDonChiTiet : listhoaDonChiTiets) {
            tongTien += hoaDonChiTiet.getTongTien();
        }
        request.getRequestDispatcher("/LayOut_BanHang.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if(uri.equals("/tao-hoa-don")){
            double tongTienReq = Double.parseDouble(request.getParameter("tongTien"));
            if(tongTienReq ==  0) {
                HoaDon hoaDon = new HoaDon();
                hoaDon.setNgayTao(new Date());
                hoaDon.setNgaySua(new Date());
                hoaDon.setTrangThai("Chua thanh toan");
                //set gia tri cua khach hang
                hoaDonRepository.addHoaDon(hoaDon);
                response.sendRedirect("/ban-hang");
            }else{
                Integer idHoaDOon = Integer.parseInt(request.getParameter("idHoaDon"));
                HoaDon hoaDonDetail = hoaDonRepository.getDetail(idHoaDOon);
                hoaDonDetail.setTrangThai("Da thanh toan");
                hoaDonDetail.setNgaySua(new Date());
                hoaDonRepository.addHoaDon(hoaDonDetail);
                response.sendRedirect("/ban-hang");

            }
        }
    }
}
