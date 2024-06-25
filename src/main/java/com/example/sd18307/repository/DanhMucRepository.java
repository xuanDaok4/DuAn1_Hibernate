package com.example.sd18307.repository;

import com.example.sd18307.connect.HibernateUtils;
import entities.DanhMuc;
import entities.Size;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class DanhMucRepository {
    Session session;
    public ArrayList<DanhMuc> getList() {
        session = HibernateUtils.getFACTORY().openSession();
        ArrayList<DanhMuc> list = (ArrayList<DanhMuc>)session .createQuery("From DanhMuc ").list();
        session.close();
        return list;
    }


    public DanhMuc getDetail(Integer id) {
        session = HibernateUtils.getFACTORY().openSession();
        DanhMuc danhMuc = (DanhMuc) session.createQuery("From DanhMuc where id =: id_1")
                .setParameter("id_1",id).getSingleResult();
        session.close();
        return danhMuc;
    }

    public void delete1(DanhMuc danhMuc) {
        session = HibernateUtils.getFACTORY().openSession();
        Transaction transaction = session.beginTransaction();
        try{
            session.delete(danhMuc);
            transaction.commit();
            session.close();
        }catch(Exception e){
            e.printStackTrace();
            transaction.rollback();
            session.close();
        }
    }

//
//    public ArrayList<DanhMuc> getList() {
//        ArrayList<DanhMuc> list = new ArrayList<>();
//        session = HibernateUtils.getFACTORY().openSession();
//        list = (ArrayList<DanhMuc>)session.createQuery("FROM DanhMuc").list();
//        session.close();
//        return list;
//    }
//    public DanhMuc getDetail(Integer id) {
//        ArrayList<DanhMuc> list = new ArrayList<>();
//        session = HibernateUtils.getFACTORY().openSession();
//        DanhMuc danhMuc = (DanhMuc) session.createQuery("from DanhMuc where id =: id_1")
//                .setParameter("id_1",id).getSingleResult();
//        session.close();
//        return danhMuc;
//    }

    public void delete(DanhMuc kh) {
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
    public void addDanhMuc(DanhMuc danhMuc) {
        session = HibernateUtils.getFACTORY().openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.saveOrUpdate(danhMuc);
            transaction.commit();// không có cái này đkmmm không bh chạy đc
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        }
    }
    public static void main(String[] args) {
        ArrayList<DanhMuc> list = new DanhMucRepository().getList();
        for(DanhMuc danhmuc : list) {
            System.out.println(danhmuc);
        }
    }
}
