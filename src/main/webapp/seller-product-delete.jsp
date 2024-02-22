<%@page import="user.dao.ProductDao"%>
<%
	int pid= Integer.parseInt(request.getParameter("pid"));
	ProductDao.deleteProduct(pid);
	response.sendRedirect("seller-view-product.jsp");

%>