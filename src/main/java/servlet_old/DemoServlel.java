package servlet_old;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.SinhVien;

import javax.swing.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "DemoServlel", value = {
        "/DemoCrud",
        "/chiTiet",
        "/chitiet-update",
        "/xoa-sinhvien"
})
public class DemoServlel extends HttpServlet {
    ArrayList<SinhVien> list;
    ArrayList<String> lops;


    public DemoServlel() {
        list = new ArrayList<>();
        SinhVien sinhVien = new SinhVien("PH32729","Nguyen Tuan", 18,"ThaiBinh","Nam","SD18309");
        list.add(sinhVien);
        lops = new ArrayList<>();
        lops.add("SD18309");
        lops.add("SD18308");
        lops.add("SD18307");
        list.add(new SinhVien("PH32729","Nguyen Tuan", 18,"ThaiBinh","Nu","SD18309"));

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SinhVien sinhVien = new SinhVien();
       String uri = request.getRequestURI();
       if(uri.contains("/DemoCrud")) {
           request.setAttribute("lops",lops);
           request.setAttribute("listSinhVien",list);
           request.getRequestDispatcher("/DemoCrud.jsp").forward(request,response);
       }else if(uri.contains("/chiTiet")) {
          String id =  request.getParameter("id");
          for(SinhVien sv : list ) {
              if(sv.getMaSv().equals(id)) {
                  sinhVien = sv;
              }
          }
          request.setAttribute("sinhVien",sinhVien);
           request.setAttribute("lops",lops);
           request.getRequestDispatcher("/chiTiet.jsp").forward(request,response);
        }else if(uri.contains("/xoa-sinhvien")){
           String id = request.getParameter("id");
           for(SinhVien sv : list) {
               if(sv.getMaSv().equals(id)) {
                   list.remove(sv);
                   break;
               }
           }
           response.sendRedirect("/DemoCrud");
       }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if(uri.contains("/DemoCrud")) {
            String maSinhVien = request.getParameter("maSinhVien");
            String tenSinhVien = request.getParameter("tenSinhVien");
            Integer tuoiSinhVien = Integer.parseInt(request.getParameter("tuoiSinhVien"));
            String diachiSinhVien = request.getParameter("diachiSinhVien");
            String gioiTinh = request.getParameter("gioiTinh");
            String tenLop = request.getParameter("tenLop");
            SinhVien sinhVien = new SinhVien(maSinhVien, tenSinhVien, tuoiSinhVien, diachiSinhVien, gioiTinh, tenLop);
            list.add(sinhVien);
            response.sendRedirect("/DemoCrud");
        }else if(uri.contains("/chitiet-update")){
            String maSinhVien = request.getParameter("maSinhVien");
            String tenSinhVien = request.getParameter("tenSinhVien");
            Integer tuoiSinhVien = Integer.parseInt(request.getParameter("tuoiSinhVien"));
            String diachiSinhVien = request.getParameter("diachiSinhVien");
            String gioiTinh = request.getParameter("gioiTinh");
            String tenLop = request.getParameter("tenLop");
            for(SinhVien sv :  list) {
                if(maSinhVien.equals(sv.getMaSv())) {
                    sv.setTuoi(tuoiSinhVien);
                    sv.setDiaChi(diachiSinhVien);
                    sv.setTenSv(tenSinhVien);
                    sv.setTenLop(tenLop);
                    sv.setGioiTinh(gioiTinh);
                }
            }
            response.sendRedirect("/DemoCrud");
        }
    }
}
