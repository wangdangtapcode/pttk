/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.MatHang631;
import Model.NVGiaoHang631;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author quang
 */
public class MatHangDAO631 extends DAO631 {

    public MatHangDAO631() {
        super();
    }

    public ArrayList<MatHang631> geListMatHang(String key) throws SQLException {
        ArrayList<MatHang631> matHangList = new ArrayList<>();
        String sql = "SELECT * FROM tblMatHang631 WHERE ten LIKE ?";
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, "%" + key + "%");
        ResultSet rs = st.executeQuery();

        while (rs.next()) {
            MatHang631 mh = new MatHang631(rs.getInt("id"), rs.getString("ten"), rs.getFloat("donGia"), rs.getString("theLoai"), rs.getString("moTa"));
            matHangList.add(mh);
        }
        return matHangList;
    }
}
