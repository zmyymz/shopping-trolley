package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.tomcat.jni.Proc;
//import java.sql.*;
import org.omg.CORBA.PUBLIC_MEMBER;

import com.sun.org.apache.regexp.internal.recompile;

import entity.Product;
import jdk.internal.org.objectweb.asm.commons.StaticInitMerger;

//������Ʒ��ʵ����
public class ProductDaoImp {
	/* ����,����������ѯ��Ʒ */
	public ArrayList findAll() {

		ArrayList list = new ArrayList();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			// 1.�����ݿ�����
			conn = BaseDao.getConnection();

			// 2.����ִ��sql������
			stmt = conn.createStatement();

			// 3.����sql��䵽mysql
			String sql = "select * from product";
			rs = stmt.executeQuery(sql);
			// rs�����--->����--->��װproduct--->����ArrayList
			
			while (rs.next())// ѭ��һ��ֻ����һ��
			{
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setImg(rs.getString("img"));
				p.setDesc(rs.getString("desc"));
				p.setNum(rs.getInt("num"));
				p.setPrice(rs.getDouble("price"));
				System.out.println(p.getName());
				list.add(p);
			}
			// 4.
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(conn, (com.mysql.jdbc.Statement) stmt, rs);
		}
		return list;
	}
	
	public Product findById(int id) {

		//ArrayList list = new ArrayList();
		Product p = new Product();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			// 1.�����ݿ�����
			conn = BaseDao.getConnection();

			// 2.����ִ��sql������
			stmt = conn.createStatement();

			// 3.����sql��䵽mysql
			String sql = "select * from product where id =" + id;
			rs = stmt.executeQuery(sql);
			// rs�����--->����--->��װproduct--->����ArrayList
			
			while (rs.next())// ѭ��һ��ֻ����һ��
			{
				//Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setImg(rs.getString("img"));
				p.setDesc(rs.getString("desc"));
				p.setNum(rs.getInt("num"));
				p.setPrice(rs.getDouble("price"));
				//System.out.println(p.getName());
				//list.add(p);
			}
			// 4.
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			BaseDao.closeAll(conn, (com.mysql.jdbc.Statement) stmt, rs);
		}
		return p;
	}
//	public static void main(String[] args)throws Throwable{
//		new ProductDaoImp().findAll();
//	}

}
