package jdbc;

public class Test {

    public static void main(String[] args) {
        // URL指向要访问的数据库名mydata
        String url = "jdbc:mysql://localhost:3306/employees";
        // MySQL配置时的用户名
        String user = "root";
        // MySQL配置时的密码
        String password = "root";
        JDBCDemo jdbcDemo = new JDBCDemo(url, user, password);

        jdbcDemo.query();
//        jdbcDemo.query("SELECT * FROM departments WHERE dept_no = 'd001'");
//        jdbcDemo.execute("INSERT INTO departments VALUES ('d100', 'JJJ')");
//        jdbcDemo.execute("UPDATE departments SET dept_name = 'KKK' WHERE dept_no = 'd100'");
//        jdbcDemo.execute("DELETE FROM departments WHERE dept_no = 'd100'");

    }
}
