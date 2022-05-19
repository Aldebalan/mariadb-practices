package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.OrderVo;

public class OrderDao {

	public List<OrderVo> findAll() {
		List<OrderVo> result = new ArrayList<>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			connection = getConnection();

			String sql =
				"SELECT a.no, c.title, b.amount, a.price "
				+ "  FROM orders a, orders_book b, book c "
				+ "where a.no = b.orders_no "
				+ "and b.book_no = c.no";
			pstmt = connection.prepareStatement(sql);
	
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderVo vo = new OrderVo();
				vo.setNo(rs.getString(1));
				vo.setBook_title(rs.getString(2));
				vo.setAmount(rs.getString(3));
				vo.setPrice(rs.getString(4));
				
				result.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;	
	}

	public static boolean insert(OrderVo vo) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement pstmt = null;
				
		try {
			connection = getConnection();
				
			String sql = " Insert into orders values (?,?,?,?) ";
			pstmt = connection.prepareStatement(sql);	
			pstmt.setString(1, vo.getNo());
			pstmt.setString(2,vo.getPrice());
			pstmt.setString(3,vo.getShip());
			pstmt.setLong(4,vo.getMember_no());		
					
			int count = pstmt.executeUpdate();
			result = count == 1;
		} catch (SQLException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public static void insertOrderBook(OrderVo vo) {
		Connection connection = null;
		PreparedStatement pstmt = null;
				
		try {
			connection = getConnection();
				
			String sql = "Insert into orders_book values (?,?,?) ";
			pstmt = connection.prepareStatement(sql);			
			pstmt.setLong(1,vo.getBook_no());
			pstmt.setString(2,vo.getNo());
			pstmt.setString(3,vo.getAmount());			
						
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private static Connection getConnection() throws SQLException{
		Connection connection = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			
			String url = "jdbc:mysql://192.168.10.31:3306/bookmall?charset=utf8";
			connection = DriverManager.getConnection(url, "bookmall", "bookmall");
			
		} catch (ClassNotFoundException e) {
			System.out.println("ERROR: " + e);
		}
		return connection;		
	}

	


	
}