<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/4/13
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = request.getParameter("name-edit");
    String position = request.getParameter("position-edit");
    String salary = request.getParameter("salary-edit");
    String start_date = request.getParameter("start-date-edit");
    String office = request.getParameter("office-edit");
    String extn = request.getParameter("extn-edit");
    String status = request.getParameter("status-edit");
    String role = request.getParameter("role-edit");

    Connection conn = new com.thxopen.dt.sys.Config(application).getConn();
    PreparedStatement stmt = null;

    if (conn != null) {
        String sql = "update user set position = ?,salary = ?,start_date = ?,office = ?,extn = ?, status = ?,role =? where name = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(8, name);
        stmt.setString(1, position);
        stmt.setString(2, salary);
        stmt.setString(3, start_date);
        stmt.setString(4, office);
        stmt.setString(5, extn);
        stmt.setString(6, status);
        stmt.setString(7, role);

        int flag = stmt.executeUpdate();
        out.print(flag);
    }
    stmt.close();
    conn.close();
%>
