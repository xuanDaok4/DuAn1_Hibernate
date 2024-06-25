package com.example.sd18307.repository;

import com.example.sd18307.connect.HibernateUtils;
import entities.ChiTietSanPham;
import entities.SanPham;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;

public class ChiTietSanPhamRepository {
    Session session;
    public ArrayList<ChiTietSanPham> getList() {
        ArrayList<ChiTietSanPham> list = new ArrayList<>();
        session = HibernateUtils.getFACTORY().openSession();
         list = (ArrayList<ChiTietSanPham>)session.createQuery("FROM ChiTietSanPham").list();
         session.close();
         return list;
    }

    public ChiTietSanPham getDetail(Integer id) {
        ArrayList<ChiTietSanPham> list = new ArrayList<>();
        session = HibernateUtils.getFACTORY().openSession();
        ChiTietSanPham sanPham = (ChiTietSanPham) session.createQuery("from ChiTietSanPham where id =: id_1")
                .setParameter("id_1",id).getSingleResult();
        session.close();
        return sanPham;
    }

    public void delete(ChiTietSanPham sp) {
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

    public void addChiTietSanPham(ChiTietSanPham sanPham) {
        session = HibernateUtils.getFACTORY().openSession();
        Transaction transaction = session.beginTransaction();
        try{
            session.saveOrUpdate(sanPham);
            transaction.commit();// không có cái này đkmmm không bh chạy đc
            session.close();
        }catch (Exception e){
            e.printStackTrace();
            transaction.rollback();
            session.close();
        }
    }
}
