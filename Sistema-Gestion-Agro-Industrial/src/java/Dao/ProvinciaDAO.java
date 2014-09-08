
package Dao;


import Entidades.entDepartamento;
import Entidades.entProvincia;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;


import java.util.ArrayList;
import java.util.List;

public class ProvinciaDAO {
    
    
       public static List<entProvincia> listarProvinciaXDepartamento(int IdDepartamento) throws Exception
    {
        List<entProvincia> listProvincia = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select Id_Provincia,Id_Departamento,nombre from Provincia where Id_Departamento="+IdDepartamento;
            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                 if(listProvincia == null)
                    listProvincia = new ArrayList<entProvincia>();
                
                entDepartamento Departamento = new entDepartamento();
                Departamento.setId_departamento(dr.getInt(2));
                
                entProvincia objProvincia = new entProvincia();
                objProvincia.setId_provincia(dr.getInt(1));
                objProvincia.setNombre(dr.getString(3));
                objProvincia.setObjDepartamento(Departamento);

                listProvincia.add(objProvincia);
            }

        } catch (Exception e) {
            throw new Exception("Listar Provincia "+e.getMessage(), e);
        }
        finally{
            try {
                dr.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
            }
        }
        return listProvincia;
    }
 
}
