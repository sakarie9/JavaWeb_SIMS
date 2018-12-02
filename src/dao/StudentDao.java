package dao;

import bean.StudentBean;
import util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class StudentDao {
    public StudentBean getStudentByStuno(String stuId) {
        StudentBean student = new StudentBean();
        Connection conn = DBUtil.getConn();
        Statement state = null;
        ResultSet rs = null;
        try {
            String sql = "select * from student where stuId = '" + stuId + "'";
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            while (rs.next()) {
                student.setStudent(
                        rs.getString("stuId"),
                        rs.getString("stuPsw"),
                        rs.getString("stuName"),
                        rs.getString("stuEmail"),
                        rs.getString("stuSex")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, state, conn);
        }
        return student;
    }

    public void updateStudent(StudentBean student){
        //TODO:更新学生信息
    }
}
