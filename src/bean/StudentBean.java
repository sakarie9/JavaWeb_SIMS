package bean;

public class StudentBean {
    private String stuId;
    private String stuPsw;
    private String stuName;
    private String stuEmail;
    private String stuSex;

    public void setStudent(String username, String password, String name, String email, String sex) {
        this.stuId = username;
        this.stuPsw = password;
        this.stuName = name;
        this.stuEmail = email;
        this.stuSex = sex;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getStuPsw() {
        return stuPsw;
    }

    public void setStuPsw(String stuPsw) {
        this.stuPsw = stuPsw;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuEmail() {
        return stuEmail;
    }

    public void setStuEmail(String stuEmail) {
        this.stuEmail = stuEmail;
    }

    public String getStuSex() {
        return stuSex;
    }

    public void setStuSex(String stuSex) {
        this.stuSex = stuSex;
    }
}
