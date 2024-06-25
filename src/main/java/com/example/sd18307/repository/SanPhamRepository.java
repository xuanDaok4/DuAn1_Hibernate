package com.example.sd18307.repository;

import com.example.sd18307.connect.HibernateUtils;
import entities.SanPham;
import entities.Size;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;

public class SanPhamRepository {
    Session session;
    public ArrayList<SanPham> getList() {
      ArrayList<SanPham> list = new ArrayList<>();
      session = HibernateUtils.getFACTORY().openSession();
     list = (ArrayList<SanPham>)session.createQuery("From SanPham ").list();
      session.close();
      return list;

    }

    public SanPham getDetail(Integer id) {
        ArrayList<SanPham> list = new ArrayList<>();
        session = HibernateUtils.getFACTORY().openSession();
        SanPham sanPham = (SanPham)session.createQuery("from SanPham where id =: id_1")
                .setParameter("id_1",id).getSingleResult();
        session.close();
        return sanPham;
    }

    public void delete(SanPham sp) {
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

    public void addSanPham(SanPham sanPham) {
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

    public void updateSanPham(SanPham sanPham) {
        session = HibernateUtils.getFACTORY().openSession();
        Transaction transaction = session.beginTransaction();
        System.out.println(sanPham.getId()+sanPham.getMaSP());
        try{
            session.update(sanPham);
            transaction.commit();// không có cái này đkmmm không bh chạy đc
//            session.close();
        }catch (Exception e){
            e.printStackTrace();
            transaction.rollback();
//            session.close();
        }
    }

}
