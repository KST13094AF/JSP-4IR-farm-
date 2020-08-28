package com.youngpoong.sensor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class sensorDao {
	private static sensorDao sensor = null;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;

	public sensorDao() {

	}

	public static synchronized sensorDao getInstance() {
		if (sensor == null)
			sensor = new sensorDao();
		return sensor;
	}

	// --------------------------------------------------------------------------- 커占쌔쇽옙
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

	// --------------------------------------------------------------------------- 커占쌔쇽옙 占쏙옙占쏙옙
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
	
	public sensorDto getSensorStat(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		sensorDto sDto = new sensorDto();

		query.append("SELECT *").append(" FROM sensor").append(" WHERE ID = ?");

		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sDto.setAuto(rs.getInt("autos"));
				sDto.setAris(rs.getInt("airs"));
				sDto.setInsertAuto(rs.getInt("insertAutos"));
				sDto.setTs(rs.getInt("ts"));
				sDto.setHs(rs.getInt("hs"));
				sDto.setGs(rs.getInt("gs"));
				sDto.setSs(rs.getInt("ss"));
				sDto.setPs(rs.getInt("cs"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return sDto;
	}
	
	public int init(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("INSERT INTO").append(" sensor VALUES").append("(? ,0 ,0, 0, 0, 0, 0, 0, 0)");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public int setSensorStat(String id, String column) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("UPDATE sensor").append(" SET ").append(column).append(" = 1").append(" WHERE ID = ?");

		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public int setSensorStat(String id, String column, int num) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("UPDATE sensor").append(" SET ").append(column).append(" = ?").append(" WHERE ID = ?");

		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, num);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public int setSensorStop(String id, String column) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("UPDATE sensor").append(" SET ").append(column).append(" = 0").append(" WHERE ID = ?");

		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}
	
	public void deleteSensor(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("DELETE FROM").append(" sensor").append(" WHERE id = ?");
		
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
