package com.example.sd18307.repository;

import com.example.sd18307.connect.HibernateUtils;
import entities.KhachHang;
import entities.SanPham;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;

public class KhachHangRepository {
    Session session;
    public ArrayList<KhachHang> getList() {
        ArrayList<KhachHang> list = new ArrayList<>();
        session = HibernateUtils.getFACTORY().openSession();
        list = (ArrayList<KhachHang>) session.createQuery("FROM KhachHang").list();
        session.close();
        return list;

    }

    public KhachHang getDetail(Integer id) {
        ArrayList<KhachHang> list = new ArrayList<>();
        session = HibernateUtils.getFACTORY().openSession();
        KhachHang khachHang = (KhachHang) session.createQuery("from KhachHang where id =: id_1")
                .setParameter("id_1",id).getSingleResult();
        session.close();
        return khachHang;
    }

    public void delete(KhachHang kh) {
        session = HibernateUtils.getFACTORY().openSession();
        Transaction transaction = session.beginTransaction();
        try{
            session.delete(kh);
            transaction.commit();
            session.close();
        }catch (Exception e){
            e.printStackTrace();
            transaction.rollback();
            session.close();
        }

    }

    public void addKhachHang(KhachHang khachHang) {
        session = HibernateUtils.getFACTORY().openSession();
        Transaction transaction = session.beginTransaction();
        try{
            session.saveOrUpdate(khachHang);
            transaction.commit();// không có cái này đkmmm không bh chạy đc
            session.close();
        }catch (Exception e){
            e.printStackTrace();
            transaction.rollback();
            session.close();
        }
    }

    public void updateKhachHang(KhachHang khachHang) {
        session = HibernateUtils.getFACTORY().openSession();
        Transaction transaction = session.beginTransaction();
        try{
            session.merge(khachHang);
            transaction.commit();// không có cái này đkmmm không bh chạy đc
            session.close();
        }catch (Exception e){
            e.printStackTrace();
            transaction.rollback();
            session.close();
        }
    }
}
