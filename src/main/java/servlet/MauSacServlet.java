package servlet;

import com.example.sd18307.repository.MauSacRepository;
import entities.MauSac;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "MauSacServlet", value = {
        "/MauSacServlet",
        "/mau-sac-detail",
        "/mau-sac-delete",
        "/mau-sac-update",
        "/mau-sac-add"
})
public class MauSacServlet extends HttpServlet {
    ArrayList<MauSac> list = new ArrayList<>();
    MauSacRepository mauSac = new MauSacRepository();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if(uri.contains("/MauSacServlet")) {
            list = mauSac.getListMauSac();
            request.setAttribute("list",list);
            request.getRequestDispatcher("/MauSac/index.jsp").forward(request,response);
        }else if(uri.contains("/mau-sac-detail")){
            this.detail(request,response);
        }else if(uri.contains("/mau-sac-delete")){
            this.delete(request,response);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
       Integer id = Integer.parseInt(request.getParameter("id"));
       MauSac ms = mauSac.getDetail(id);
       mauSac.delete(ms);
       response.sendRedirect("/MauSacServlet");
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       Integer id = Integer.parseInt(request.getParameter("idMauSac"));
       MauSac mauSacDetail = mauSac.getDetail(id);
       request.setAttribute("mauSacDetail",mauSacDetail);
       request.getRequestDispatcher("/MauSac/Detail_Update_MS.jsp").forward(request,response);
    }
    private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
       Integer id = Integer.parseInt(request.getParameter("id"));
        String ma = request.getParameter("maMau");
        String ten = request.getParameter("tenMau");
        String trangThai = request.getParameter("trangThai");

        MauSac mauSac1 = new MauSac();
        mauSac1.setId(id);
        mauSac1.setMaMau(ma);
        mauSac1.setTenMau(ten);
        mauSac1.setTrangThai(trangThai);
        mauSac1.setNgayTao(new Date());
        mauSac1.setNgaySua(new Date());
        mauSac.addMauSac(mauSac1);
        response.sendRedirect("/MauSacServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if(uri.contains("/mau-sac-add")){
            String ma = request.getParameter("maMau");
            String ten = request.getParameter("tenMau");
            String trangThai = request.getParameter("trangThai");
            MauSac mauSac1 = new MauSac();
            mauSac1.setMaMau(ma);
            mauSac1.setTenMau(ten);
            mauSac1.setTrangThai(trangThai);
            mauSac1.setNgayTao(new Date());
            mauSac1.setNgaySua(new Date());
            mauSac.addMauSac(mauSac1);
            response.sendRedirect("/MauSacServlet");
        } else if(uri.contains("/mau-sac-update")){
            this.update(request,response);
        }

    }
}
