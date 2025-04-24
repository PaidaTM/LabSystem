<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="service.*" %>
<%@ page import="model.*" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    WebApplicationContext context= WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
    LabUserService labUserService = (LabUserService) context.getBean("labUserService");
    EquipmentService equipmentService = (EquipmentService) context.getBean("equipmentService");
    DeviceService deviceService = (DeviceService) context.getBean("deviceService");
    StatusTypeService statusTypeService = (StatusTypeService) context.getBean("statusTypeService");
%>
