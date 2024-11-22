/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.KhachHang631;
import Model.NguoiDung631;
import java.sql.SQLException;
import java.sql.*;

/**
 *
 * @author quang
 */
public class LoginDAO extends DAO631 {

    public LoginDAO() throws SQLException {
        super();
    }

public NguoiDung631 checkLogin(String username, String password) throws SQLException {
    String sql = "SELECT * FROM tblNguoiDung631 WHERE taiKhoan = ? AND matKhau = ?";

    PreparedStatement st = con.prepareStatement(sql);
    st.setString(1, username);
    st.setString(2, password);  // Lưu ý: Bạn cần phải mã hóa mật khẩu trước khi so sánh

    NguoiDung631 nd = null;
    ResultSet rs = st.executeQuery();

    if (rs.next()) {
        int id = rs.getInt("id");
        String taiKhoan = rs.getString("taiKhoan");
        String ten = rs.getString("ten");
        String email = rs.getString("email");
        String soDienThoai = rs.getString("soDienThoai");
        String matKhau = rs.getString("matKhau");
        String viTri = rs.getString("viTri");
        if (viTri.equals("Khách hàng")) {

            String diaChi = null;
            boolean trangThaiTV = false;
            String khachHangSql = "SELECT * FROM tblKhachHang631 WHERE tblNguoiDung631id = ?";
            PreparedStatement stKH = con.prepareStatement(khachHangSql);
            stKH.setInt(1, id);
            ResultSet rsKH = stKH.executeQuery();

            if (rsKH.next()) {
                diaChi = rsKH.getString("diaChi");
                trangThaiTV = rsKH.getBoolean("trangThaiTV");
            }

            // Tạo đối tượng KhachHang631
            nd = new KhachHang631(id, taiKhoan, ten, email, soDienThoai, matKhau, viTri, diaChi, trangThaiTV);
        } else if(viTri.equals("Nhân viên bán hàng")){
            nd = new NguoiDung631(id, taiKhoan, ten, email, soDienThoai, matKhau, viTri);
        }else if(viTri.equals("Giao hàng")){
            
        }
    }

    return nd;
}


}
