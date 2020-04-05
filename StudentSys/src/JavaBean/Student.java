package JavaBean;

public class Student {
    String Sno;
    String Sname;
    String Ssex;
    int Sage;
    String Sdept;
    String phone;

    @Override
    public String toString() {
        return "Student{" +
                "Sno='" + Sno + '\'' +
                ", Sname='" + Sname + '\'' +
                ", Ssex='" + Ssex + '\'' +
                ", Sage=" + Sage +
                ", Sdept='" + Sdept + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }

    public Student(){}

    public String getSno() {
        return Sno;
    }

    public void setSno(String sno) {
        Sno = sno;
    }

    public String getSname() {
        return Sname;
    }

    public void setSname(String sname) {
        this.Sname = sname;
    }

    public String getSsex() {
        return Ssex;
    }

    public void setSsex(String ssex) {
        Ssex = ssex;
    }

    public int getSage() {
        return Sage;
    }

    public void setSage(int sage) {
        Sage = sage;
    }

    public String getSdept() {
        return Sdept;
    }

    public void setSdept(String sdept) {
        Sdept = sdept;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Student(String sno, String sname, String ssex, int sage, String sdept, String phone) {
        Sno = sno;
        this.Sname = sname;
        Ssex = ssex;
        Sage = sage;
        Sdept = sdept;
        this.phone = phone;
    }
}
