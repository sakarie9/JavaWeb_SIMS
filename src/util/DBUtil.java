package util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
    public static String db_url = "jdbc:mysql://localhost:3306/db_student?serverTimezone=UTC";
    public static String db_user = "jsp";//数据库的用户名
    public static String db_password = "123123";//数据库的密码
    public static Connection getConn() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(db_url, db_user, db_password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static void close(Statement state, Connection conn)//关闭函数
    {
        if (state != null)//只有状态和连接时，先关闭状态
        {
            try {
                state.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void close(ResultSet rs, Statement state, Connection conn) {
        if (rs != null)//有结果集，状态和连接时，先关闭结果集，在关闭状态，在关闭连接
        {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (state != null) {
            try {
                state.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}