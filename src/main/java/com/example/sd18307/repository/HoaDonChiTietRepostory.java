package com.example.sd18307.repository;

import com.example.sd18307.connect.HibernateUtils;
import entities.HoaDon;
import entities.HoaDonChiTiet;
import entities.SanPham;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;

public class HoaDonChiTietRepostory {
    Session session;

    public ArrayList<HoaDonChiTiet> getList( Integer idHoaDon) {
        ArrayList<HoaDonChiTiet> list = new ArrayList<>();
        session = HibernateUtils.getFACTORY().openSession();
        HoaDon hoaDon = new HoaDon();
        hoaDon.setId(idHoaDon);
        list = (ArrayList<HoaDonChiTiet>)
                session.createQuery("FROM HoaDonChiTiet where hoaDon = :hoaDon_1")
                        .setParameter("hoaDon_1", hoaDon)
                        .list();
        session.close();
        return list;
    }
    public HoaDonChiTiet getDetail(Integer id) {
        ArrayList<HoaDonChiTiet> list = new ArrayList<>();
        session = HibernateUtils.getFACTORY().openSession();
        HoaDonChiTiet hoaDon = (HoaDonChiTiet) session.createQuery("from HoaDonChiTiet where id =: id_1")
                .setParameter("id_1", id).getSingleResult();
        session.close();
        return hoaDon;
    }
    public void addHoaDonChiTiet(HoaDonChiTiet hoaDon) {
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

    public void delete(HoaDonChiTiet sp) {
        session = HibernateUtils.getFACTORY().openSession();
        Transaction transaction = session.beginTransaction();
        try{
            session.delete(sp);
            transaction.commit();
            session.close();
        }catch (Exception e){
            e.printStackTrace();
            transaction.rollback();
            session.close();
        }

    }

    public HoaDonChiTiet getById(int idHoaDon, int idCtsp) {
        session = HibernateUtils.getFACTORY().openSession();
        Transaction transaction = session.beginTransaction();
        HoaDonChiTiet hoaDon = (HoaDonChiTiet) session.createQuery(" From HoaDonChiTiet where hoaDon.id = :idHoaDon and chiTietSanPham.id = :idCtsp")
                .setParameter("idHoaDon", idHoaDon)
                .setParameter("idCtsp", idCtsp)
                .getSingleResult();
        session.getTransaction().commit();
        return hoaDon;
    }
}
