/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.HoaDon631;
import Model.NguoiDung631;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author quang
 */
public class HoaDonDAO631 extends DAO631 {

    public HoaDonDAO631() {
        super();
    }

    public boolean luuHoaDon(HoaDon631 hd) throws SQLException {
        String sql = "INSERT INTO tblHoaDon631 (ngayIn, tblDonHang631id, tblNguoiDung631id, tblNVGiaoHang631tblNguoiDung631id) "
                + "VALUES (?, ?, ?, ?)";
                PreparedStatement st = con.prepareStatement(sql);
        
        
        st.setDate(1, (Date) hd.getNgayIn());
        st.setInt(2, hd.getDh().getId());
        st.setInt(3, hd.getNvbh().getId());
        st.setInt(4, hd.getNvgh().getId());
        int rs = st.executeUpdate();
        return rs>0;
    }
}
