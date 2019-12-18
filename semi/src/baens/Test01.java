package baens;

import java.sql.Connection;
import java.sql.DriverManager;

public class Test01 {
	public static void main(String[] args) throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@www.sysout.co.kr:1521:xe", "kh21", "kh21");
		
	}
}
