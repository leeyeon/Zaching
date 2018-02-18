<%@page import="com.zaching.service.user.*"%> 
<%@page import="com.zaching.service.user.impl.*" %>
<%@ page pageEncoding="UTF-8"%> 

<% 
   	UserDaoImpl userDao = new UserDaoImpl();
     
    //받아온 id값을 읽어보자 
    String id = request.getParameter("id"); 
     
    out.println(userDao.getPWD(id)); 
%>

<html>
fdafda
</html>