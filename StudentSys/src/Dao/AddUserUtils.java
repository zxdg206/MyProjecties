package Dao;

import JavaBean.Student;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

/**
 * 一个批量添加用户的脚本
 */
public class AddUserUtils {
    Random ran = new Random();
    //随机姓名，要求每四个两位数产生一个三位数姓名
    String firstName = "周王清关刘左李曹熊尚和赖高南菊一二三竹谷菅源时本豆田肖原赵岚卡尹张小孙鬼吴郑陈安蒋都沈藏韩寻杨朱秦宗许何吕张孔严华金魏陶宫花明亚上里谢宇紫荀熏";
    String lastName= "小明夫千利恵立北丸丽田菊西娜樱赤花绘泷梨太次健治多雄野子岸郎直和聪君门俊良冈叶辉光纱风大三瑞穗一二四五六七九寺酱发狂爱天村肥土西希司山智宫崎休壮圆尻佐木理";
    //产生随机姓名
    StringBuffer rname = new StringBuffer();
    String getRandomNames(){
            if(ran.nextInt(10)+1>6){
                int f = ran.nextInt(firstName.length());
                int l = ran.nextInt(lastName.length());
                int k = ran.nextInt(lastName.length());
                rname.append(firstName.charAt(f));
                rname.append(lastName.charAt(l));
                rname.append(lastName.charAt(k));
                String name = rname.toString();
                rname.delete(0,3);
                return name;
            }else {
                int f = ran.nextInt(firstName.length());
                int l = ran.nextInt(lastName.length());
                rname.append(firstName.charAt(f));
                rname.append(lastName.charAt(l));
                String name = rname.toString();
                rname.delete(0,2);
                return name;
            }
    }
    //学号目前是以22开头的5位数
    String getRandomSno(){
        String sno = "21"+(ran.nextInt(899)+100);
        return sno;
    }
    String getRandomSex(){
        String[] dept= {"女","男"};
        return dept[ran.nextInt(2)];
    }
    int getRandomSage(){
        return 17+ran.nextInt(13);
    }
    String getRandomSDept(){
        String[] dept= {"计算机学院","理学院","艺术学院","外语学院","纺织学院"};
        return dept[ran.nextInt(5)];
    }
    String getRandomPhone(){
        rname.append(1);
        int t = ran.nextInt(100);
        switch(t%3){
            case 0:rname.append(3);break;
            case 1:rname.append(5);break;
            case 2:rname.append(8);
        }

        for (int i = 0; i < 9; i++) {
            rname.append(ran.nextInt(10));
        }
        String phone = rname.toString();
        rname.delete(0,15);
        return phone;
    }
    //获取指定随机数量的学生记录
    List<Student> getRandomStudents(int number){
        AddUserUtils util = new AddUserUtils();
        List<Student> list = new LinkedList();
        for (int i = 0; i < number; i++) {
            String sno = util.getRandomSno();
            String sname = util.getRandomNames();
            String sex = util.getRandomSex();
            int sage = util.getRandomSage();
            String sdept = util.getRandomSDept();
            String phone = util.getRandomPhone();
            Student stu= new Student(sno,sname,sex,sage,sdept,phone);
            System.out.println(stu.toString());
            list.add(stu);
        }
        return list;
    }
    //持久化
    void addDataBese(List<Student> list) throws SQLException {
        JdbcUtils jd = new JdbcUtils();
        int i=1;
        int ignore = 0;
        PreparedStatement pstmt = jd.con.prepareStatement("insert into student values(?,?,?,?,?,?)");
        for(Student student:list) {
            try {
                System.out.println("开始pstm...");
                if(jd.stmt.executeQuery("select * from student where sno ="+student.getSno()).next()){
                    ignore++;
                    continue;
                }
                pstmt.setString(1, student.getSno());
                pstmt.setString(2, student.getSname());
                pstmt.setString(3, student.getSsex());
                pstmt.setInt(4, student.getSage());
                pstmt.setString(5, student.getSdept());
                pstmt.setString(6, student.getPhone());
                System.out.print("开始写入第"+(i++)+"条数据:");
                pstmt.executeUpdate();
                System.out.println("写入成功");
            } catch (SQLException e) {
                System.out.println("插入执行或者设置统配符发生异常");
                e.printStackTrace();
            }
        }
        System.out.println("数据插入完毕，忽略学号相同的"+ignore+"条数据");
        jd.close();
    }

    public static void main(String[] args) throws SQLException {
        AddUserUtils util = new AddUserUtils();
        List<Student> list = util.getRandomStudents(50);
        util.addDataBese(list);

    }
}
