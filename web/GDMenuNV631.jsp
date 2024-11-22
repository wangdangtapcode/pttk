<%-- 
    Document   : GDMenu631
    Created on : Nov 8, 2024, 1:44:37 PM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/menuKH.css" rel="stylesheet">

    </head>
    <body>
        <div class="card text-center">           
            <div class="card-header">
                Menu nhân viên bán hàng
            </div>
            <div class="card-body">
                <button onclick="location.href = 'GDDanhSachDonHang631.jsp'" class="btn btn-primary btn-block">Duyệt đơn</button>

                <button onclick="location.href = 'logout631.jsp'" class="btn btn-danger btn-block">Đăng xuất</button>
            </div>

        </div>

        <!-- Liên kết với Bootstrap JS -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>