package com.example.sd18307.repository;

import com.example.sd18307.connect.HibernateUtils;
import entities.MauSac;
import entities.SanPham;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;

public class MauSacRepository {
    Session session;

    public ArrayList<MauSac> getListMauSac() {
        ArrayList<MauSac> list = new ArrayList<>();
        session = HibernateUtils.getFACTORY().openSession();
        list = (ArrayList<MauSac>) session.createQuery("FROM MauSac").list();
        session.close();
        return list;
    }

    public MauSac getDetail(Integer id) {
        ArrayList<MauSac> list = new ArrayList<>();
        session = HibernateUtils.getFACTORY().openSession();
        MauSac mauSac = (MauSac) session.createQuery("from MauSac where id =: id_1")
                .setParameter("id_1", id).getSingleResult();
        session.close();
        return mauSac;
    }

    public void delete(MauSac sp) {
        session = HibernateUtils.getFACTORY().openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.delete(sp);
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            session.close();
        }

    }

    public void addMauSac(MauSac mauSac) {
        session = HibernateUtils.getFACTORY().openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.saveOrUpdate(mauSac);
            transaction.commit();// không có cái này đkmmm không bh chạy đc
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
            session.close();
        }
    }
}