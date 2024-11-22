/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author quang
 */
public class DonHang631 {
    private int id;
    private float tongTien;
    private boolean trangThaiDuyet;
    private KhachHang631 kh;
    private Date ngayMua;
    private ArrayList<MatHangBan631> mhb;

    public DonHang631(int id, float tongTien, boolean trangThaiDuyet,Date ngayMua, KhachHang631 kh, ArrayList<MatHangBan631> mhb) {
        this.id = id;
        float sum = 0;
        this.tongTien = tongTien;
        this.trangThaiDuyet = trangThaiDuyet;
        this.ngayMua = ngayMua;
        this.kh = kh;
        this.mhb = mhb;
    }
    public DonHang631(){
        this.mhb = new ArrayList<>();
    }
    public DonHang631(int id, float tongTien, boolean trangThaiDuyet,Date ngayMua, KhachHang631 kh) {
        this.id = id;
        this.tongTien = tongTien;
        this.trangThaiDuyet = trangThaiDuyet;
        this.ngayMua = ngayMua;
        this.kh = kh;
        this.mhb = new ArrayList<>();
    }    

    public Date getNgayMua() {
        return ngayMua;
    }

    public void setNgayMua(Date ngayMua) {
        this.ngayMua = ngayMua;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getTongTien() {
        return tongTien;
    }

    public void setTongTien(float tongTien) {
        this.tongTien = tongTien;
    }

    public boolean isTrangThaiDuyet() {
        return trangThaiDuyet;
    }

    public void setTrangThaiDuyet(boolean trangThaiDuyet) {
        this.trangThaiDuyet = trangThaiDuyet;
    }

    public KhachHang631 getKh() {
        return kh;
    }

    public void setKh(KhachHang631 kh) {
        this.kh = kh;
    }

    public ArrayList<MatHangBan631> getMhb() {
        return mhb;
    }

    public void setMhb(ArrayList<MatHangBan631> mhb) {
        this.mhb = mhb;
    }
    
}
