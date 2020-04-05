package Dao;

import JavaBean.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoImpl implements Dao {

    //管理员登陆查找
    @Override
    public boolean findManager(String mname, String password) {
        //通过JDBC代码，根据数据库的查询结果是否为空来判断管理员是否存在
        JdbcUtils jd = new JdbcUtils();
        Connection con = jd.con;
        PreparedStatement pstm;
        ResultSet res;
        try {
            String sql = "select * from manager where mname = ? and password = ?";
            //预处理，因此必须先给其sql语句
            pstm = con.prepareStatement(sql);
            pstm.setString(1, mname);
            pstm.setString(2, password);
            res = pstm.executeQuery();
            //已经得到结果，判断结果是否为空既可
            if (res.next()) {
                System.out.println("res非空，存在查询结果");
                while (res.next()) {
                    System.out.println(res.getString("mname"));
                }
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {            //关闭连接
            jd.close();
        }
        return false;
    }

    //通过col查找用户
    @Override
    public List<Student> findByColumn(String col, String var) {
        JdbcUtils jd = new JdbcUtils();
        List<Student> students = new ArrayList();
        PreparedStatement ptmt;
        String sql = "select *  from stuDent where " + col + " =?";
        try {
            ptmt = jd.con.prepareStatement(sql);
            ptmt.setString(1, var);
            ResultSet res = ptmt.executeQuery();
            if (res.next()) {
                do {
                    String Sno = res.getString("Sno");
                    String sname = res.getString("Sname");
                    String ssex = res.getString("Ssex");
                    int sage = Integer.parseInt(res.getString("sage"));
                    String sdept = res.getString("sdept");
                    String phone = res.getString("phone");
                    System.out.println("[DaoImpl/findBySno]:执行查询数据语句");
                    Student student = new Student(Sno, sname, ssex, sage, sdept, phone);
                    students.add(student);
                    System.out.println(student.toString());
                } while (res.next());
                return students;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            jd.close();
        }
        return null;
    }

    //查找所有用户
    @Override
    public List<Student> selectAll() {
        List<Student> students = new ArrayList();
        JdbcUtils jd = new JdbcUtils();
        Statement stmt = jd.stmt;
        ResultSet res;
        String sql = "select * from student";
        try {
            res = stmt.executeQuery(sql);
            while (res.next()) {
                String sno = res.getString("Sno");
                String sname = res.getString("Sname");
                String ssex = res.getString("Ssex");
                int sage = Integer.parseInt(res.getString("sage"));
                String sdept = res.getString("sdept");
                String phone = res.getString("phone");
                Student stu = new Student(sno, sname, ssex, sage, sdept, phone);
                students.add(stu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return students;
    }

    //添加用户
    @Override
    public boolean add(Student student) {
        JdbcUtils jd = new JdbcUtils();
        try {
            PreparedStatement pstmt = jd.con.prepareStatement("insert into student values(?,?,?,?,?,?)");
            pstmt.setString(1, student.getSno());
            pstmt.setString(2, student.getSname());
            pstmt.setString(3, student.getSsex());
            pstmt.setInt(4, student.getSage());
            pstmt.setString(5, student.getSdept());
            pstmt.setString(6, student.getPhone());
            System.out.println("[DaoImpl/add]:开始执行插入语句");
            pstmt.executeUpdate();
            System.out.println("[DaoImpl/add]:成功执行pstmt.executeUpdate()");
            return true;
        } catch (SQLException e) {
            System.out.println("[DaoImpl/add]:插入异常");
            e.printStackTrace();
        } finally {
            jd.close();
        }
        return false;
    }

    //删除用户
    @Override
    public void deleteBySno(String sno) {
        JdbcUtils jd = new JdbcUtils();
        try {
            PreparedStatement pstmt = jd.con.prepareStatement("delete from student where sno = ?");
            pstmt.setString(1, sno);
            pstmt.executeUpdate();
            System.out.println("[DaoImpl/deleteBySno]:执行删除bySno数据语句");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            jd.close();
        }
    }

    //更新用户
    @Override
    public void update(Student student) {
        JdbcUtils jd = new JdbcUtils();
        try {
            String sql = "update student set Sname=?,Ssex=?,Sage=?,Sdept=?,phone=? where Sno=?";
            PreparedStatement pstmt = jd.con.prepareStatement(sql);
            pstmt.setString(1, student.getSname());
            pstmt.setString(2, student.getSsex());
            pstmt.setInt(3, student.getSage());
            pstmt.setString(4, student.getSdept());
            pstmt.setString(5, student.getPhone());
            pstmt.setString(6, student.getSno());
            pstmt.executeUpdate();
            System.out.println("[DaoImpl/uodate]:执行更新数据语句");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            jd.close();
        }
    }

    //排序（降）
    @Override
    public List<Student> orderByColumn(String Column) {
        List<Student> students = new ArrayList();
        JdbcUtils jd = new JdbcUtils();
        String sql = "select * from student order by " + Column + " desc ";
        ResultSet res;
        try {
            PreparedStatement pstmt = jd.con.prepareStatement(sql);
            res = pstmt.executeQuery();
            while (res.next()) {
                String sno = res.getString("Sno");
                String sname = res.getString("Sname");
                String ssex = res.getString("Ssex");
                int sage = Integer.parseInt(res.getString("sage"));
                String sdept = res.getString("sdept");
                String phone = res.getString("phone");
                Student stu = new Student(sno, sname, ssex, sage, sdept, phone);
                students.add(stu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return students;
    }

    //根据当前页，以及条件返回当前页的记录数
    @Override
    public List getCurrentResult(int cur_page, int cur_res, List condition) {
        System.out.println("[DaoImpl/getCurrentResult]:开始执行查询数据语句");
        JdbcUtils jd = new JdbcUtils();
        List<Student> students = new ArrayList();
        //之所以要传入cur_res当前页面记录数，是为了增加代码通用性，否则此处在写sql语句时只能写固定步长，不通用。
        int begin = (cur_page - 1) * cur_res;
        int end = cur_res;
        PreparedStatement ptmt;
//        这里需要根据传来的条条件将sql语句动态展示
        String sql = "select *  from stuDent where 1=1 "+getSqlByCondition(condition)+" limit ?,?";
        System.out.println("[DaoImpl/getCurrentResult]:执行查询的sql语句为:"+sql);
        try {
            ptmt = jd.con.prepareStatement(sql);
            int index =1;
            for (int i = 0; i < condition.size(); i++) {
                if(condition.get(i)!=null&&!"".equals(condition.get(i))){//不为空且不是空串的情况下。
                    ptmt.setString(index,"%"+condition.get(i)+"%");
                    index++;
                }
            }
            ptmt.setInt(index, begin);
            ptmt.setInt(index+1, end);
            ResultSet res = ptmt.executeQuery();
            while (res.next()) {
                String Sno = res.getString("Sno");
                String sname = res.getString("Sname");
                String ssex = res.getString("Ssex");
                int sage = Integer.parseInt(res.getString("sage"));
                String sdept = res.getString("sdept");
                String phone = res.getString("phone");
                Student student = new Student(Sno, sname, ssex, sage, sdept, phone);
                students.add(student);
            }
            return students;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            jd.close();
        }
        return students;
    }

    //返回符合条件的所有记录的总数
    @Override
    public int getCountResult(List condition) {
        JdbcUtils jd = new JdbcUtils();
        try {
            String sql ="select count(*) from student where 1=1 " + getSqlByCondition(condition);
            PreparedStatement pstm = jd.con.prepareStatement(sql);
            if(sql.contains("?")) {
                for (int index = 1, i = 0; i < condition.size(); i++) {
                    if (condition.get(i)!=null&&!"".equals(condition.get(i))) {//如果当前条件不为空，且不是空串
                        pstm.setString(index, "%" + condition.get(i) + "%");
                        index++;
                    }
                }
            }
            ResultSet res = pstm.executeQuery();
            if(res.next()){
                return res.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            jd.close();
        }
        return 0;
    }

    //内部方法，用于根据条件动态生成条件sql语句片段。以后修改条件只需要修改此方法既可。
    private static String getSqlByCondition(List condition) {
        //对condition解析获取动态的sql语句，是一个重复的过程
        StringBuilder sb = new StringBuilder();
//        sb.append("select * from student where 1=1 ");
        //list参数位置以及名字是固定的。
        String [] var= {"sname","sno","sdept"};
        for (int i = 0; i < condition.size(); i++) {
            if(condition.get(i)==null||"".equals(condition.get(i))){//如果当前为空或者空字符串（非空格）
                continue;
            }
                sb.append(" and ");
                sb.append(var[i]);
                sb.append(" like ? ");
        }
        System.out.println("[DaoImpl/getSqlByCondition]:动态sql为："+sb.toString());
        //如果没有任何条件，则返回是查询所有记录的sql。
        return sb.toString();
    }

}
