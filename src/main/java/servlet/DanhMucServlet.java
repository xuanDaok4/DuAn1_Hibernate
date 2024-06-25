package servlet;

import com.example.sd18307.repository.DanhMucRepository;
import entities.DanhMuc;
import entities.Size;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "DanhMucServlet", value = {
        "/DanhMucServlet",
        "/DanhMuc-detail",
        "/DanhMuc-delete",
        "/danh-muc/add",
        "/danh-muc/update"

})
public class DanhMucServlet extends HttpServlet {
    ArrayList<DanhMuc> list = new ArrayList<>();
    DanhMucRepository danhMuc = new DanhMucRepository();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("/DanhMucServlet")) {
         list = danhMuc.getList();
         request.setAttribute("list",list);
         request.getRequestDispatcher("/DanhMuc/trang-chu.jsp").forward(request,response);
        }else if(uri.contains("/DanhMuc-detail")){
            this.detail(request,response);
        }else if(uri.contains("/DanhMuc-delete")){
            this.delete(request,response);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer id = Integer.parseInt(request.getParameter("idDM"));
        DanhMuc size1 = danhMuc.getDetail(id);
        danhMuc.delete(size1);
        response.sendRedirect("/DanhMucServlet");
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("idDM"));
        DanhMuc size1 = danhMuc.getDetail(id);
        request.setAttribute("danhMuc",size1);
        request.getRequestDispatcher("DanhMuc/Detail_UpdateDanhMuc.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String uri = request.getRequestURI();
       if(uri.contains("/danh-muc/add")) {
           this.addDanhMuc(request,response);
       }else if(uri.contains("/danh-muc/update")){
           this.update(request,response);
       }

    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws IOException{
        Integer id = Integer.parseInt(request.getParameter("id"));
        String ma = request.getParameter("maDanhMuc");
        String ten = request.getParameter("tenDanhMuc");
        String tt = request.getParameter("trangThai");
        DanhMuc dm = new DanhMuc();
        dm.setId(id);
        dm.setTenDanhMuc(ten);
        dm.setMaDanhMuc(ma);
        dm.setTrangThai(tt);
        dm.setNgaySua(new Date());
        dm.setNgayTao(new Date());
        danhMuc.addDanhMuc(dm);
        response.sendRedirect("/DanhMucServlet");
    }

    private void addDanhMuc(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String ma = request.getParameter("maDanhMuc");
        String ten = request.getParameter("tenDanhMuc");
        String tt = request.getParameter("trangThai");
        DanhMuc dm = new DanhMuc();
        dm.setTenDanhMuc(ten);
        dm.setMaDanhMuc(ma);
        dm.setTrangThai(tt);
        dm.setNgaySua(new Date());
        dm.setNgayTao(new Date());
        danhMuc.addDanhMuc(dm);
        response.sendRedirect("/DanhMucServlet");
    }
}
