package com.youngpoong.farm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class farmDao {
	private static farmDao farm = null;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public farmDao() {

	}

	public static synchronized farmDao getInstance() {
		if (farm == null) {
			farm = new farmDao();
		}
		return farm;
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

	public ArrayList<farmDto> getFarmInfo(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<farmDto> list = new ArrayList<farmDto>();

		query.append("SELECT *").append(" FROM farm").append(" WHERE ID = ?").append("ORDER BY num DESC");

		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				farmDto fDto = new farmDto();
				fDto.setNum(rs.getInt("num"));
				fDto.setO(rs.getInt("O"));
				fDto.setN(rs.getInt("N"));
				fDto.setC(rs.getInt("C"));
				fDto.setT(rs.getInt("T"));
				fDto.setH(rs.getInt("H"));
				fDto.setG(rs.getInt("G"));
				fDto.setS(rs.getInt("S"));
				fDto.setData(rs.getTimestamp("dtime"));
				list.add(fDto);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}

	public ArrayList<farmDto> getFarmInfo_now(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<farmDto> list = new ArrayList<farmDto>();

		query.append("SELECT *").append(" FROM farm")
				.append(" WHERE ID = ? AND dtime > DATE_FORMAT(CURDATE(), '%Y-%m-%d')").append(" order by num desc");

		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				farmDto fDto = new farmDto();
				fDto.setNum(rs.getInt("num"));
				fDto.setO(rs.getInt("O"));
				fDto.setN(rs.getInt("N"));
				fDto.setC(rs.getInt("C"));
				fDto.setT(rs.getInt("T"));
				fDto.setH(rs.getInt("H"));
				fDto.setG(rs.getInt("G"));
				fDto.setS(rs.getInt("S"));
				fDto.setData(rs.getTimestamp("dtime"));
				list.add(fDto);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}

	public ArrayList<farmDto> getAvgOCN_Week(String id){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		ArrayList<farmDto> list = new ArrayList<>();
		query.append("SELECT AVG(o), AVG(n), AVG(c), dtime").append(" FROM farm")
				.append(" WHERE ID = ?").append(" GROUP BY DATE_FORMAT(dtime, '%Y-%m-%d')").append(" ORDER BY DATE_FORMAT(dtime, '%Y-%m-%d') DESC").append(" limit 7");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				farmDto fDto = new farmDto();
				fDto.setO(rs.getInt("AVG(o)"));
				fDto.setN(rs.getInt("AVG(n)"));
				fDto.setC(rs.getInt("AVG(c)"));
				fDto.setData(rs.getTimestamp("dtime"));
				list.add(fDto);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}
	
	public ArrayList<farmDto> getAvgTH_Week(String id){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		ArrayList<farmDto> list = new ArrayList<>();
		query.append("SELECT AVG(t), AVG(h), dtime").append(" FROM farm").append(" WHERE ID = ?")
		.append(" GROUP BY DATE_FORMAT(dtime, '%Y-%m-%d')").append(" ORDER BY num DESC").append(" limit 7");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				farmDto fDto = new farmDto();
				fDto.setT(rs.getInt("AVG(t)"));
				fDto.setH(rs.getInt("AVG(h)"));
				fDto.setData(rs.getTimestamp("dtime"));
				list.add(fDto);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}
	
	public ArrayList<farmDto> getAvgGS_Week(String id){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		ArrayList<farmDto> list = new ArrayList<>();
		query.append("SELECT AVG(g), AVG(s), dtime").append(" FROM farm").append(" WHERE ID = ?")
		.append(" GROUP BY DATE_FORMAT(dtime, '%Y-%m-%d')").append(" ORDER BY num DESC").append(" limit 7");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				farmDto fDto = new farmDto();
				fDto.setG(rs.getInt("AVG(g)"));
				fDto.setS(rs.getInt("AVG(s)"));
				fDto.setData(rs.getTimestamp("dtime"));
				list.add(fDto);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}

	public ArrayList<farmDto> getFarmInfo_Date(String id, String date) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<farmDto> list = new ArrayList<farmDto>();
		
		query.append("SELECT *").append(" FROM farm").append(" WHERE ID = ?").append(" AND DATE(dtime) = ?")
		.append(" order by num desc");
		
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, date);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				farmDto fDto = new farmDto();
				fDto.setNum(rs.getInt("num"));
				fDto.setO(rs.getInt("O"));
				fDto.setN(rs.getInt("N"));
				fDto.setC(rs.getInt("C"));
				fDto.setT(rs.getInt("T"));
				fDto.setH(rs.getInt("H"));
				fDto.setG(rs.getInt("G"));
				fDto.setS(rs.getInt("S"));
				fDto.setData(rs.getTimestamp("dtime"));
				list.add(fDto);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}
	
	public ArrayList<farmDto> getRecode(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		ArrayList<farmDto> list = new ArrayList<farmDto>();

		query.append("SELECT dtime, COUNT(*)").append(" FROM farm").append(" where id = ?").append(" group by date_format(dtime, '%Y-%m-%d')")
				.append(" order by dtime desc").append(" limit 7");

		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				farmDto fDto = new farmDto();
				fDto.setData(rs.getTimestamp(1));
				fDto.setTimeNum(rs.getInt(2));
				list.add(fDto);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}
	
	public void deleteData(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("DELETE FROM").append(" farm").append(" WHERE id = ?");
		
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
