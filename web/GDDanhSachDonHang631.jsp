<%-- 
    Document   : GDDanhSachDonHang631.jsp
    Created on : Nov 9, 2024, 2:55:21 PM
    Author     : quang
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.DonHang631"%>
<%@page import="Controller.DonHangDAO631"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Danh sách đơn hàng</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%
            DonHangDAO631 dhd = new DonHangDAO631();
            ArrayList<DonHang631> listDonHang = dhd.getDonHangChuaDuyet();
            session.setAttribute("listDonHang", listDonHang);
        %>


        <div class="container mt-5">
            <a href="GDMenuNV631.jsp" class="btn btn-link">&#8592; Quay lại</a>
            <div class="text-center font-weight-bold mb-4" style="font-size: 24px;">Danh Sách đơn hàng chưa duyệt</div>

            <c:if test="${fn:length(listDonHang) > 0}">
                <table class="table table-bordered table-hover shadow-sm">
                    <thead class="table-success">
                        <tr>
                            <th scope="col">Mã Đơn Hàng</th>
                            <th scope="col">Tổng tiền (VND)</th>                        
                            <th scope="col">Khách Hàng</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Ngày Mua</th>
                            <th scope="col">Trạng Thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="donHang" items="${listDonHang}">
                            <tr>
                                <td>
                                    DONHANG${donHang.id} 
                                </td>
                                <td>
                                    <fmt:formatNumber value="${donHang.tongTien != null ? Math.round(donHang.tongTien) : 0}" type="number" pattern="#,###"/>
                                </td>
                                <td>
                                    ${donHang.kh.ten} 
                                </td>
                                <td>
                                    ${donHang.kh.soDienThoai} 
                                </td>
                                <td>
                                    <fmt:formatDate value="${donHang.ngayMua}" pattern="yyyy-MM-dd" /> 
                                </td>
                                <td class="d-flex justify-content-between align-items-center">
                                    <span class="${donHang.trangThaiDuyet ? 'text-success' : 'text-warning'} font-weight-bold">
                                        ${donHang.trangThaiDuyet ? 'Đã duyệt' : 'Chưa duyệt'}
                                    </span>
                                    <button class="btn btn-info btn-sm ml-2" onclick="window.location.href = 'GDDuyetDon631.jsp?id=${donHang.id}'">Chọn</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${fn:length(listDonHang) == 0}">
                <p>Không có đơn hàng nào.</p>
            </c:if>

        </div>
    </body>
</html>


