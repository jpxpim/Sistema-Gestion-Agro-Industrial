
package Dao;


import Entidades.entDepartamento;
import Entidades.entDistrito;
import Entidades.entProvincia;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;


import java.util.ArrayList;
import java.util.List;

public class DistritoDAO {
    


    
     
      public static List<entDistrito> listarDistritoXProvincia(int IdProvincia) throws Exception
    {
        List<entDistrito> listDistrito = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select id_Distrito,Id_Provincia,nombre from Distrito where Id_Provincia="+IdProvincia;

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            while(dr.next())
            {
                 if(listDistrito == null)
                    listDistrito = new ArrayList<entDistrito>();

                
                entProvincia objProvincia = new entProvincia();
                objProvincia.setId_provincia(dr.getInt(2));
                
                entDistrito objDistrito = new entDistrito();
                objDistrito.setId_istrito(dr.getInt(1));
                objDistrito.setNombre(dr.getString(3));
                objDistrito.setObjProvincia(objProvincia);

                listDistrito.add(objDistrito);
            }

        } catch (Exception e) {
            throw new Exception("Listar Distrito "+e.getMessage(), e);
        }
        finally{
            try {
                dr.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
            }
        }
        return listDistrito;
    }
      
      
     public static entDistrito buscarId (int idDistrito) throws Exception
    {
        entDistrito objDistrito = null;
        Connection conn =null;
        CallableStatement stmt = null;
        ResultSet dr = null;
        try {
            String sql="select d.id_Distrito,d.id_Provincia,d.Nombre,p.nombre,x.nombre from Distrito as d inner join Provincia as p on d.id_Provincia=p.id_Provincia\n" +
                        " inner join Departamento x on p.id_Departamento=x.id_Departamento\n" +
                        "where d.id_Distrito="+idDistrito;

            conn = ConexionDAO.getConnection();
            stmt = conn.prepareCall(sql);
            dr = stmt.executeQuery();

            if(dr.next())
            {
                entDepartamento objclsDepartamento = new entDepartamento();
                objclsDepartamento.setNombre(dr.getString(5));
                
                entProvincia objProvincia = new entProvincia();
                objProvincia.setId_provincia(dr.getInt(2));
                objProvincia.setNombre(dr.getString(4));
                objProvincia.setObjDepartamento(objclsDepartamento);
                
                objDistrito = new entDistrito();
                objDistrito.setId_istrito(dr.getInt(1));
                objDistrito.setNombre(dr.getString(3));
                objDistrito.setObjProvincia(objProvincia);

            }

        } catch (Exception e) {
            throw new Exception("Listar Distrito "+e.getMessage(), e);
        }
        finally{
            try {
                dr.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
            }
        }
        return objDistrito;
    }

     
}
