package com.example.sd18307.repository;

import com.example.sd18307.connect.HibernateUtils;
import entities.ChiTietSanPham;
import entities.HoaDon;
import entities.KhachHang;
import entities.SanPham;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;

public class HoaDonRepository {
    Session session;

    public ArrayList<HoaDon> getList() {
        ArrayList<HoaDon> list;
        session = HibernateUtils.getFACTORY().openSession();
        list = (ArrayList<HoaDon>) session.createQuery("FROM HoaDon").list();
        session.close();
        return list;
    }

    public void addHoaDon(HoaDon hoaDon) {
        session = HibernateUtils.getFACTORY().openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.saveOrUpdate(hoaDon);
            transaction.commit();// không có cái này đkmmm không bh chạy đc
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            session.close();
        }
    }

    public void updateHoaDon(HoaDon hoaDon) {
        session = HibernateUtils.getFACTORY().openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.saveOrUpdate(hoaDon);
            transaction.commit();// không có cái này đkmmm không bh chạy đc
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            session.close();
        }
    }

    public HoaDon getDetail(Integer id) {
        ArrayList<HoaDon> list = new ArrayList<>();
        session = HibernateUtils.getFACTORY().openSession();
        HoaDon hoaDon = (HoaDon) session.createQuery("from HoaDon where id =: id_1")
                .setParameter("id_1", id).getSingleResult();
        session.close();
        return hoaDon;
    }

    public void delete(HoaDon kh) {
        session = HibernateUtils.getFACTORY().openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.delete(kh);
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            session.close();
        }
    }

    public static void main(String[] args) {
        System.out.println(new HoaDonRepository().getDetail(1).getNgayTao().toString());
    }
}
