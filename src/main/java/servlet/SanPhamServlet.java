package servlet;

import com.example.sd18307.repository.DanhMucRepository;
import com.example.sd18307.repository.SanPhamRepository;
import entities.DanhMuc;
import entities.SanPham;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "SanPhamServlet", value = {
        "/SanPham-trangchu",
        "/san-pham/delete",
        "/san-pham/detaile",
        "/san-pham/update"
})
public class SanPhamServlet extends HttpServlet {

    DanhMucRepository danhMucRepository = new DanhMucRepository();
    ArrayList<DanhMuc> danhMucs = new ArrayList<>();
    ArrayList<SanPham> list = new ArrayList<>();

    SanPhamRepository sanPhamRepository = new SanPhamRepository();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String uri = request.getRequestURI();
     if(uri.contains("/SanPham-trangchu")) {
        danhMucs =  danhMucRepository.getList();
         request.setAttribute("listDanhMuc",danhMucs);
         list = sanPhamRepository.getList();
         request.setAttribute("list",list);
         request.getRequestDispatcher("/SanPham/viewSanPham.jsp").forward(request,response);
     }else if(uri.contains("/san-pham/delete")){
         this.delete(request,response);
     }else if(uri.contains("detaile")) {
         this.detaile(request, response);
//     }else if(uri.equals("/san-pham/update")){
//         this.update(request,response);
     }
}

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
       Integer id = Integer.parseInt(request.getParameter("idSanPham"));
        System.out.println(id);
        String ten = request.getParameter("tenSanPham");
        String ma = request.getParameter("maSanPham");
        String trangThai = request.getParameter("trangThai");
        Integer idDanhMuc = Integer.parseInt(request.getParameter("danhMuc"));

        SanPham sanPham = new SanPham();
        sanPham.setId(id);
        sanPham.setTenSP(ten);
        sanPham.setMaSP(ma);
        sanPham.setTrangThai(trangThai);
        sanPham.setNgaySua(new Date());
        sanPham.setNgayTao(new Date());

        DanhMuc danhMuc = new DanhMuc();
        danhMuc.setId(idDanhMuc);
        sanPham.setDanhMuc(danhMuc);
        System.out.println(sanPham.toString());
//        System.out.println(sanPham.toString());
       sanPhamRepository.updateSanPham(sanPham);
        response.sendRedirect("/SanPham-trangchu");
    }

    private void detaile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Integer id = Integer.parseInt(request.getParameter("id"));
        danhMucs =  danhMucRepository.getList();
        request.setAttribute("listDanhMuc",danhMucs);
        SanPham sanPham = sanPhamRepository.getDetail(id);
        request.setAttribute("sanPham",sanPham);
       request.getRequestDispatcher("/SanPham/Detaile_Update.jsp").forward(request,response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Integer id = Integer.parseInt(request.getParameter("id"));
        SanPham sanPham = sanPhamRepository.getDetail(id);
        sanPhamRepository.delete(sanPham);
        response.sendRedirect("/SanPham-trangchu");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String uri= request.getRequestURI();
       if(uri.contains("add")){
           this.addSanPham(request,response);
       } else if(uri.contains("update")){
           this.update(request,response);
       }

    }

    private void addSanPham(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String ten = request.getParameter("tenSanPham");
        String ma = request.getParameter("maSanPham");
        String trangThai = request.getParameter("trangThai");
        Integer idDanhMuc = Integer.parseInt(request.getParameter("danhMuc"));
        SanPham sanPham = new SanPham();
        sanPham.setTenSP(ten);
        sanPham.setMaSP(ma);
        sanPham.setTrangThai(trangThai);
        sanPham.setNgaySua(new Date());
        sanPham.setNgayTao(new Date());
        DanhMuc danhMuc = new DanhMuc();
        danhMuc.setId(idDanhMuc);
        sanPham.setDanhMuc(danhMuc);
        sanPhamRepository.addSanPham(sanPham);
        response.sendRedirect("/SanPham-trangchu");
    }
}
