package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Cart;
import com.bean.Wishlist;
import com.util.UserUtil;

public class CartDao {
	
	public static void addToCart(Cart c)
	{
		try {
			Connection conn=UserUtil.createConnection();
			String sql="insert into cart(pid,uid,product_price,product_qty,total_price) values(?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, c.getPid());
			pst.setInt(2, c.getUid());
			pst.setInt(3, c.getProduct_price());
			pst.setInt(4, c.getProduct_qty());
			pst.setInt(5, c.getTotal_price());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void removeFromCart(Cart c)
	{
		boolean payment_status=false;
		try {
			Connection conn=UserUtil.createConnection();
			String sql="delete from cart where pid=? and uid=? and payment_status=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, c.getPid());
			pst.setInt(2, c.getUid());
			pst.setBoolean(3, payment_status);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void changeQuantity(Cart c)
	{
		try {
			Connection conn=UserUtil.createConnection();
			String sql="update cart set product_qty=?,total_price=? where cid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, c.getProduct_qty());
			pst.setInt(2, c.getTotal_price());
			pst.setInt(3, c.getCid());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static boolean checkCart(int pid, int uid)
	{
		boolean flag=false;
		boolean payment_status=false;
		try {
			Connection conn=UserUtil.createConnection();
			String sql="select * from cart where pid=? and uid=? and payment_status=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			pst.setBoolean(3, payment_status);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
					flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public static List<Cart> getCartByUser(int uid)
	{
		boolean payment_status=false;
		List<Cart> list=new ArrayList<Cart>();
		try {
			Connection conn=UserUtil.createConnection();
			String sql="select * from cart where uid=? and payment_status=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, uid);
			pst.setBoolean(2, payment_status);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				Cart c=new Cart();
				c.setCid(rs.getInt("cid"));
				c.setPid(rs.getInt("pid"));
				c.setUid(rs.getInt("uid"));
				c.setProduct_price(rs.getInt("product_price"));
				c.setProduct_qty(rs.getInt("product_qty"));
				c.setTotal_price(rs.getInt("total_price"));
				c.setPayment_status(rs.getBoolean("payment_status"));
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static List<Cart> getOrderByUser(int uid)
	{
		boolean payment_status=true;
		List<Cart> list=new ArrayList<Cart>();
		try {
			Connection conn=UserUtil.createConnection();
			String sql="select * from cart where uid=? and payment_status=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, uid);
			pst.setBoolean(2, payment_status);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				Cart c=new Cart();
				c.setCid(rs.getInt("cid"));
				c.setPid(rs.getInt("pid"));
				c.setUid(rs.getInt("uid"));
				c.setProduct_price(rs.getInt("product_price"));
				c.setProduct_qty(rs.getInt("product_qty"));
				c.setTotal_price(rs.getInt("total_price"));
				c.setPayment_status(rs.getBoolean("payment_status"));
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static Cart getCart(int cid)
	{
		Cart c=null;
		try {
			Connection conn=UserUtil.createConnection();
			String sql="select * from cart where cid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, cid);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				c=new Cart();
				c.setCid(rs.getInt("cid"));
				c.setPid(rs.getInt("pid"));
				c.setUid(rs.getInt("uid"));
				c.setProduct_price(rs.getInt("product_price"));
				c.setProduct_qty(rs.getInt("product_qty"));
				c.setTotal_price(rs.getInt("total_price"));
				c.setPayment_status(rs.getBoolean("payment_status"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	public static void updateCartPaymentStatus(int cid)
	{
		boolean payment_status=true;
		try {
			Connection conn=UserUtil.createConnection();
			String sql="update cart set payment_status=? where cid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setBoolean(1, payment_status);
			pst.setInt(2, cid);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
