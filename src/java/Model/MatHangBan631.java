/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author quang
 */
public class MatHangBan631 {
    private int id;
    private int soLuong;
    private float gia;
    private MatHang631 mh;

    public MatHangBan631(int id, int soLuong, float gia, MatHang631 mh) {
        this.id = id;
        this.soLuong = soLuong;
        this.gia = gia;
        this.mh = mh;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public float getGia() {
        return gia;
    }

    public void setGia(float gia) {
        this.gia = gia;
    }

    public MatHang631 getMh() {
        return mh;
    }

    public void setMh(MatHang631 mh) {
        this.mh = mh;
    }
    
}
