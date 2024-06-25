package servlet;

import com.example.sd18307.repository.HoaDonRepository;
import com.example.sd18307.repository.KhachHangRepository;
import entities.HoaDon;
import entities.KhachHang;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "HoaDonServlet", value ={
        "/HoaDonServlet",
        "/HoaDon-detail",
        "/HoaDon-delete",
        "/HoaDon-update",
        "/HoaDon-add",
        
})
public class HoaDonServlet extends HttpServlet {
    ArrayList<HoaDon> list = new ArrayList<>();
    HoaDonRepository hoaDonRepository = new HoaDonRepository();
    ArrayList<KhachHang> listKH = new ArrayList<>();
    KhachHangRepository khachHangRepository = new KhachHangRepository();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if(uri.contains("/HoaDonServlet")){
            listKH = khachHangRepository.getList();
            request.setAttribute("listKH",listKH);
            list = hoaDonRepository.getList();
            request.setAttribute("list",list);
            request.getRequestDispatcher("/HoaDon/index.jsp").forward(request,response);
        }else if(uri.contains("/HoaDon-detail")){
            this.detail(request,response);
        }else if(uri.contains("/HoaDon-delete")) {
            this.delete(request, response);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
         Integer id = Integer.parseInt(request.getParameter("idHoaDon"));
         HoaDon hd = hoaDonRepository.getDetail(id);
         hoaDonRepository.delete(hd);
         response.sendRedirect("/HoaDonServlet");
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Integer id = Integer.parseInt(request.getParameter("idHoaDon"));
        HoaDon hd = hoaDonRepository.getDetail(id);
         request.setAttribute("hoaDon",hd);
        request.getRequestDispatcher("/HoaDon/Detail_UpdateHoaDon.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if(uri.contains("/HoaDon-add")){
          String trangThai = request.getParameter("trangThai");
          String diaCHi = request.getParameter("diaChi");
          String sdt = request.getParameter("sdt");
          Integer idKhachHang = Integer.parseInt(request.getParameter("khachHang"));
          HoaDon hd = new HoaDon();
          hd.setNgaySua(new Date());
          hd.setNgayTao(new Date());
          hd.setTrangThai(trangThai);
          hd.setDiaChi(diaCHi);
          hd.setSoDienThoai(sdt);
            KhachHang khachHang = new KhachHang();
            khachHang.setId(idKhachHang);
            hd.setKhachHang(khachHang);
            hoaDonRepository.addHoaDon(hd);
            response.sendRedirect("/HoaDonServlet");

        }else if(uri.contains("/HoaDon-update")) {
            this.update(request, response);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
       Integer id = Integer.parseInt(request.getParameter("id"));
        String trangThai = request.getParameter("trangThai");
        String diaCHi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");
        Integer idKhachHang = Integer.parseInt(request.getParameter("khachHang"));
        HoaDon hd = new HoaDon();
        hd.setId(id);
        hd.setNgaySua(new Date());
        hd.setNgayTao(new Date());
        hd.setTrangThai(trangThai);
        hd.setDiaChi(diaCHi);
        hd.setSoDienThoai(sdt);
        KhachHang khachHang = new KhachHang();
        khachHang.setId(idKhachHang);
        hd.setKhachHang(khachHang);
        hoaDonRepository.addHoaDon(hd);
        response.sendRedirect("/HoaDonServlet");
    }
}
