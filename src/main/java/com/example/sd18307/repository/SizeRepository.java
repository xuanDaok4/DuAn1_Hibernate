package com.example.sd18307.repository;

import com.example.sd18307.connect.HibernateUtils;
import entities.KhachHang;
import entities.Size;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;

public class SizeRepository {
    Session session;
    public ArrayList<Size> getListSize() {
        ArrayList<Size> list = new ArrayList<>();
        session = HibernateUtils.getFACTORY().openSession();
        list = (ArrayList<Size>)session.createQuery("FROM Size ").list();
        session.close();
        return list;
    }
    public Size getDetail(Integer id) {
        ArrayList<Size> list = new ArrayList<>();
        session = HibernateUtils.getFACTORY().openSession();
        Size size = (Size) session.createQuery("from Size where id =: id_1")
                .setParameter("id_1",id).getSingleResult();
        session.close();
        return size;
    }

    public void delete(Size kh) {
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
     public void addSize(Size size) {
        session = HibernateUtils.getFACTORY().openSession();
         Transaction transaction = session.beginTransaction();
         try{
             session.saveOrUpdate(size);
             transaction.commit();// không có cái này đkmmm không bh chạy đc
             session.close();
         }catch (Exception e){
             e.printStackTrace();
             transaction.rollback();
         }
    }
    public static void main(String[] args) {
        ArrayList<Size> list = new SizeRepository().getListSize();
        for(Size size : list) {
            System.out.println(size);
        }
    }

}
