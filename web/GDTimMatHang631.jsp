<%-- 
    Document   : GDTimMatHang631
    Created on : Nov 8, 2024, 1:44:50 PM
    Author     : quang
--%>

<%@page import="Model.MatHang631"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.MatHangDAO631"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tìm Mặt Hàng</title>
        <!-- Liên kết với Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/timMatHang.css" rel="stylesheet">
    </head>
    <body>
        <%
            MatHangDAO631 mhd = new MatHangDAO631();
            String key = request.getParameter("keyword");
            ArrayList<MatHang631> mhList = mhd.geListMatHang(key);
            session.setAttribute("listMH", mhList);

        %>
        <div class="container">
            <a href="GDMenu631.jsp" class="btn btn-link">&#8592; Quay lại</a>
            <h1 class="my-4 text-center">Tìm Mặt Hàng</h1>

            <!-- Thanh tìm kiếm -->
            <form method="get" class="d-flex mb-4">
                <input type="text" id="keyword" name="keyword" placeholder="Nhập từ khóa..." 
                       value="${fn:escapeXml(param.keyword)}" class="form-control mr-2">
                <button type="submit" class="btn btn-primary">Tìm</button>
            </form>

            <!-- Bảng danh sách mặt hàng -->
            <div class="table-responsive">
                <c:if test="${fn:length(listMH) > 0}">
                    <table class="table table-bordered table-hover shadow-sm">
                        <thead class="table-success">
                            <tr>
                                <th scope="col">Tên Mặt Hàng</th>                        
                                <th scope="col">Đơn giá (VND)</th>
                                <th scope="col">Thể loại</th>
                                <th scope="col">Mô tả</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="matHang" items="${listMH}">
                                <tr>
                                    <td>${matHang.ten}</td>
                                    <td>
                                        <fmt:formatNumber value="${matHang.donGia != null ? Math.round(matHang.donGia) : 0}" 
                                                          type="number" pattern="#,###"/>
                                    </td>
                                    <td>${matHang.theLoai}</td>
                                    <td class="d-flex justify-content-between align-items-center">
                                        <c:choose>
                                            <c:when test="${fn:length(matHang.moTa) > 10}">
                                                ${fn:substring(matHang.moTa, 0, 10)}...
                                            </c:when>
                                            <c:otherwise>
                                                ${matHang.moTa}
                                            </c:otherwise>
                                        </c:choose>
                                        <button class="btn btn-info btn-sm ml-2" onclick="window.location.href = 'GDChiTiet631.jsp?id=${matHang.id}'">Chọn</button>
                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>

            </div>
        </div>
        <script>
            function searchItems() {
                var keyword = document.getElementById('keyword').value.trim();

                if (keyword === "") {
                    alert("Vui lòng nhập từ khóa tìm kiếm.");
                    return;
                }
                var currentUrl = window.location.href;
                var baseUrl = currentUrl.indexOf('?') === -1 ? currentUrl : currentUrl.split('?')[0];
                var newUrl = baseUrl + "?keyword=" + encodeURIComponent(keyword);
                window.location.href = newUrl;
            }
        </script>    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>


