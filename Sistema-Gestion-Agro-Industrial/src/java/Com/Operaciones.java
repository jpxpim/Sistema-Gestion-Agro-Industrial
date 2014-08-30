/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Com;

import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 *
 * @author Toditos
 */
public class Operaciones {
    public static double Redondear(double NDecimal,int decimales)
    {
      return Math.round(NDecimal*Math.pow(10,decimales))/Math.pow(10,decimales);
    } 
    
    public static String getCodigoControl(int rpta)
    {
        Calendar c = new GregorianCalendar();
                String dia="";
                String mes="";
                if(c.get(Calendar.DATE)>9) dia = Integer.toString(c.get(Calendar.DATE));
                else dia="0"+Integer.toString(c.get(Calendar.DATE));
                if(c.get(Calendar.MONTH)>9) mes = Integer.toString(c.get(Calendar.MONTH));
                else mes="0"+Integer.toString(c.get(Calendar.MONTH));
                String anio = ""+Integer.toString(c.get(Calendar.YEAR));
                return ""+rpta+dia+mes+anio;
    }
}
