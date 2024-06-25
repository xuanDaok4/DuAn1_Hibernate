package servlet_old;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.NhanVienModel;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "NhanVienServlet", value = {
        "/NhanVien",
        "/chitiet",
        "/chitiet-update-nhanvien",
        "/xoa",
         })
public class NhanVienServlet extends HttpServlet {
    ArrayList<NhanVienModel> list;
    ArrayList<String> chucVuNhanVien;

    public NhanVienServlet() {
        list = new ArrayList<>();
        chucVuNhanVien = new ArrayList<>();
        NhanVienModel nhanVien = new NhanVienModel("PH32729","Tuan",18,"Nam","Trưởng Phòng");
        list.add(nhanVien);

        chucVuNhanVien.add("Trưởng Phòng");
        chucVuNhanVien.add("Nhân Viên");
        chucVuNhanVien.add("Khác");

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      NhanVienModel nhanVien = new NhanVienModel();
      String uri = request.getRequestURI();
      if(uri.contains("/NhanVien")) {
          request.setAttribute("chucVuNhanVien",chucVuNhanVien);
          request.setAttribute("listNhanVien",list);
          request.getRequestDispatcher("./NhanVien/NhanVien.jsp").forward(request,response);
      }else if(uri.contains("/chitiet")) {
          String id = request.getParameter("id");
          for(NhanVienModel nv : list) {
              if(nv.getMaNv().equals(id)) {
                  nhanVien = nv;
              }
          }
          request.setAttribute("nhanVien",nhanVien);
          request.setAttribute("chucVuNhanVien",chucVuNhanVien);
          request.getRequestDispatcher("./NhanVien/chitiet.jsp").forward(request,response);
      }else if(uri.contains("/xoa")) {
          String id = request.getParameter("id");
          for(NhanVienModel nv : list) {
              if(nv.getMaNv().equals(id)) {
                  list.remove(nv);
                  break;
              }
          }
          response.sendRedirect("/NhanVien");
      }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if(uri.contains("/NhanVien")){
            String maSV = request.getParameter("maNhanVien");
            String ten = request.getParameter("tenNhanVien");
            Integer tuoi = Integer.parseInt(request.getParameter("tuoiNhanVien"));
            String gioiTinh = request.getParameter("gioiTinhNhanVien");
            String chucVu = request.getParameter("chucVuNhanVien");
            NhanVienModel nv = new NhanVienModel(maSV,ten,tuoi,gioiTinh,chucVu);
            list.add(nv);
            response.sendRedirect("/NhanVien");
        }else if(uri.contains("/chitiet-update-nhanvien")) {
            String maSV = request.getParameter("maNhanVien");
            String ten = request.getParameter("tenNhanVien");
            Integer tuoi = Integer.parseInt(request.getParameter("tuoiNhanVien"));
            String gioiTinh = request.getParameter("gioiTinhNhanVien");
            String chucVu = request.getParameter("chucVuNhanVien");

            for(NhanVienModel s : list) {
                if(maSV.equals(s.getMaNv())) {
                    s.setMaNv(maSV);
                    s.setTenNv(ten);
                    s.setTuoi(tuoi);
                    s.setGioiTinh(gioiTinh);
                    s.setChucVu(chucVu);
                }

            }
            response.sendRedirect("/NhanVien");
        }

    }

}
