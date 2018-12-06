package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import util.DBUtil;

public class LoginDao {
    public int login_student(String username, String password) {
        Connection conn = DBUtil.getConn();
        Statement state = null;
        ResultSet rs = null;
        int flag = 0;
        try {
            String sql = "select stuPsw from student where stuId = '" + username + "'";
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            if(rs.next())
                if(rs.getString("stuPsw").equals(password))
                    flag=1;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, state, conn);
        }
        return flag;
    }
    public int login_teacher(String username, String password) {
        Connection conn = DBUtil.getConn();
        Statement state = null;
        ResultSet rs = null;
        int flag = 0;
        try {
            String sql = "select teaPsw from teacher where teaId = '" + username + "'";
            //System.out.println(sql);
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            if(rs.next())
                if(rs.getString("teaPsw").equals(password))
                    flag=1;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, state, conn);
        }
        return flag;
    }

    public int login_admin(String username, String password) {
        Connection conn = DBUtil.getConn();
        Statement state = null;
        ResultSet rs = null;
        int flag = 0;
        try {
            String sql = "select adminPsw from admin where adminId = '" + username + "'";
            //System.out.println(sql);
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            if(rs.next())
                if(rs.getString("adminPsw").equals(password))
                    flag=1;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, state, conn);
        }
        return flag;
    }
}
