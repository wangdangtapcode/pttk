<%-- 
    Document   : GDThongBaoThanhCong
    Created on : Nov 19, 2024, 9:20:20 AM
    Author     : quang
--%>
<%@page import="Controller.HoaDonDAO631"%>
<%@page import="Model.HoaDon631"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Báo</title>
    <style>
        /* Cấu hình chung cho trang */
        body {
            font-family: Arial, sans-serif;
            background-color: #e9f7f1;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Cấu hình cho thông báo */
        .notification {
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: none; /* Ban đầu ẩn thông báo */
            animation: slideIn 0.5s ease-out;
        }

        /* Màu thông báo thành công */
        .success {
            background-color: #4CAF50;
            color: white;
        }

        /* Màu thông báo thất bại */
        .failure {
            background-color: #f44336;
            color: white;
        }

        /* Hiệu ứng khi thông báo xuất hiện */
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Nút quay lại trang chủ */
        .back-btn {
            margin-top: 20px;
            background-color: #6C9E6A;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #53914b;
        }
    </style>
</head>

<body>

    <% 
        HoaDon631 hd = (HoaDon631) session.getAttribute("hd");
        HoaDonDAO631 hdd = new HoaDonDAO631();
        boolean isSuccess = hdd.luuHoaDon(hd); // Lưu kết quả thao tác

        // Truyền kết quả vào một biến để điều khiển hiển thị thông báo
        session.setAttribute("tbao", isSuccess);
    %>

    <!-- Thông báo thành công hoặc thất bại -->
    <div class="notification" id="notification">
        <h3 id="notificationTitle">Thao tác thành công!</h3>
        <p id="notificationMessage">Hoá đơn của bạn đã được lưu thành công.</p>
        <button class="back-btn" onclick="goHome()">Quay lại trang chủ</button>
    </div>

    <script>
        // Hàm để hiển thị thông báo thành công hoặc thất bại
        function showNotification(isSuccess) {
            const notification = document.getElementById('notification');
            const notificationTitle = document.getElementById('notificationTitle');
            const notificationMessage = document.getElementById('notificationMessage');

            // Nếu thành công, hiển thị thông báo thành công
            if (isSuccess) {
                notification.classList.add('success');
                notificationTitle.textContent = "Thao tác thành công!";
                notificationMessage.textContent = "Hoá đơn của bạn đã được lưu thành công.";
            } else {
                notification.classList.add('failure');
                notificationTitle.textContent = "Thao tác thất bại!";
                notificationMessage.textContent = "Có lỗi xảy ra, vui lòng thử lại.";
            }

            // Hiển thị thông báo
            notification.style.display = 'block';
        }

        // Lấy giá trị từ session và hiển thị thông báo
        <% 
            Boolean a = (Boolean) session.getAttribute("tbao");
            if (a != null) {
                out.print("showNotification(" + isSuccess + ");");
            }
        %>

        // Hàm để quay lại trang chủ (hoặc trang khác)
        function goHome() {
            window.location.href = 'GDMenuNV631.jsp'; // Thay đổi đường dẫn trang chủ nếu cần
        }

        // Hiển thị thông báo sau khi trang được tải
        setTimeout(() => {
            <% 
                Boolean b = (Boolean) session.getAttribute("tbao");
                if (b != null) {
                    out.print("showNotification(" + isSuccess + ");");
                }
            %>
        }, 1000); // Hiển thị sau 1 giây (hoặc ngay lập tức)
    </script>

</body>

</html>



