package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertTest01 {

	public static void main(String[] args) {
		insertDepartment("영업");
		insertDepartment("개발");
		insertDepartment("기획");
	}

	public static boolean insertDepartment(String name) {
		Connection conn = null;
		Statement stmt = null;
		boolean result = false;

		try {
			//1. JDBC Driver 로딩
			Class.forName("org.mariadb.jdbc.Driver");

			//2. 연결하기
			String url = "jdbc:mysql://192.168.80.131:3307/employees?charset=utf8";
			conn = DriverManager.getConnection(url, "hr", "hr");

			//3. Statement 생성
			stmt = conn.createStatement();

			//4. SQL문을 실행
			String sql =
				" insert" + 
			    "   into dept" + 
				" values (null, '" + name + "')";

			int count = stmt.executeUpdate(sql);
			result = count == 1;
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		} catch (SQLException e) {
			System.out.println("error:" + e);
		} finally {
			try {
				// 자원정리(clean-up)
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

}