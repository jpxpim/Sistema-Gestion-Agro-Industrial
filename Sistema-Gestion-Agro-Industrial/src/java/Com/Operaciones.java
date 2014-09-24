/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Com;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.oned.Code128Writer;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.util.Date;
import org.jfree.chart.ChartUtilities;

/**
 *
 * @author Toditos
 */
public class Operaciones {
  private static final int BLACK = 0xFF000000;
  private static final int WHITE = 0xFFFFFFFF;
    public static double Redondear(double NDecimal,int decimales)
    {
      return Math.round(NDecimal*Math.pow(10,decimales))/Math.pow(10,decimales);
    } 
    

//    public static String getCodigoControl(boolean tipo,int idLinea)
//    {
//        Calendar c = new GregorianCalendar();
//        String dia="";
//        String mes="";
//        String linea="";
//        
//        if(idLinea>99) linea = ""+idLinea;
//        else if(idLinea<100 &&idLinea>9) linea = "0"+idLinea;
//        else linea="00"+idLinea;
//        
//        if(c.get(Calendar.DATE)>9) dia = ""+c.get(Calendar.DATE);
//        else dia="0"+c.get(Calendar.DATE);
//        if(c.get(Calendar.MONTH)>9) mes = ""+c.get(Calendar.MONTH);
//        else mes="0"+c.get(Calendar.MONTH);
//        
//        String anio = ""+c.get(Calendar.YEAR);
//        String hora=""+c.get(Calendar.HOUR);
//        String min=""+c.get(Calendar.MINUTE);
//        String seg=""+c.get(Calendar.SECOND);
//        
//        String mili=""+c.get(Calendar.MILLISECOND);        
//       
//        String codigo=dia+mes+anio.substring(2)+c.get(Calendar.HOUR)+min+seg+linea;
//         if(!tipo)
//             codigo=dia+mes+anio.substring(2)+hora+min+seg+mili;
//        
//        return codigo;
//    }
    
      public static String getCodigoControl(boolean tipo,int idLinea)
    {
        String linea="";
        if(idLinea>9) 
            linea = ""+idLinea;
        else 
            linea="0"+idLinea;
        
        String codigo=""+new Date().getTime();
        
        if(tipo)
            codigo=codigo+linea;
        
        return codigo;
    }
    
     public static InputStream generateBarras(String text, int h, int w) throws Exception {
 
        Charset charset = Charset.forName("ISO-8859-1");
        CharsetEncoder encoder = charset.newEncoder();
        byte[] b = null;
        ByteBuffer bbuf = encoder.encode(CharBuffer.wrap(text));
        b = bbuf.array();
        String data = new String(b, "ISO-8859-1");
        // get a byte matrix for the data
        
        
        BitMatrix matrix = null;
        
        matrix = new Code128Writer().encode(data, BarcodeFormat.CODE_128, w, h, null);

        
        int height = matrix.getHeight();
        int width = matrix.getWidth();
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
            for (int x = 0; x < width; x++){
                for (int y = 0; y < height; y++){
                     image.setRGB(x, y, matrix.get(x, y) ? BLACK : WHITE);
                }
            }
        
         byte[] imgByte = ChartUtilities.encodeAsPNG(image);
      
        InputStream myInputStream = new ByteArrayInputStream(imgByte); 
        
        return myInputStream;    
   

    }
  
}
