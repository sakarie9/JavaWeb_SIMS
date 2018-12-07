package dao;

import bean.StudentBean;
import util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
        Connection conn = DBUtil.getConn();
        Statement state = null;
        String sql = "update student " +
                "set stuName='"+student.getStuName()+"'," +
                "stuSex='"+student.getStuSex()+"',"+
                "stuEmail='"+student.getStuEmail()+"',"+
                "stuPsw='" + student.getStuPsw() + "'" +
                " where stuId='" + student.getStuId() + "'";
        //System.out.println(sql);
        try{
            state = conn.createStatement();
            state.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(state, conn);
        }
    }

    public boolean insertStudent(StudentBean student){
        boolean isDone=false;
        Connection conn = DBUtil.getConn();
        Statement state = null;
        if(student.getStuPsw().equals("")){
            student.setStuPsw("111111");
        }
        String sql = "insert into student" +
                "(stuId,stuName,stuSex,stuEmail,stuPsw)" +
                "values ('"+student.getStuId()+"','"+student.getStuName()+"','"+student.getStuSex()+"','"+student.getStuEmail()+"','"+student.getStuPsw()+"')";
        //System.out.println(sql);
        try{
            state = conn.createStatement();
            state.executeUpdate(sql);
            isDone=true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(state, conn);
        }
        //System.out.println(isDone);
        return isDone;
    }

    public void deleteStudent(String stuId){
        Connection conn = DBUtil.getConn();
        Statement state = null;
        String sql = "delete from student where stuId='"+stuId+"'";
        System.out.println(sql);
        try{
            state = conn.createStatement();
            state.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(state, conn);
        }
    }

    public List getAllStudent(){
        List<StudentBean> studentList = new ArrayList<>();
        Connection conn = DBUtil.getConn();
        Statement state = null;
        ResultSet rs = null;
        try {
            String sql = "select * " +
                    "from student ";
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            while (rs.next()) {
                StudentBean student = new StudentBean();
                student.setStudent(
                        rs.getString("stuId"),
                        rs.getString("stuPsw"),
                        rs.getString("stuName"),
                        rs.getString("stuEmail"),
                        rs.getString("stuSex")
                );
                studentList.add(student);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, state, conn);
        }
        return studentList;
    }
}
