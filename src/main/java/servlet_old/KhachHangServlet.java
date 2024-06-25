package servlet_old;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.KhachHang;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "KhachHangServlet", value = {
        "/KhachHangServlet",
        "/chitietKhachHang",
        "/update-khachhang",
        "/xoa-khachhang"
})
public class KhachHangServlet extends HttpServlet {
    ArrayList<KhachHang> list;
    ArrayList<String> trangThai;

    public KhachHangServlet(){
        list = new ArrayList<>();
        trangThai = new ArrayList<>();
        KhachHang khachHang = new KhachHang("PH32829","Hoàng Văn Tuấn",19,"Nam","Đang mua");
        trangThai.add("Đang mua");
        trangThai.add("Đã mua");
        trangThai.add("Khác");
        list.add(khachHang);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        KhachHang khachHang = new KhachHang();
        if(uri.contains("/KhachHangServlet")) {
            request.setAttribute("listKhachHang",list);
            request.setAttribute("trangThai",trangThai);
            request.getRequestDispatcher("/KhachHang/ViewKhachHang.jsp").forward(request,response);
        }else if(uri.contains("/chitietKhachHang")) {
            String id = request.getParameter("id");
            for(KhachHang kh : list) {
                if(kh.getMaKH().equals(id)) {
                    khachHang = kh;
                }
            }
            request.setAttribute("khachHang",khachHang);
            request.setAttribute("trangThai",trangThai);
            request.getRequestDispatcher("./KhachHang/ChiTietKH.jsp").forward(request,response);
        }else if(uri.contains("/xoa-khachhang")) {
            String id = request.getParameter("id");
            for(KhachHang kh : list) {
                if(kh.getMaKH().equals(id)) {
                    list.remove(kh);
                    break;
                }
            }
            response.sendRedirect("/KhachHangServlet");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if(uri.contains("/KhachHangServlet")) {
            String maKh = request.getParameter("maKhachHang");
            String tenKH = request.getParameter("tenKhachHang");
            Integer tuoi = Integer.parseInt(request.getParameter("tuoiKhachHang"));
            String gioiTinh = request.getParameter("gioiTinhKhachHang");
            String trangThai = request.getParameter("trangThaiKhachHang");
            KhachHang khachHang = new KhachHang(maKh,tenKH,tuoi,gioiTinh,trangThai);
            list.add(khachHang);
            response.sendRedirect("/KhachHangServlet");
        }else if(uri.contains("/update-khachhang")) {
            String maKh = request.getParameter("maKhachHang");
            String tenKH = request.getParameter("tenKhachHang");
            Integer tuoi = Integer.parseInt(request.getParameter("tuoiKhachHang"));
            String gioiTinh = request.getParameter("gioiTinhKhachHang");
            String trangThai = request.getParameter("trangThaiKhachHang");
            for(KhachHang kh : list) {
                if(maKh.equals(kh.getMaKH())) {
                    kh.setTenKH(tenKH);
                    kh.setTuoi(tuoi);
                    kh.setGioiTinh(gioiTinh);
                    kh.setTrangThai(trangThai);
                }
            }
            response.sendRedirect("/KhachHangServlet");
        }

    }
}
