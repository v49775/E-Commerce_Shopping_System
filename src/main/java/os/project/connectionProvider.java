package os.project;
import java.sql.*;
public class connectionProvider {
	public static Connection getcon(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/osproject?autoReconnect=true&useSSL=false","root","v49775");
			return conn;
			
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}

}
