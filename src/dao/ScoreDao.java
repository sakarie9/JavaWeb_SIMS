package dao;

import bean.ScoreBean;
import util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ScoreDao {

    //根据学号查询所有课程分数
    public List getScoreBystuId(String stuId) {
        List<ScoreBean> scoreList = new ArrayList<>();
        Connection conn = DBUtil.getConn();
        Statement state = null;
        ResultSet rs = null;
        try {
            String sql = "select course.courseId,course.credit,course.courseName,score.score " +
                    "from course,score " +
                    "where course.courseId=score.courseId and score.stuId='" + stuId + "'";
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            while (rs.next()) {
                ScoreBean scoreTmp = new ScoreBean();
                //setCourse(courseTmp,rs);
                scoreTmp.setCourseId(rs.getString("courseId"));
                scoreTmp.setCredit(rs.getFloat("credit"));
                scoreTmp.setCourseName(rs.getString("courseName"));
                short score = rs.getShort("score");
                if (score == -1)//无成绩时跳过该条
                    continue;
                scoreTmp.setScore(score);
                scoreList.add(scoreTmp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, state, conn);
        }
        return scoreList;
    }

    //根据课程号查询成绩
    public List getScoreBycourseId(String courseId){
        List<ScoreBean> scoreList = new ArrayList<>();
        Connection conn = DBUtil.getConn();
        Statement state = null;
        ResultSet rs = null;
        try {
            String sql = "select course.courseId,course.credit,course.courseName,score.score,student.stuId,student.stuName " +
                    "from course,score,student " +
                    "where course.courseId="+courseId+" and course.courseId=score.courseId and score.stuId=student.stuId";
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            while (rs.next()) {
                ScoreBean scoreTmp = new ScoreBean();
                scoreTmp.setCourseId(rs.getString("courseId"));
                scoreTmp.setCredit(rs.getFloat("credit"));
                scoreTmp.setCourseName(rs.getString("courseName"));
                scoreTmp.setScore(rs.getFloat("score"));
                scoreTmp.setStuId(rs.getString("stuId"));
                scoreTmp.setStuName(rs.getString("stuName"));
                scoreList.add(scoreTmp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, state, conn);
        }
        return scoreList;
    }

    //根据学号和课程号修改或录入分数
    public void setScoreBystuIdAndCourseId(String stuId,String courseId,short score){
        Connection conn = DBUtil.getConn();
        Statement state = null;
        String sql = "update score set score="+score+
                " where stuId='"+stuId+"' and courseId='"+courseId+"'";
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
