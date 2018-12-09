package servlet;

import bean.ScoreBean;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;


import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "PrintPDFServlet",urlPatterns = "/servlet/PrintPDFServlet")
public class PrintPDFServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, FileNotFoundException {
        List list = (List) request.getSession().getAttribute("scoreList");


        Document document = new Document(PageSize.A4, 36,36,36,36);
        ByteArrayOutputStream ba = new ByteArrayOutputStream();
        try {

            PdfWriter writer = PdfWriter.getInstance(document, ba);
            document.open();
            //微软雅黑
            BaseFont baseFont = BaseFont.createFont("C:/WINDOWS/Fonts/STXIHEI.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font font = new Font(baseFont);
            // 添加表格，5列
            PdfPTable table = new PdfPTable(6);
            // 构建每个单元格
            PdfPCell cell1 = new PdfPCell(new Paragraph("课程号",font));
            table.addCell(cell1);
            PdfPCell cell2 = new PdfPCell(new Paragraph("课程名",font));
            table.addCell(cell2);
            PdfPCell cell6 = new PdfPCell(new Paragraph("学分",font));
            table.addCell(cell6);
            PdfPCell cell3 = new PdfPCell(new Paragraph("学号",font));
            table.addCell(cell3);
            PdfPCell cell4 = new PdfPCell(new Paragraph("学生名",font));
            table.addCell(cell4);
            PdfPCell cell5 = new PdfPCell(new Paragraph("成绩",font));
            table.addCell(cell5);
            table.completeRow();

            for(int i=0;i<list.size();i++){
                ScoreBean sb = (ScoreBean)list.get(i);
                PdfPCell cell = new PdfPCell(new Paragraph(sb.getCourseId(),font));
                table.addCell(cell);
                cell = new PdfPCell(new Paragraph(sb.getCourseName(),font));
                table.addCell(cell);
                cell = new PdfPCell(new Paragraph(String.valueOf(sb.getCredit()),font));
                table.addCell(cell);
                cell = new PdfPCell(new Paragraph(sb.getStuId(),font));
                table.addCell(cell);
                cell = new PdfPCell(new Paragraph(sb.getCourseName(),font));
                table.addCell(cell);
                cell = new PdfPCell(new Paragraph(String.valueOf(sb.getScore()),font));
                table.addCell(cell);
                table.completeRow();
            }

            document.add(table);
        }
        catch(DocumentException de)
        {
            de.printStackTrace();
            System.err.println("A Document error:" +de.getMessage());
        }
        document.close();
        ScoreBean sb = (ScoreBean) list.get(0);
        Date date = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("MM-dd");
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition","attachment;filename="+sb.getCourseName()+"-"+ ft.format(date)+".pdf");
        response.setContentLength(ba.size());
        ServletOutputStream out = response.getOutputStream();
        ba.writeTo(out);
        out.flush();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
