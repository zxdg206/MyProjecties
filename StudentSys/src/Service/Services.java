package Service;

import JavaBean.Manager;
import JavaBean.PageBean;
import JavaBean.Student;

import java.util.List;

public interface Services {
    //登陆
    boolean login(Manager manager);
    //查询所有学生
    List<Student> selectAll();
    //添加学生,1正常，0存在用户，-1发生异常
    int addStudent(Student student);
    //删除学生
    boolean deleteBySno(String sno);
    //查找学生通过属性
    List findStudentByColumn(String col,String sno);
    //更新学生
    boolean updateStudent(Student stu);
    //降序排序
    List<Student> orderByColumn(String col);
    //分页查询，（增加通用性至少两个参数)
    PageBean<Student> getPage(int cur_page,int cur_res,List conditon);
}
