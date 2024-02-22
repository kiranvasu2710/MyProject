<%@page import="user.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="user.dao.CartDao"%>
<%@page import="com.bean.Cart"%>
<%@page import="java.util.List"%>
<%@page import="user.dao.WishlistDao"%>
<%@page import="com.bean.Wishlist"%>
<%
	int pid=Integer.parseInt(request.getParameter("pid"));
	int uid=Integer.parseInt(request.getParameter("uid"));
	Product p=ProductDao.getProduct(pid);
	Cart c=new Cart();
	c.setPid(pid);
	c.setUid(uid);
	c.setProduct_qty(1);
	c.setProduct_price(p.getProduct_price());
	c.setTotal_price(p.getProduct_price());
	CartDao.addToCart(c);
	List<Cart> list=CartDao.getCartByUser(uid);
	session.setAttribute("cart_count", list.size());
	response.sendRedirect("mycart.jsp");
%>
