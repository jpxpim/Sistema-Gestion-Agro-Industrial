package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConexionDAO {
    public static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public static String url = "jdbc:sqlserver://localhost\\MSSQL:1433;databaseName=PLANTA";
    public static String usuario = "sa";
    public static String clave = "123456";
    
    public ConexionDAO() {
    }
    public static Connection getConnection() throws Exception{
        Connection cnn = null;
        try {
             Class.forName(driver);
            cnn=DriverManager.getConnection(url,usuario,clave);
            System.out.println("conexion establecida");
        } catch (ClassNotFoundException | SQLException e) {
             System.out.println("no se pùdo establecer la conexion");
        }
             return cnn;
    }

}
