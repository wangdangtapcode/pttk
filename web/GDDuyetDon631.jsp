<%-- 
    Document   : GDDuyetDon631
    Created on : Nov 9, 2024, 2:59:48 PM
    Author     : quang
--%>

<%@page import="Model.NVGiaoHang631"%>
<%@page import="Controller.NVGiaoHangDAO631"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.DonHang631"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Duyệt đơn</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .card-body {
                padding: 0;
            }


            .table {
                max-height: 300px;
                overflow-y: auto;
            }

            .table th, .table td {
                vertical-align: middle;
            }
            .clickable-row {
                cursor: pointer;
            }

            .clickable-row:hover {
                background-color: #f0f0f0;
            }

            .selected {
                background-color: #d1ecf1;
            }
        </style>

    </head>
    <body>
        <%

            ArrayList<DonHang631> listDonHang = (ArrayList<DonHang631>) session.getAttribute("listDonHang");
            String idParam = request.getParameter("id");
            DonHang631 donHang = new DonHang631();

            if (idParam != null && !idParam.isEmpty()) {
                for (DonHang631 dh : listDonHang) {
                    if (dh.getId() == Integer.parseInt(idParam)) {
                        donHang = dh;
                        break;
                    }
                }
            }
            session.setAttribute("donHang", donHang);

            NVGiaoHangDAO631 nvd = new NVGiaoHangDAO631();
            ArrayList<NVGiaoHang631> listNVGH = nvd.getNVGH();
            session.setAttribute("listNVGH", listNVGH);
        %>
        <c:set var="totalPrice" value="0" />
        <div class="container mt-5">
            <a href="javascript:history.back()" class="btn btn-link">&#8592; Quay lại</a>
            <div class="text-center font-weight-bold mb-4" style="font-size: 24px;">Duyệt đơn</div>

            <div class="row">
                <!-- Danh sách mặt hàng -->
                <div class="col-md-6 mb-4">
                    <div class="card shadow-sm">
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
                </div>

                <!-- Danh sách nhân viên giao hàng -->
                <div class="col-md-6">
                    <div class="card shadow-sm">
                        <div class="card-header bg-secondary text-white text-center">
                            <h5 class="mb-0">Danh sách nhân viên giao hàng rảnh</h5>
                        </div>
                        <div class="card-body p-0">
                            <table class="table table-bordered table-hover m-0">
                                <thead class="thead-light">
                                    <tr>
                                        <th>Tên</th>
                                        <th>Email</th>
                                        <th>Số điện thoại</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="nv" items="${listNVGH}">
                                        <tr class="clickable-row" data-id="${nv.id}" data-ten="${nv.ten}" data-email="${nv.email}" data-sdt="${nv.soDienThoai}" style="cursor: pointer;">
                                            <td>${nv.ten}</td>
                                            <td>${nv.email}</td>
                                            <td class ="d-flex justify-content-between align-items-center">
                                                ${nv.soDienThoai}
                                                <button class="btn btn-info btn-sm ml-2" >Chọn</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">Nhân viên đã chọn:</div>
                        <div class="card-body p-0">
                            <table class="table table-bordered m-0">
                                <thead class="thead-light">
                                    <tr>
                                        <th>Tên</th>
                                        <th>Email</th>
                                        <th>Số điện thoại</th>
                                    </tr>
                                </thead>
                                <tbody id="selectedEmployeeTable">
                                    <!--  -->
                                </tbody>
                            </table>
                            <div class="text-center mt-3">
                                <button class="btn btn-primary" id="updateButton" >Cập nhật</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const rows = document.querySelectorAll(".clickable-row");
                const updateButton = document.getElementById("updateButton");
                const selectedTableBody = document.getElementById("selectedEmployeeTable");

                updateButton.style.display = "none";

                rows.forEach(function (row) {
                    row.addEventListener("click", function () {
                        // Xóa class "selected" khỏi tất cả các dòng
                        rows.forEach(function (r) {
                            r.classList.remove("selected");
                        });

                        // Thêm class "selected" vào dòng đã click
                        row.classList.add("selected");

                        // Lấy thông tin từ thuộc tính "data-" của dòng đã click
                        const id = row.getAttribute("data-id");
                        const ten = row.getAttribute("data-ten");
                        const email = row.getAttribute("data-email");
                        const sdt = row.getAttribute("data-sdt");
                        const newRow = document.createElement("tr");

//                        const tdId = document.createElement("td");
//                        tdId.textContent = id;  // Đặt giá trị vào cột ID
//                        newRow.appendChild(tdId);

                        const tdTen = document.createElement("td");
                        tdTen.textContent = ten;  // Đặt giá trị vào cột Tên
                        newRow.appendChild(tdTen);

                        const tdEmail = document.createElement("td");
                        tdEmail.textContent = email;  // Đặt giá trị vào cột Email
                        newRow.appendChild(tdEmail);

                        const tdSdt = document.createElement("td");
                        tdSdt.textContent = sdt;  // Đặt giá trị vào cột ID
                        newRow.appendChild(tdSdt);
                        // Kiểm tra xem bảng đã có dòng nào chưa, nếu chưa thì thêm
                        if (selectedTableBody.children.length > 0) {
                            selectedTableBody.innerHTML = ''; // Xóa thông tin cũ
                        }

                        // Thêm dòng mới vào bảng
                        selectedTableBody.appendChild(newRow);

                        updateButton.style.display = "inline-block";
                        updateButton.onclick = function () {
                            window.location.href = "GDHoaDon631.jsp?id=" + id;
                        };
                    });
                });
            });


        </script>


    </body>
</html>

