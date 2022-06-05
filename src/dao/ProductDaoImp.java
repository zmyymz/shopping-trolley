package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import entity.Product;

//商品查询的实现类
public class ProductDaoImp {
	/* 查询所有商品 */
	public ArrayList<Product> findAll() {
		ArrayList<Product> list = new ArrayList<Product>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			// 1.获取数据库连接
			conn = BaseDao.getConnection();

			// 2.创建执行sql语句对象
			stmt = conn.createStatement();

			// 3.执行sql语句到mysql
			String sql = "select * from product";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setImg(rs.getString("img"));
				p.setDesc(rs.getString("desc"));
				p.setNum(rs.getInt("num"));
				p.setPrice(rs.getDouble("price"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(conn, stmt, rs);
		}
		return list;
	}
	
	/* 根据id查询商品 */
	public Product findById(int id) {
		Product p = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 1.获取数据库连接
			conn = BaseDao.getConnection();

			// 2.使用PreparedStatement防止SQL注入
			String sql = "select * from product where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			// 3.执行查询
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setImg(rs.getString("img"));
				p.setDesc(rs.getString("desc"));
				p.setNum(rs.getInt("num"));
				p.setPrice(rs.getDouble("price"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(conn, pstmt, rs);
		}
		return p;
	}
}
