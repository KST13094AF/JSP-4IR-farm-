package com.youngpoong.bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class bbsDao {
	private static bbsDao bbs = null;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	
	public bbsDao() {
		
	}
	
	public static synchronized bbsDao getInstance() {
		if(bbs == null) {
			bbs = new bbsDao();
		}
		return bbs;
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
	
	public ArrayList<bbsDto> getBbsList(){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<bbsDto> list = new ArrayList<bbsDto>();
		
		query.append("SELECT *").append(" FROM bbs").append(" WHERE available = 1").append(" ORDER BY id DESC");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bbsDto bDto = new bbsDto();
				bDto.setId(rs.getInt("id"));
				bDto.setUserID(rs.getString("userid"));
				bDto.setTitle(rs.getString("title"));
				bDto.setSeleter(rs.getString("options"));
				bDto.setContent(rs.getString("content"));
				bDto.setDate(rs.getTimestamp("date"));
				bDto.setAvailable(rs.getInt("available"));
				list.add(bDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return list;
	}
	
	public int getNext() {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("SELECT id").append(" FROM bbs").append(" ORDER BY id DESC");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1)+1;
			}
			return 1; 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public int bbsWrite(bbsDto bDto, int next) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("INSERT INTO").append(" bbs VALUES").append("(?, ?, ?, ?, ?, now(), 1)");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, next);
			pstmt.setString(2, bDto.getUserID());
			pstmt.setString(3, bDto.getSeleter());
			pstmt.setString(4, bDto.getTitle());
			pstmt.setString(5, bDto.getContent());
			result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return -1;
	}
	
	public bbsDto bbsRead(int id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("SELECT *").append(" FROM bbs").append(" WHERE id = ? ");
		bbsDto bDto = new bbsDto();
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bDto.setId(rs.getInt("id"));
				bDto.setUserID(rs.getString("userid"));
				bDto.setSeleter(rs.getString("options"));
				bDto.setTitle(rs.getString("title"));
				bDto.setContent(rs.getString("content"));
				bDto.setDate(rs.getTimestamp("date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return bDto;
	}
	
	public int bbsDelete(int id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE bbs").append(" SET available = 0").append(" WHERE id = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public int bbsUpdate(bbsDto bDto) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE bbs").append(" SET options = ?,").append(" title = ?,").append(" content = ?").append(" WHERE id = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, bDto.getSeleter());
			pstmt.setString(2, bDto.getTitle());
			pstmt.setString(3, bDto.getContent());
			pstmt.setInt(4, bDto.getId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
}
