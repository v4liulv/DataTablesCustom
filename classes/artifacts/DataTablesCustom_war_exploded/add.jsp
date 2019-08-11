<%@ page import="java.sql.*" %>
<%@ page import="com.thxopen.dt.sys.Config" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/4/13
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    System.out.println();
    String name = request.getParameter("name-add");
    String position = request.getParameter("position-add");
    String salary = request.getParameter("salary-add");
    String start_date = request.getParameter("start-date-add");
    String office = request.getParameter("office-add");
    String extn = request.getParameter("extn-add");
    String status = request.getParameter("status-add");
    String role = request.getParameter("role-add");

    PreparedStatement stmt = null;
    Connection conn = new Config(application).getConn();
    if (conn != null) {
        String sql = "insert into user(name, position, salary, start_date, office, extn, status, role) values (?,?,?,?,?,?,?,?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1,name);
        stmt.setString(2,position);
        stmt.setString(3,salary);
        stmt.setString(4,start_date);
        stmt.setString(5,extn);
        stmt.setString(6,office);
        stmt.setString(7,status);
        stmt.setString(8,role);

        int flag = stmt.executeUpdate();
        out.print(flag);
    }
    stmt.close();
    conn.close();
%>
