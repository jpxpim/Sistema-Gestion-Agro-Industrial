
package Dao;


import Entidades.entDepartamento;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;


import java.util.ArrayList;
import java.util.List;

public class DepartamentoDAO {    
    public static List<entDepartamento> listarDepartamento() throws Exception {
        List<entDepartamento> listDepartamento = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select Id_Departamento,nombre from Departamento;";
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                 if(listDepartamento == null)
                    listDepartamento = new ArrayList<entDepartamento>();
                    entDepartamento Departamento = new entDepartamento();
                    Departamento.setId_departamento(dr.getInt(1));
                    Departamento.setNombre(dr.getString(2));
                    listDepartamento.add(Departamento);
            }
        } catch (Exception e) {
            throw new Exception("Listar Departamento "+e.getMessage(), e);
        }
        finally{
            try {
                dr.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
            }
        }
        return listDepartamento;
    } 
}
