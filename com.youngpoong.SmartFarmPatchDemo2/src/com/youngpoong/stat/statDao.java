package com.youngpoong.stat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class statDao {
	private static statDao stat = null;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;

	public statDao() {

	}

	public static synchronized statDao getInstance() {
		if (stat == null)
			stat = new statDao();
		return stat;
	}

	// ---------------------------------------------------------------------------
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

	// ---------------------------------------------------------------------------
	// 커占쌔쇽옙 占쏙옙占쏙옙
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

	public int init(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		StringBuffer query2 = new StringBuffer();
		query.append("INSERT INTO").append(" stat VALUES").append("('moment', ?, -1, -1, -1, -1, -1, -1, -1, -1, now())");
		query2.append("INSERT INTO").append(" stat VALUES").append("('goal', ?, -1, -1, -1, -1, -1, -1, -1, -1, now())");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
			pstmt.close();
			pstmt = conn.prepareStatement(query2.toString());
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}

	public statDto getStat(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		statDto sDto = new statDto();

		query.append("SELECT *").append(" FROM stat").append(" WHERE ID = ?").append(" AND name = 'moment'");

		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sDto.setO(rs.getFloat("o"));
				sDto.setN(rs.getFloat("n"));
				sDto.setC(rs.getFloat("c"));
				sDto.setT(rs.getFloat("t"));
				sDto.setH(rs.getFloat("h"));
				sDto.setG(rs.getFloat("g"));
				sDto.setS(rs.getFloat("s"));
				sDto.setAir(rs.getInt("air"));
				sDto.setDate(rs.getTimestamp("dtime"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return sDto;
	}
	
	public statDto getGoal(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		statDto sDto = new statDto();

		query.append("SELECT *").append(" FROM stat").append(" WHERE ID = ?").append(" AND name = 'goal'");

		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sDto.setO(rs.getFloat("o"));
				sDto.setN(rs.getFloat("n"));
				sDto.setC(rs.getFloat("c"));
				sDto.setT(rs.getFloat("t"));
				sDto.setH(rs.getFloat("h"));
				sDto.setG(rs.getFloat("g"));
				sDto.setS(rs.getFloat("s"));
				sDto.setAir(rs.getInt("air"));
				sDto.setDate(rs.getTimestamp("dtime"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return sDto;
	}
	
	public int setGoal(String id, String column, float goal) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("UPDATE stat").append(" SET ").append(column).append(" = ?").append(", dtime = now()").
		append(" WHERE ID = ?").append(" AND name = 'goal'");

		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setFloat(1, goal);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public int getElementStat(String id, String column) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
	
		query.append("SELECT ").append(column).append(" FROM stat").append(" WHERE ID = ?").append(" AND name = 'moment'");

		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public void deleteStat(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("DELETE FROM").append(" stat").append(" WHERE id = ?");
		
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
