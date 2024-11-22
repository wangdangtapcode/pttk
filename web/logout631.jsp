<%-- 
    Document   : logout
    Created on : Nov 19, 2024, 5:58:49 PM
    Author     : quang
--%>

<%@page import="Controller.DAO631"%>
<%@ page session="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
    session.invalidate();
    response.sendRedirect("login631.jsp");
%>

