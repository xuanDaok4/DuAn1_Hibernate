package servlet;

import com.example.sd18307.repository.KhachHangRepository;
import entities.KhachHang;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "KhachHangKhServlet", value = {
        "/KhachHang-trang-chu",
        "/khach-hang-detail",
        "/khach-hang/update",
        "/khach-hang/delete",
        "/khach-hang/add"
})
public class KhachHangKhServlet extends HttpServlet {

    KhachHangRepository khachHangRepository = new KhachHangRepository();
    ArrayList<KhachHang> listKH = new ArrayList<>();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String uri  = request.getRequestURI();
      if(uri.contains("/KhachHang-trang-chu")) {
          listKH = khachHangRepository.getList();
          request.setAttribute("listKhachHang",listKH);
          request.getRequestDispatcher("/KhachHangKH/ViewKhachHangKH.jsp").forward(request,response);
      }else if(uri.contains("/khach-hang-detail")){
          this.detail(request,response);
      } else if (uri.contains("/khach-hang/delete")) {
        this.delete(request,response);
    }
}

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
    Integer id = Integer.parseInt(request.getParameter("idKhachHang"));
    KhachHang khachHang = khachHangRepository.getDetail(id);
    khachHangRepository.delete(khachHang);
    response.sendRedirect("/KhachHang-trang-chu");
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer id = Integer.parseInt(request.getParameter("idKhachHang"));
        String hoTen = request.getParameter("hoTenKhachHang");
        String diachi = request.getParameter("diaChiKhachHang");
        String sdt = request.getParameter("sdtKhachHang");
        String trangThai = request.getParameter("trangThai");
        KhachHang khachHang = new KhachHang();
        khachHang.setId(id);
        khachHang.setSdt(sdt);
        khachHang.setNgayTao(new Date());
        khachHang.setNgaySua(new Date());
        khachHang.setHoTen(hoTen);
        khachHang.setDiaChi(diachi);
        khachHang.setTrangThai(trangThai);
        khachHangRepository.updateKhachHang(khachHang);
        response.sendRedirect("/KhachHang-trang-chu");
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Integer id = Integer.parseInt(request.getParameter("idKhachHang"));
    KhachHang khachHang = khachHangRepository.getDetail(id);
    request.setAttribute("khachHang",khachHang);
    request.getRequestDispatcher("/KhachHangKH/Detail_UpdateKhachHang.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String urri = request.getRequestURI();
        if(urri.contains("/khach-hang/update")){
            this.update(request,response);
        }else if(urri.contains("/khach-hang/add")) {
            String hoTen = request.getParameter("hoTenKhachHang");
            String diachi = request.getParameter("diaChiKhachHang");
            String sdt = request.getParameter("sdtKhachHang");
            String trangThai = request.getParameter("trangThai");
            KhachHang khachHang = new KhachHang();
            khachHang.setSdt(sdt);
            khachHang.setNgayTao(new Date());
            khachHang.setNgaySua(new Date());
            khachHang.setHoTen(hoTen);
            khachHang.setDiaChi(diachi);
            khachHang.setTrangThai(trangThai);
            khachHangRepository.addKhachHang(khachHang);
            response.sendRedirect("/KhachHang-trang-chu");
        }
    }
}
