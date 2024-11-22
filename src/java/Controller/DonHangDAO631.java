/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.DonHang631;
import Model.KhachHang631;
import Model.MatHang631;
import Model.MatHangBan631;
import Model.NguoiDung631;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author quang
 */
public class DonHangDAO631 extends DAO631 {

    public DonHangDAO631() throws SQLException {
        super();
    }

    public ArrayList<DonHang631> getDonHangChuaDuyet() throws SQLException {
        String sql = "SELECT \n"
                + "    dh.id AS donHangID,\n"
                + "    kh.tblNguoiDung631id AS khachHangNguoiDungID,\n"
                + "    nd.id AS nguoiDungID,\n"
                + "    mhb.id AS matHangBanID,\n"
                + "    mh.id AS matHangID,\n"
                + "    dh.tongTien,\n"
                + "    dh.trangThaiDuyet,\n"
                + "    dh.ngayMua,\n"
                + "    kh.diaChi,\n"
                + "    kh.trangThaiTV,\n"
                + "    nd.taiKhoan,\n"
                + "    nd.ten AS tenNguoiDung,\n"
                + "    nd.email,\n"
                + "    nd.soDienThoai,\n"
                + "    nd.matKhau,\n"
                + "    nd.viTri,\n"
                + "    mh.ten AS tenMatHang,\n"
                + "    mh.donGia AS donGiaMatHang,\n"
                + "    mh.theLoai AS theLoaiMatHang,\n"
                + "    mh.moTa AS moTaMatHang,\n"
                + "    mhb.soLuong,\n"
                + "    mhb.gia AS giaBan\n"
                + "FROM tblDonHang631 dh\n"
                + "JOIN tblKhachHang631 kh ON dh.tblKhachHang631tblNguoiDung631id = kh.tblNguoiDung631id\n"
                + "JOIN tblNguoiDung631 nd ON kh.tblNguoiDung631id = nd.id\n"
                + "JOIN tblMatHangBan631 mhb ON dh.id = mhb.tblDonHang631id\n"
                + "JOIN tblMatHang631 mh ON mhb.tblMatHang631id = mh.id\n"
                + "WHERE dh.trangThaiDuyet = 0;";
        PreparedStatement st = con.prepareStatement(sql);

        ArrayList<DonHang631> listDH = new ArrayList<>();
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            KhachHang631 kh = new KhachHang631(rs.getInt("nguoiDungID"),rs.getString("taiKhoan"), rs.getString("tenNguoiDung"), rs.getString("email"), rs.getString("soDienThoai"), rs.getString("matKhau"), rs.getString("viTri"), rs.getString("diaChi"), (rs.getInt("trangThaiTV") == 1 ? true : false));
            MatHang631 mh = new MatHang631(rs.getInt("matHangID"), rs.getString("tenMatHang"), rs.getFloat("donGiaMatHang"), rs.getString("theLoaiMatHang"),rs.getString("moTaMatHang"));
            MatHangBan631 mhb = new MatHangBan631(rs.getInt("matHangBanID"), rs.getInt("soLuong"), rs.getFloat("giaBan"), mh);

            int donHangID = rs.getInt("donHangID");
            DonHang631 existingDH = null;
            for (DonHang631 dh : listDH) {
                if (dh.getId() == donHangID) {
                    existingDH = dh;  
                    break;
                }
            }

            if (existingDH != null) {
                listDH.remove(existingDH);      
                existingDH.getMhb().add(mhb);
                listDH.add(existingDH);
            } else {
                DonHang631 dh = new DonHang631(donHangID, rs.getFloat("tongTien"), false,rs.getDate("ngayMua"),kh);
                dh.getMhb().add(mhb); 
                listDH.add(dh);        
            }

        }
        
        return listDH;
    }
    
    public boolean capNhatDonHang(DonHang631 dh) throws SQLException{
        String sql = "UPDATE tblDonHang631 SET trangThaiDuyet = 1 WHERE id = ?";
        PreparedStatement st = con.prepareStatement(sql);
        
        
        st.setInt(1, dh.getId());
        int rs = st.executeUpdate();
        
        return rs > 0;
        
    }
}
