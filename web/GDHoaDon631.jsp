<%-- 
    Document   : GDChiTiet631
    Created on : Nov 8, 2024, 1:45:02 PM
    Author     : quang
--%>

<%@page import="Controller.HoaDonDAO631"%>
<%@page import="Controller.NVGiaoHangDAO631"%>
<%@page import="java.util.Date"%>
<%@page import="Model.HoaDon631"%>
<%@page import="Model.NguoiDung631"%>
<%@page import="Model.NVGiaoHang631"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.DonHang631"%>
<%@page import="Controller.DonHangDAO631"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hoá đơn</title>
        <!-- Liên kết với Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/chiTiet.css" rel="stylesheet">

    </head>
    <body>

        <%
            DonHangDAO631 dhd = new DonHangDAO631();
            DonHang631 dh = (DonHang631) session.getAttribute("donHang");
            if (!dh.isTrangThaiDuyet()) {
                if (dhd.capNhatDonHang(dh)) {
                    dh.setTrangThaiDuyet(true);
                }
                session.setAttribute("donHang", dh);
                ArrayList<NVGiaoHang631> listNVGH = (ArrayList<NVGiaoHang631>) session.getAttribute("listNVGH");
                String idParam = request.getParameter("id");
                NVGiaoHang631 nvgh = new NVGiaoHang631();

                if (idParam != null && !idParam.isEmpty()) {
                    for (NVGiaoHang631 NVGH : listNVGH) {
                        if (NVGH.getId() == Integer.parseInt(idParam)) {
                            nvgh = NVGH;
                            break;
                        }
                    }
                }
                NVGiaoHangDAO631 nvghd = new NVGiaoHangDAO631();
                if (nvghd.capNhatNVGH(nvgh)) {
                    nvgh.setTrangThai("Đang giao hàng");
                }
                session.setAttribute("nvgh", nvgh);
                NguoiDung631 nvbh = (NguoiDung631) session.getAttribute("nvbh");

                HoaDon631 hd = new HoaDon631(new java.sql.Date(System.currentTimeMillis()), dh, nvgh, nvbh);
                session.setAttribute("hd", hd);
            }
        %>
        <div class="container mt-4">
            <!-- Header -->
            <div class="header text-center mb-4">
                <h2 class="text-primary">Hóa Đơn</h2>
            </div>
            <!-- KhachHang -->
            <div class="mb-3">
                <h5 class="mb-2">Khách Hàng</h5>
                <div class="mb-2">
                    <label for="kh-ten" class="fw-bold">Tên:</label>
                    <span id="kh-ten">${donHang.kh.ten}</span>
                </div>
                <div class="mb-2">
                    <label for="kh-sdt" class="fw-bold">Số điện thoại:</label>
                    <span id="kh-sdt">${donHang.kh.soDienThoai}</span>
                </div>
                <div class="mb-2">
                    <label for="kh-dc" class="fw-bold">Địa chỉ:</label>
                    <span id="kh-dc">${donHang.kh.diaChi}</span>
                </div>                
            </div>
            <div class ="mb-3">
                <div class="mb-2">
                    <label for="ngayIn" class="fw-bold">Ngày In:</label>
                    <span id="ngayIn">${hd.ngayIn}</span>
                </div>
            </div>
            <!-- Danh sách mặt hàng -->
            <div class="card mb-4 shadow-sm">
                <div class="card-header bg-secondary text-white text-center">
                    <h5 class="mb-0">Danh sách mặt hàng</h5>
                </div>
                <div class="card-body p-0">
                    <table class="table table-striped table-hover m-0">
                        <thead class="thead-light">
                            <tr>
                                <th>Tên</th>
                                <th>Số lượng</th>
                                <th>Giá</th>
                                <th>Thể loại</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${donHang.mhb}">
                                <tr>
                                    <td>${item.mh.ten}</td>
                                    <td>${item.soLuong}</td>
                                    <td>
                                        <fmt:formatNumber value="${item.gia != null ? Math.round(item.gia) : 0}" type="number" pattern="#,###"/> VND
                                    </td>
                                    <td>${item.mh.theLoai}</td>
                                </tr>
                                <c:set var="totalPrice" value="${totalPrice + (item.soLuong * item.gia)}" />
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="card-footer text-right font-weight-bold bg-light">
                    Tổng tiền: 
                    <span class="text-danger">
                        <fmt:formatNumber value="${donHang.tongTien != null ? Math.round(donHang.tongTien) : 0}" type="number" pattern="#,###"/> VND
                    </span>
                </div>
            </div>
            <!-- Nhân viên giao hàng -->
            <div class="mb-3">
                <h5 class="mb-2">Nhân viên giao hàng</h5>
                <div class="mb-2">
                    <label for="nvgh-ten" class="fw-bold">Tên:</label>
                    <span id="nvgh-ten">${nvgh.ten}</span>
                </div>
                <!--                <div class="mb-2">
                                    <label for="nvgh-email" class="fw-bold">Email:</label>
                                    <span id="nvgh-email">${nvgh.email}</span>
                                </div>-->
                <div class="mb-2">
                    <label for="nvgh-sdt" class="fw-bold">Số điện thoại:</label>
                    <span id="nvgh-sdt">${nvgh.soDienThoai}</span>
                </div>                
            </div>

            <!-- Nhân viên bán hàng -->
            <div class="mb-3">
                <h5 class="mb-2">Nhân viên bán hàng</h5>
                <div class="mb-2">
                    <label for="nvbh-ten" class="fw-bold">Tên:</label>
                    <span id="nvbh-ten">${nvbh.ten}</span>
                </div>
                <!--                <div class="mb-2">
                                    <label for="nvbh-email" class="fw-bold">Email:</label>
                                    <span id="nvbh-email">${nvbh.email}</span>
                                </div>-->
                <div class="mb-2">
                    <label for="nvbh-sdt" class="fw-bold">Số điện thoại:</label>
                    <span id="nvbh-sdt">${nvbh.soDienThoai}</span>
                </div>  
            </div>






            <!-- Nút OK -->
            <div class="text-center mt-4">
                <button class="btn btn-primary btn-lg" onclick="window.location.href = 'GDThongBaoThanhCong.jsp'">OK</button>
            </div>
        </div>



        <!-- Liên kết với Bootstrap JS -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
