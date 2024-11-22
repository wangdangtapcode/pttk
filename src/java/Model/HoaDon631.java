/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author quang
 */
public class HoaDon631 {
    private int id;
    private Date ngayIn;
    private DonHang631 dh;
    private NVGiaoHang631 nvgh;
    private NguoiDung631 nvbh;

    public HoaDon631(int id, Date ngayIn, DonHang631 dh, NVGiaoHang631 nvgh, NguoiDung631 nvbh) {
        this.id = id;
        this.ngayIn = ngayIn;
        this.dh = dh;
        this.nvgh = nvgh;
        this.nvbh = nvbh;
    }
    public HoaDon631(Date ngayIn, DonHang631 dh, NVGiaoHang631 nvgh, NguoiDung631 nvbh) {
        this.ngayIn = ngayIn;
        this.dh = dh;
        this.nvgh = nvgh;
        this.nvbh = nvbh;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgayIn() {
        return ngayIn;
    }

    public void setNgayIn(Date ngayIn) {
        this.ngayIn = ngayIn;
    }

    public DonHang631 getDh() {
        return dh;
    }

    public void setDh(DonHang631 dh) {
        this.dh = dh;
    }

    public NVGiaoHang631 getNvgh() {
        return nvgh;
    }

    public void setNvgh(NVGiaoHang631 nvgh) {
        this.nvgh = nvgh;
    }

    public NguoiDung631 getNvbh() {
        return nvbh;
    }

    public void setNvbh(NguoiDung631 nvbh) {
        this.nvbh = nvbh;
    }
    
}
