package Service;
import Dao.Dao;
import Dao.DaoImpl;
import JavaBean.Manager;
import JavaBean.PageBean;
import JavaBean.Student;

import java.util.List;


public class ServiceImpl implements Services{
//这是业务逻辑层，只负责接收上层转来的数据调用下层方法进行逻辑处理

    //登陆功能
    @Override
    public boolean login(Manager manager) {
        Dao dao = new DaoImpl();
        boolean istrue = dao.findManager(manager.getMname(), manager.getPassword());
        return istrue;
    }

    //查询所有学生
    @Override
    public List<Student> selectAll() {
        return new DaoImpl().selectAll();
    }

    //添加用户,添加成功返回true
    @Override
    public int addStudent(Student student) {
        DaoImpl dao = new DaoImpl();
        //添加前判断用户学号是否存在
        if(dao.findByColumn("sno",student.getSno())!=null){
            //存在该用户，返回0
            return 0;
        }
        //如果不存在，则添加用户，并返回状态码1表示添加成功。
        if(dao.add(student)){
            return 1;
        }
        return -1;
    }

    //删除学生
    @Override
    public boolean deleteBySno(String sno) {
        Dao dao = new DaoImpl();
        //查找此学生是否存在
        if(dao.findByColumn("sno",sno)!=null){
            dao.deleteBySno(sno);
            return true;
        }
        return false;
    }

    //属性col查找
    @Override
    public List findStudentByColumn(String col,String var) {
        List<Student> list = new DaoImpl().findByColumn(col, var);
        return list;
    }

    //更新学生
    @Override
    public boolean updateStudent(Student stu) {
        //考虑多线程情况，应该先判断是否存在此用户
        Dao dao = new DaoImpl();
        if(dao.findByColumn("sno",stu.getSno())!=null){
            dao.update(stu);
            return true;
        }

        return true;
    }

    //学号降序排列
    public List<Student> orderByColumn(String col) {
        List<Student> students = new DaoImpl().orderByColumn(col);
        return students;
    }

    //条件分页
    @Override
    public PageBean getPage(int cur_page,int cur_res,List condition) {
        //需要对条件进行查询
        Dao dao = new DaoImpl();
        //先根据条件，查询总的记录数 all_res
        int all_res = dao.getCountResult(condition);
        //根据总的记录数得出 all_page(自动)
        int all_page = all_res%cur_res==0?all_res/cur_res:all_res/cur_res+1;
        //对当前页大小做一个判断，可以省略前端js代码，因为记录是动态生产，所以当前页的大小可能大于全部页
        if((cur_page>all_page&&all_page!=0)||cur_page<0){
            cur_page = 1;
        }

        //根据cur_page，以及条件查出当前页的数据记录list，这个list只显示一页的数据不能代表所有数据
        List list = dao.getCurrentResult(cur_page,cur_res,condition);
        //封装数据到PageBean,返回
        return new PageBean(all_res,cur_page,cur_res,list);
    }
}
