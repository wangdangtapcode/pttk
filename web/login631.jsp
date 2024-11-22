<%-- 
    Document   : login
    Created on : Nov 8, 2024, 1:32:41 PM
    Author     : quang
--%>

<%@page import="Model.NguoiDung631"%>
<%@page import="Controller.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng nhập</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet">
    </head>
    <body>
        <div class="login-container">
            <div class="text-center">
                <h2>Đăng nhập</h2>
            </div>

            <!-- Kiểm tra nếu có thông báo lỗi hoặc thành công -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>

            <form action="login631.jsp" method="post">
                <div class="form-group">
                    <label for="username">Tên đăng nhập</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Nhập tên đăng nhập" required>
                </div>
                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block login-btn">Đăng nhập</button>
            </form>
        </div>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username != null && password != null) {
                LoginDAO loginDAO = new LoginDAO();
                NguoiDung631 user = loginDAO.checkLogin(username, password);
                if (user != null) {
                    if (user.getViTri().equals("Nhân viên bán hàng")) {
                        session.setAttribute("nvbh", user);
                        response.sendRedirect("GDMenuNV631.jsp");
                    } else if (user.getViTri().equals("Khách hàng")) {
                        session.setAttribute("kh", user);
                        response.sendRedirect("GDMenu631.jsp");
                    }
                } else {
                    request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không chính xác!");
                    request.getRequestDispatcher("login631.jsp").forward(request, response);
                }
            }

        %>

        <!-- Liên kết với Bootstrap JS và jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

