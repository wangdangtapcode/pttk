/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author quang
 */
public class NguoiDung631 {
    private int id;
    private String taiKhoan;
    private String ten;
    private String email;
    private String soDienThoai;

    private String matKhau;
    private String viTri;

    public NguoiDung631() {
    }

    public NguoiDung631(int id,String taiKhoan, String ten, String email,String sdt, String matKhau, String viTri) {
        this.id = id;
        this.taiKhoan=taiKhoan;
        this.ten = ten;
        this.email = email;
        this.soDienThoai= sdt;
        this.matKhau = matKhau;
        this.viTri = viTri;
    }

    public String getTaiKhoan() {
        return taiKhoan;
    }

    public void setTaiKhoan(String taiKhoan) {
        this.taiKhoan = taiKhoan;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getViTri() {
        return viTri;
    }

    public void setViTri(String viTri) {
        this.viTri = viTri;
    }
}
