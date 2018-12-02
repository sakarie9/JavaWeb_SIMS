package dao;

import bean.TeacherBean;
import util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class TeacherDao {
    public TeacherBean getTeacherByteaId(String teaId) {
        TeacherBean teacher = new TeacherBean();
        Connection conn = DBUtil.getConn();
        Statement state = null;
        ResultSet rs = null;
        try {
            String sql = "select * from teacher where teaId = '" + teaId + "'";
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            while (rs.next()) {
                teacher.setTeacher(
                        rs.getString("teaId"),
                        rs.getString("teaName"),
                        rs.getString("title"),
                        rs.getString("teaSex")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, state, conn);
        }
        return teacher;
    }
}
