package jdbc;

import javax.swing.plaf.nimbus.State;
import java.sql.*;

/**
 * @author Administrator
 *
 */
public class JDBCDemo {

    private Connection con = null;
    private Statement stmt = null;
    private ResultSet res = null;
    //驱动程序名
    private final String driver = "com.mysql.cj.jdbc.Driver";

    // URL指向要访问的数据库名mydata
    String url = "jdbc:mysql://localhost:3306/employees";
    // MySQL配置时的用户名
    String user = "root";
    // MySQL配置时的密码
    String password = "root";

    public JDBCDemo(String url, String user, String password) {
        this.con = null;
        this.res = null;
        this.stmt = null;
        this.url = url;
        this.user = user;
        this.password = password;

        try {
            // 加载驱动程序
            Class.forName(driver);
            // 1.getConnection()方法，连接MySQL数据库！！
            con = DriverManager.getConnection(url, user, password);
            // 2. statement类对象，用来执行SQL语句！！
            stmt = con.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void close(AutoCloseable obj) {
        if (obj != null) {
            try {
                obj.close();
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    // 默认查询全部信息
    public void query() {
        String sql = "SELECT * FROM departments";
        try {
            res = stmt.executeQuery(sql);
            while (res.next()) {

                String no = res.getString("dept_no");
                String name = res.getString("dept_name");
                // 输出结果
                System.out.println(no + "\t" + name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(res);
            close(stmt);
            close(con);
        }

    }


    // 根据sql进行查询
    public void query(String sql) {
        try {
            res = stmt.executeQuery(sql);
            while (res.next()) {

                String no = res.getString("dept_no");
                String name = res.getString("dept_name");
                // 输出结果
                System.out.println(no + "\t" + name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(res);
            close(stmt);
            close(con);
        }
    }

    // 执行该sql语句
    public void execute(String sql) {
        try {
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(res);
            close(stmt);
            close(con);
        }
    }

}
