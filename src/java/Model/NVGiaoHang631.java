/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author quang
 */
public class NVGiaoHang631 extends NguoiDung631{
    private String trangThai;
    
    public NVGiaoHang631(){
        
    }
    public NVGiaoHang631(int id, String tk,String ten, String email,String sdt, String matKhau, String viTri,String tt) {
        super(id, tk,ten, email,sdt, matKhau, viTri);
        this.trangThai=tt;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
    
}
