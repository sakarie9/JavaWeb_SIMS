package dao;

import bean.TeacherBean;
import util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
                        rs.getString("teaSex"),
                        rs.getString("teaPsw")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, state, conn);
        }
        return teacher;
    }
    public List getAllTeacher(){
        List<TeacherBean> teacherList = new ArrayList<>();
        Connection conn = DBUtil.getConn();
        Statement state = null;
        ResultSet rs = null;
        try {
            String sql = "select * " +
                    "from teacher ";
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            while (rs.next()) {
                TeacherBean teacher = new TeacherBean();
                teacher.setTeacher(
                        rs.getString("teaId"),
                        rs.getString("teaName"),
                        rs.getString("title"),
                        rs.getString("teaSex"),
                        rs.getString("teaPsw")
                );
                teacherList.add(teacher);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, state, conn);
        }
        return teacherList;
    }

    public void updateTeacher(TeacherBean teacher){
        Connection conn = DBUtil.getConn();
        Statement state = null;
        String sql = "update teacher " +
                "set teaName='"+teacher.getTeaName()+"'," +
                "teaSex='"+teacher.getTeaSex()+"',"+
                "title='"+teacher.getTitle()+"',"+
                "teaPsw='" + teacher.getTeaPsw() + "'" +
                " where teaId='" + teacher.getTeaId() + "'";
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

    public boolean insertTeacher(TeacherBean teacher){
        boolean isDone=false;
        Connection conn = DBUtil.getConn();
        Statement state = null;
        if(teacher.getTeaPsw().equals("")){
            teacher.setTeaPsw("111111");
        }
        String sql = "insert into teacher" +
                "(teaId,teaName,teaSex,title,teaPsw)" +
                "values ('"+teacher.getTeaId()+"','"+teacher.getTeaName()+"','"+teacher.getTeaSex()+"','"+teacher.getTitle()+"','"+teacher.getTeaPsw()+"')";
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

    public void deleteTeacher(String teaId){
        Connection conn = DBUtil.getConn();
        Statement state = null;
        String sql = "delete from teacher where teaId='"+teaId+"'";
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
}
