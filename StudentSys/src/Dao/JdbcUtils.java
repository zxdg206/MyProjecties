package Dao;

import java.sql.*;

public class JdbcUtils {
    //这些声明是必不可少的因为需要后期关闭
    public Connection con = null;
    public PreparedStatement pstm = null;
    public Statement stmt = null;
    public ResultSet res = null;

    public JdbcUtils() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test2?characterEncoding=utf8", "root", "123456");
//            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test2?characterEncoding=utf8&useSSL=false", "root", "123456");//免验证连接
            stmt = con.createStatement();
        } catch (Exception e) {
            System.out.println("JDBC连接失败");
            e.printStackTrace();
        }
    }

    public int close(){
        /**
         * 0正常，1是res错误，2是pstm错误，3是stmt错误，4是con错误
         */
        int flag = 0;
        if(res!=null){
            try {
                res.close();
            } catch (SQLException e) {
                flag = 1;
                e.printStackTrace();
            }
        }
        if(pstm!=null){
            try {
                pstm.close();
            } catch (SQLException e) {
                flag = 2;
                e.printStackTrace();
            }
        }
        if(stmt!=null){
            try {
                stmt.close();
            } catch (SQLException e) {
                flag = 3;
                e.printStackTrace();
            }
        }
        if(con!=null){
            try {
                con.close();
            } catch (SQLException e) {
                flag = 4;
                e.printStackTrace();

            }
        }
        return flag;
    }

}
