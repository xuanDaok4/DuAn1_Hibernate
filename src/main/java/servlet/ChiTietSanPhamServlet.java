package servlet;

import com.example.sd18307.repository.ChiTietSanPhamRepository;
import com.example.sd18307.repository.MauSacRepository;
import com.example.sd18307.repository.SanPhamRepository;
import com.example.sd18307.repository.SizeRepository;
import entities.ChiTietSanPham;
import entities.MauSac;
import entities.SanPham;
import entities.Size;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "ChiTietSanPhamServlet", value ={
        "/ChiTietSanPhamServlet",
        "/ChiTietSanPham-detaill",
        "/ChiTietSanPham-delete",
        "/ChiTietSanPham-update",
        "/ChiTietSanPham-add"

} )
public class ChiTietSanPhamServlet extends HttpServlet {
    ArrayList<ChiTietSanPham> list = new ArrayList<>();
    ChiTietSanPhamRepository chiTiet =  new ChiTietSanPhamRepository();
    MauSacRepository mauSSac = new MauSacRepository();
    SizeRepository sizze = new SizeRepository();
    SanPhamRepository sanPhamRepository = new SanPhamRepository();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String uri = request.getRequestURI();
         if(uri.contains("/ChiTietSanPhamServlet")) {
             //MauSac
             ArrayList<MauSac> listMauSac = mauSSac.getListMauSac();
             request.setAttribute("listMauSac",listMauSac);
             //Size
             ArrayList<Size> listSizes = sizze.getListSize();
             request.setAttribute("listSize",listSizes);
             //SanPham
             ArrayList<SanPham> listSanPham = sanPhamRepository.getList();
             request.setAttribute("listSP",listSanPham);
             //lisst spct
             list = chiTiet.getList();
             request.setAttribute("list",list);
             request.getRequestDispatcher("/ChiTietSP/index.jsp").forward(request,response);
         }else if(uri.contains("/ChiTietSanPham-detaill")) {
             this.detail(request,response);
         }else if(uri.contains("/ChiTietSanPham-delete")) {
             this.delete(request, response);
         }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Double giaBan = Double.parseDouble(request.getParameter("giaBan"));
        Integer soLuong = Integer.parseInt(request.getParameter("soLuong"));
        String trangThai = request.getParameter("trangThai");
        Integer idMauSac = Integer.parseInt(request.getParameter("mauSac"));
        Integer idSize = Integer.parseInt(request.getParameter("size"));
        Integer idSP  = Integer.parseInt(request.getParameter("sanPham"));
        ChiTietSanPham ct = new ChiTietSanPham();
        ct.setId(id);
        ct.setGiaBan(giaBan);
        ct.setSoLuong(soLuong);
        ct.setTrangThai(trangThai);
        ct.setNgaySua(new Date());
        ct.setNgayTao(new Date());
//        MauSac
        MauSac mauSac = new MauSac();
        mauSac.setId(idMauSac);
        ct.setMauSac(mauSac);
//        Size
        Size sz = new Size();
        sz.setId(idSize);
        ct.setSize(sz);
//        SanPham
        SanPham sanPham = new SanPham();
        sanPham.setId(idSP);
        ct.setSanPham(sanPham);
//        addDuLieu
        chiTiet.addChiTietSanPham(ct);
        response.sendRedirect("/ChiTietSanPhamServlet");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        ChiTietSanPham chiTietSanPham = chiTiet.getDetail(id);
        chiTiet.delete(chiTietSanPham);
        response.sendRedirect("/ChiTietSanPhamServlet");
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //MauSac
        ArrayList<MauSac> listMauSac = mauSSac.getListMauSac();
        request.setAttribute("listMauSac",listMauSac);
        //Size
        ArrayList<Size> listSizes = sizze.getListSize();
        request.setAttribute("listSize",listSizes);
        //SanPham
        ArrayList<SanPham> listSanPham = sanPhamRepository.getList();
        request.setAttribute("listSP",listSanPham);
        //spct
        Integer id = Integer.parseInt(request.getParameter("idChiTiet"));
        ChiTietSanPham chiTietSanPham = chiTiet.getDetail(id);
        request.setAttribute("chiTietSanPham",chiTietSanPham);
        request.getRequestDispatcher("/ChiTietSP/Detail_Update_CTSP.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String uri = request.getRequestURI();
    if(uri.equals("/ChiTietSanPham-add")) {
        this.add(request,response);
    }else if(uri.contains("ChiTietSanPham-update")) {
        this.update(request,response);
    }
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Double giaBan = Double.parseDouble(request.getParameter("giaBan"));
        Integer soLuong = Integer.parseInt(request.getParameter("soLuong"));
        String trangThai = request.getParameter("trangThai");
        Integer idMauSac = Integer.parseInt(request.getParameter("mauSac"));
        Integer idSize = Integer.parseInt(request.getParameter("size"));
        Integer idSP  = Integer.parseInt(request.getParameter("sanPham"));
        ChiTietSanPham ct = new ChiTietSanPham();
        ct.setGiaBan(giaBan);
        ct.setSoLuong(soLuong);
        ct.setTrangThai(trangThai);
        ct.setNgaySua(new Date());
        ct.setNgayTao(new Date());
//        MauSac
        MauSac mauSac = new MauSac();
        mauSac.setId(idMauSac);
        ct.setMauSac(mauSac);
//        Size
        Size sz = new Size();
        sz.setId(idSize);
        ct.setSize(sz);
//        SanPham
        SanPham sanPham = new SanPham();
        sanPham.setId(idSP);
        ct.setSanPham(sanPham);
//        addDuLieu
        chiTiet.addChiTietSanPham(ct);
        response.sendRedirect("/ChiTietSanPhamServlet");
    }
}


