package bean;

public class TeacherBean {
    private String teaId;
    private String teaPsw;
    private String teaName;
    private String title;
    private String teaSex;

    public void setTeacher(String teaId, String teaName, String title, String teaSex) {
        this.teaId = teaId;
        this.teaName = teaName;
        this.title = title;
        this.teaSex = teaSex;
    }


    public String getTeaId() {
        return teaId;
    }

    public void setTeaId(String teaId) {
        this.teaId = teaId;
    }

    public String getTeaPsw() {
        return teaPsw;
    }

    public void setTeaPsw(String teaPsw) {
        this.teaPsw = teaPsw;
    }

    public String getTeaName() {
        return teaName;
    }

    public void setTeaName(String teaName) {
        this.teaName = teaName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTeaSex() {
        return teaSex;
    }

    public void setTeaSex(String teaSex) {
        this.teaSex = teaSex;
    }
}
