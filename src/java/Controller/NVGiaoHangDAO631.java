/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.DonHang631;
import Model.NVGiaoHang631;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author quang
 */
public class NVGiaoHangDAO631 extends DAO631 {

    public NVGiaoHangDAO631() {
        super();
    }

    public ArrayList<NVGiaoHang631> getNVGH() throws SQLException {
        ArrayList<NVGiaoHang631> nvGiaoHangList = new ArrayList<>();
        String sql = "SELECT nguoiDung.id, nguoiDung.taiKhoan,nguoiDung.ten, nguoiDung.email,nguoiDung.soDienThoai, nguoiDung.matKhau, nguoiDung.viTri, NVGiaoHang.trangThai\n"
                + "FROM tblNVGiaoHang631 AS NVGiaoHang\n"
                + "INNER JOIN tblNguoiDung631 AS nguoiDung ON NVGiaoHang.tblNguoiDung631id = nguoiDung.id\n" +
                "WHERE NVGiaoHang.trangThai = 'Sẵn sàng'";

        PreparedStatement st = con.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            NVGiaoHang631 nvGiaoHang = new NVGiaoHang631(rs.getInt("id"),rs.getString("taiKhoan"),rs.getString("ten"),rs.getString("email"),rs.getString("soDienThoai"),rs.getString("matKhau"),rs.getString("viTri"),rs.getString("trangThai"));
            nvGiaoHangList.add(nvGiaoHang);
        }
        return nvGiaoHangList;
    }
    public boolean capNhatNVGH(NVGiaoHang631 nvgh) throws SQLException{
        String sql = "UPDATE tblnvgiaohang631 SET trangThai = 'Đang giao hàng' WHERE tblNguoiDung631id = ?";
        PreparedStatement st = con.prepareStatement(sql);
        
        st.setInt(1, nvgh.getId());
        int rs = st.executeUpdate();
        
        return rs > 0;
        
    }
}
