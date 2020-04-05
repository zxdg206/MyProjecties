package JavaBean;

import java.util.List;

/**
 * 此bean对象封装的是前端要显示的记录信息和相关参数
 * @param <T>
 */
public class PageBean<T> {
    private int all_res;//总的记录数
    private int cur_page;//当前页码
    private int cur_res;//当前每页的记录数
    private int all_page;//总页码
    private List<T> reslist;//将当前页的学生记录（student）逐条存入集合。
    //分页参数
    private int end;//最后一页显示的页数
    private int fix;//每版的页码修正
    private int size;//显示多少个页码，默认10
    private int[] no;//每条记录显示的序号

    //此构造方法可复用。
    public PageBean(int all_res,int cur_page,int cur_res,List<T> reslist) {
        this.cur_res = cur_res;
        this.all_res = all_res;
        this.cur_page = cur_page;
        all_page = all_res%cur_res==0?all_res/cur_res:all_res/cur_res+1;
        this.reslist = reslist;
        //分页固定参数
        size = 10;
        end = all_page%size;
        //前端count页数显示修正，因为前端的页码增加是由status自动count，因此只要根据当前页计算出所处页的区间。
        //目前只能固定为10个页码，并且总页数不能超过100页？。（Fix算法待改进）
        //对最后一版，分页，如果在所选页码是最后一版之间,也就是当前页如果是大于等于最后一版的第一页位置的页码。

        if (cur_page >= (all_page - all_page % size + 1)) {
            size = all_page%size;
        }

        //当fix为整十数时（10,20,30...）便不能确确定其当前页码所在的区间，(因为区间尽头就是其本身 )只需要在其取余为0时，减一既可。
        if(cur_page%10!=0) {
            fix = cur_page / 10 * 10;
        }{
            fix = (cur_page-1) / 10 * 10;;
        }
        //计算每条记录的序号存入数组
        no = new int[reslist.size()];
        for(int i = 0;i<reslist.size();i++) {
            if (((cur_page/10)*10*cur_page+i+1)%10!= 0) {//判断当前页码的数字区间,取当前页码的十位*10，从i开始加到9，最后一位直接存入
                no[i] = (cur_page-1)*10 + i + 1;
            } else {
                no[reslist.size() - 1] = (cur_page-1)*10 + i + 1;
            }
        }
    }

    public int[] getNo() {
        return no;
    }

    public void setNo(int[] no) {
        this.no = no;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getAll_res() {
        return all_res;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getFix() {
        return fix;
    }

    public void setFix(int fix) {
        this.fix = fix;
    }

    public void setAll_res(int all_res) {
        this.all_res = all_res;
    }

    public int getCur_page() {
        return cur_page;
    }

    public void setCur_page(int cur_page) {
        this.cur_page = cur_page;
    }

    public int getCur_res() {
        return cur_res;
    }

    public void setCur_res(int cur_res) {
        this.cur_res = cur_res;
    }

    public int getAll_page() {
        return all_page;
    }

    public void setAll_page(int all_page) {
        this.all_page = all_page;
    }

    public List<T> getReslist() {
        return reslist;
    }

    public void setReslist(List<T> reslist) {
        this.reslist = reslist;
    }
}
