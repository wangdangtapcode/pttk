/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author quang
 */
public class KhachHang631 extends NguoiDung631 {
    private String diaChi;
    private boolean trangThaiTV;

    public KhachHang631(int id, String tk,String ten, String email,String sdt, String matKhau, String viTri,String dc,Boolean tttv) {
        super(id, tk,ten, email,sdt, matKhau, viTri);
        
        this.diaChi=dc;
        this.trangThaiTV=tttv;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public boolean isTrangThaiTV() {
        return trangThaiTV;
    }

    public void setTrangThaiTV(boolean trangThaiTV) {
        this.trangThaiTV = trangThaiTV;
    }
     
}
