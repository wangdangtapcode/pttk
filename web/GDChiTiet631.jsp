<%-- 
    Document   : GDChiTiet631
    Created on : Nov 19, 2024, 8:02:23 PM
    Author     : quang
--%>

<%@page import="Model.MatHang631"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết Mặt Hàng</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%

            ArrayList<MatHang631> listMatHang = (ArrayList<MatHang631>) session.getAttribute("listMH");
            String idParam = request.getParameter("id");
            MatHang631 matHang = new MatHang631();

            if (idParam != null && !idParam.isEmpty()) {
                for (MatHang631 mh : listMatHang) {
                    if (mh.getId() == Integer.parseInt(idParam)) {
                        matHang = mh;
                        break;
                    }
                }
            }
            session.setAttribute("matHang", matHang);
        %>
        <div class="container mt-5">
            <a href="javascript:history.back()" class="btn btn-link">&#8592; Quay lại</a>
            <!-- Header -->
            <div class="text-center mb-4">
                <h2 class="text-primary fw-bold">Chi Tiết Mặt Hàng</h2>
            </div>

            <!-- Card hiển thị thông tin -->
            <div class="card shadow-lg border-0">
                <div class="card-body">
                    <!-- Mã mặt hàng -->
                    <div class="mb-3 d-flex align-items-center">
                        <label class="fw-bold col-4">Mã mặt hàng:</label>
                        <span class="text-secondary">MatHang${matHang.id}</span>
                    </div>
                    <hr>
                    <!-- Tên mặt hàng -->
                    <div class="mb-3 d-flex align-items-center">
                        <label class="fw-bold col-4">Tên:</label>
                        <span class="text-secondary">${matHang.ten}</span>
                    </div>
                    <hr>
                    <!-- Đơn giá -->
                    <div class="mb-3 d-flex align-items-center">
                        <label class="fw-bold col-4">Đơn giá:</label>
                        <span class="text-secondary">
                            <fmt:formatNumber value="${matHang.donGia != null ? Math.round(matHang.donGia) : 0}" type="number" pattern="#,###"/> VND
                        </span>
                    </div>
                    <hr>
                    <!-- Thể loại -->
                    <div class="mb-3 d-flex align-items-center">
                        <label class="fw-bold col-4">Thể loại:</label>
                        <span class="text-secondary">${matHang.theLoai}</span>
                    </div>
                    <hr>
                    <!-- Mô tả -->
                    <div class="mb-3 d-flex align-items-center">
                        <label class="fw-bold col-4">Mô tả:</label>
                        <span class="text-secondary">${matHang.moTa}</span>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
