package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConexionDAO {
    public static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//    public static String url = "jdbc:sqlserver://204.93.178.157\\MSSQL:1433;databaseName=servitec1_packing";
//    public static String usuario = "servitec1_admin";
//    public static String clave = "@123Soltrux123";
    public static String url = "jdbc:sqlserver://192.168.1.33\\MSSQL:1433;databaseName=Packing";
    public static String usuario = "sa";
    public static String clave = "123";
    
    public ConexionDAO() {
    }
    public static Connection getConnection() throws Exception{
        Connection cnn = null;
        try {
             Class.forName(driver);
            cnn=DriverManager.getConnection(url,usuario,clave);
            System.out.println("conexion establecida");
        } catch (ClassNotFoundException | SQLException e) {
             System.out.println("No se pudo establecer la conexion");
        }
             return cnn;
    }

}
