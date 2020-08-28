package com.youngpoong.user;

import java.sql.*;
/*
 * <------------------------------------------------------- 占싱깍옙占쏙옙 占쏙옙占쏙옙 ------------------------------------------------------------------->
 */
public class userDao {
	private static userDao user = null;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;

	public userDao() {

	}

	public static synchronized userDao getInstance() {
		if (user == null)
			user = new userDao();
		return user;
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

	// ---------------------------------------------------------------------------회占쏙옙占쏙옙占쏙옙
	public int join(userDto user) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("INSERT INTO user").append(" VALUES (?, ?, ?, ?, ?, ?)");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getId());
			pstmt.setString(3, user.getPw());
			pstmt.setString(4, user.getFarm());
			pstmt.setString(5, user.getEmail());
			pstmt.setInt(6, 1);
			result = pstmt.executeUpdate();

			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, null);
		}
		return -1;
	}

	// ---------------------------------------------------------------------------占싸깍옙占쏙옙
	public int login(String id, String pw) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("SELECT pw").append(" FROM user").append(" WHERE ID = ? AND available = 1");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("pw").equals(pw))
					return 1;
				else
					return 0;
			} else
				return 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return -1;
	}

	// ---------------------------------------------------------------------------회占쏙옙 占쏙옙占쏙옙
	public int deleteUser(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE user").append(" SET available = 0").append(" WHERE ID = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();

			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return -1;
	}

	// ---------------------------------------------------------------------------회占쏙옙 占쏙옙占쏙옙
	public int updateUser(userDto uDto) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE user").append(" SET name = ?").append(", email = ?").append(", farm = ?").append(" WHERE id = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, uDto.getName());
			pstmt.setString(2, uDto.getEmail());
			pstmt.setString(3, uDto.getFarm());
			pstmt.setString(4, uDto.getId());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return result;
	}

	// ---------------------------------------------------------------------------회占쏙옙 占쏙옙橘占싫� 占쏙옙占쏙옙
	public int updatePw(String id, String pwN) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE user").append(" SET pw = ?").append(" WHERE id = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, pwN);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();

			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return -1;
	}

	// ---------------------------------------------------------------------------회占쏙옙 占쏙옙橘占싫� 占쏙옙占쏙옙
	public String getUserPw(String id) {
		String pw = null;
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("SELECT pw").append(" FROM user").append(" WHERE id = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pw = rs.getString("pw");
				return pw;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}

	// ---------------------------------------------------------------------------회占쏙옙 占쏙옙占쏙옙
	public userDto getUserInfo(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		userDto uDto = new userDto();

		query.append("SELECT *").append(" FROM user").append(" WHERE ID = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				uDto.setName(rs.getString("name"));
				uDto.setId(rs.getString("id"));
				uDto.setFarm(rs.getString("farm"));
				uDto.setEmail(rs.getString("email"));
				return uDto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}

	// ---------------------------------------------------------------------------회占쏙옙 占쏙옙占쏙옙
	public int getUserInfo(String id, String email) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();

		query.append("SELECT *").append(" FROM user").append(" WHERE id = ? AND email = ?").append(" AND available = 1");;
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 1;
			}else
				return 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return -1;
	}
	// ---------------------------------------------------------------------------회占쏙옙 占쏙옙占쏙옙
	public userDto getEmaliInfo(String id) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		userDto uDto = new userDto();

		query.append("SELECT email").append(" FROM user").append(" WHERE ID = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				uDto.setId(id);
				uDto.setEmail(rs.getString("email"));
				return uDto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeJdbc(conn, pstmt, rs);
		}
		return null;
	}
}
