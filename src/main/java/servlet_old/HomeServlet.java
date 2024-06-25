package servlet_old;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.SinhVien;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;

@WebServlet(name = "HomeServlet", value = "/trang-chu")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ten = "Nguyễn Văn A";
        SinhVien sinhVien = new SinhVien("PH32729","Nguyen Tuan", 18,"ThaiBinh","Nam","SD18309");
        request.setAttribute("sinhVien",sinhVien);

        int tuoi = 18;
        String img = "https://tse4.mm.bing.net/th?id=OIP.Ha0WfdvDJC82qy9pd_goXAHaLH&pid=Api&P=0&h=220";
        String diaChi = "ThaiBinh";
        request.setAttribute("name",ten);
        request.setAttribute("tuoi",tuoi);
        request.setAttribute("diaChi",diaChi);
        request.setAttribute("img",img);

        ArrayList<SinhVien> list = new ArrayList<>();

        list.add(sinhVien);
        list.add(new SinhVien("PH32729","Nguyen Tuan", 18,"ThaiBinh","Nam","SD18309"));
        list.add(new SinhVien("PH32729","Nguyen Tuan", 18,"ThaiBinh","Nu","SD18309"));
        request.setAttribute("listSinhVien",list);
       request.getRequestDispatcher("/trang-chu.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Da chay vao post");
    }
}
