package JavaBean;

public class Manager {
    private String mname;
    private String password;

    public Manager(){}

    public Manager(String mname, String password) {
        this.mname = mname;
        this.password = password;
    }

    public String getMname() {
        return mname;
    }

    public String getPassword() {
        return password;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
