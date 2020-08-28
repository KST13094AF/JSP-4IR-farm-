package com.youngpoong.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.youngpoong.data.dataDto;

public class dataDao {
	private static dataDao data = null;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	
	public dataDao() {
		
	}
	
	public static synchronized dataDao getInstance() {
		if(data == null) {
			data = new dataDao();
		}
		return data;
	}
	
	private Connection getConnection() {
		String url = "jdbc:mysql://localhost:3306/youngpoong";
		String id = "root";
		String pw = "1423";
//		String url = "jdbc:mysql://localhost/newyour1964?characterEncoding=UTF-8&serverTimezone=UTC";
//		String id = "newyour1964";
//		String pw = "yp1357159!";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, pw);
			return conn;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	private void closeJdbc(Connection conn, Statement pstmt, ResultSet rs) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<dataDto> getData(String id){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<dataDto> list = new ArrayList<dataDto>();
		
		query.append("SELECT *").append(" FROM data").append(" WHERE ID = ?").append("ORDER BY num DESC");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dataDto dDto = new dataDto();
				dDto.setNum(rs.getInt("num"));
				dDto.setColumn(rs.getString("element"));
				dDto.setMsg(rs.getString("msg"));
				dDto.setDate(rs.getTimestamp("date"));
				dDto.setIp(rs.getString("ip"));
				list.add(dDto);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}
	
	public int insertData(dataDto dDto) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("INSERT INTO").append(" data").append(" VALUES(0, ?, ?, ?, ?, now())");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, dDto.getId());
			pstmt.setString(2, dDto.getColumn());
			pstmt.setString(3, dDto.getMsg());
			pstmt.setString(4, dDto.getIp());
			
			result = pstmt.executeUpdate();
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return -1;
	}
	
	public void deleteData(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("DELETE FROM").append(" data").append(" WHERE id = ?");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
	}
}
