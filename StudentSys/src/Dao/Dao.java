package Dao;

import JavaBean.Student;

import java.util.List;

public interface Dao {
    //查找管理员
    boolean findManager(String mname,String password);
    //根据column查询用户
    List findByColumn(String col,String var);
    //查询所有用户
    List<Student> selectAll();
    //添加用户
    boolean add(Student student);
    //根据sno删除用户
    void deleteBySno(String sno);
    //更新用户
    void update(Student stu);
    //降序通过学号
    List<Student> orderByColumn(String column);
    //分页查询
    List getCurrentResult(int cur_page,int cur_res,List conditon);

    int getCountResult(List condition);
}
