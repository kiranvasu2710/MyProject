<%@page import="user.dao.CartDao"%>
<%@page import="com.bean.Cart"%>
<%
	int product_qty=Integer.parseInt(request.getParameter("product_qty"));
	int cid=Integer.parseInt(request.getParameter("cid"));
	Cart c=CartDao.getCart(cid);
	int total_price=c.getTotal_price();
	int product_price=c.getProduct_price();
	total_price=product_price*product_qty;
	c.setTotal_price(total_price);
	c.setProduct_qty(product_qty);
	CartDao.changeQuantity(c);
	response.sendRedirect("mycart.jsp");
%>