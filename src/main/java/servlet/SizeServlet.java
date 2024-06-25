package servlet;

import com.example.sd18307.repository.DanhMucRepository;
import com.example.sd18307.repository.SizeRepository;
import entities.DanhMuc;
import entities.KhachHang;
import entities.Size;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "SizeServlet", value = {
        "/SizeServlet",
        "/Size-delete",
        "/Size-detail",
        "/Size-update",
        "/size/add"
} )
public class SizeServlet extends HttpServlet {
  ArrayList<Size> list = new ArrayList<>();
  SizeRepository size = new SizeRepository();

//    public SizeServlet() {
////        list = new ArrayList<>();
////        danhMuc.getList();
//
//    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.contains("/SizeServlet")) {
            list = size.getListSize();
            request.setAttribute("list", list);
            request.getRequestDispatcher("/Size/index.jsp").forward(request, response);
        } else if (uri.contains("/Size-delete")) {
            this.delete(request, response);
        } else if (uri.contains("/Size-detail")) {
            this.detail(request, response);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       Integer id = Integer.parseInt(request.getParameter("id"));
        String ma = request.getParameter("maSize");
        String ten = request.getParameter("tenSize");
        String trangThai = request.getParameter("trangThai");

        Size sz = new Size();
        sz.setId(id);

        sz.setMaSize(ma);
        sz.setTenSize(ten);
        sz.setTrangThai(trangThai);
        sz.setNgayTao(new Date());
        sz.setNgay_sua(new Date());
        size.addSize(sz);
        response.sendRedirect("/SizeServlet");
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("idSize"));
        Size size1 = size.getDetail(id);
        request.setAttribute("size",size1);
        request.getRequestDispatcher("Size/Detail_UpdateSize.jsp").forward(request,response);

    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer id = Integer.parseInt(request.getParameter("idSize"));
        Size size1 = size.getDetail(id);
        size.delete(size1);
        response.sendRedirect("/SizeServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String urri = request.getRequestURI();
        if(urri.contains("/size/add")) {
            String ma = request.getParameter("maSize");
            String ten = request.getParameter("tenSize");
            String trangThai = request.getParameter("trangThai");
            Size sz = new Size();
            sz.setMaSize(ma);
            sz.setTenSize(ten);
            sz.setTrangThai(trangThai);
            sz.setNgayTao(new Date());
            sz.setNgay_sua(new Date());
            size.addSize(sz);
            response.sendRedirect("/SizeServlet");
        }else if (urri.contains("/Size-update")) {
            this.update(request, response);
        }
    }
}


