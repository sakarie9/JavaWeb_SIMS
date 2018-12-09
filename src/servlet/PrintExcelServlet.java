package servlet;

import bean.ScoreBean;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.HorizontalAlignment;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "PrintExcelServlet",urlPatterns = "/servlet/PrintExcelServlet")
public class PrintExcelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet sheet = wb.createSheet("成绩");
        HSSFRow row = sheet.createRow(0);
        HSSFCellStyle style = wb.createCellStyle();
        HSSFCell cell;

        //获取数据
        List list = (List) request.getSession().getAttribute("scoreList");

        //表头
        style.setAlignment(HorizontalAlignment.CENTER);  //居中
        String[] headers = {"课程号","课程名","学号","学生名","成绩"};
        for (int i = 0; i < headers.length; i++) {
            cell = row.createCell(i);
            cell.setCellValue(headers[i]);
            cell.setCellStyle(style);
        }

        //按行添加
//        row = sheet.createRow(sheet.getLastRowNum() + 1);
//        for (int i = 0; i < list.size(); i++) {
//            cell = row.createCell(i);
//            cell.setCellValue(list.get(i));
//            cell.setCellStyle(style);
//        }

        for(int i=0;i<list.size();i++){
            ScoreBean sb = (ScoreBean)list.get(i);
            row = sheet.createRow(sheet.getLastRowNum() + 1);

            cell = row.createCell(0);
            cell.setCellValue(sb.getCourseId());
            cell.setCellStyle(style);

            cell = row.createCell(1);
            cell.setCellValue(sb.getCourseName());
            cell.setCellStyle(style);

            cell = row.createCell(2);
            cell.setCellValue(sb.getStuId());
            cell.setCellStyle(style);

            cell = row.createCell(3);
            cell.setCellValue(sb.getStuName());
            cell.setCellStyle(style);

            cell = row.createCell(4);
            cell.setCellValue(sb.getScore());
            cell.setCellStyle(style);
        }

        ByteArrayOutputStream ba = new ByteArrayOutputStream();
        wb.write(ba);
        ScoreBean sb = (ScoreBean) list.get(0);
        Date date = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("MM-dd");
        response.setContentType("application/msexcel;charset=UTF-8");
        response.setHeader("Content-Disposition","attachment;filename="+sb.getCourseName()+"-"+ ft.format(date)+".xls");
        response.setContentLength(ba.size());
        ServletOutputStream out = response.getOutputStream();
        ba.writeTo(out);
        out.flush();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
