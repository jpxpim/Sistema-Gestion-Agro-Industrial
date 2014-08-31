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
import java.util.Calendar;
import java.util.GregorianCalendar;
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
    

    public static String getCodigoControl()
    {
        Calendar c = new GregorianCalendar();
        String dia="";
        String mes="";
        if(c.get(Calendar.DATE)>9) dia = Integer.toString(c.get(Calendar.DATE));
        else dia="0"+Integer.toString(c.get(Calendar.DATE));
        if(c.get(Calendar.MONTH)>9) mes = Integer.toString(c.get(Calendar.MONTH));
        else mes="0"+Integer.toString(c.get(Calendar.MONTH));
        String anio = ""+Integer.toString(c.get(Calendar.YEAR));
        String hora=Integer.toString(c.get(Calendar.HOUR));
        String min=Integer.toString(c.get(Calendar.MINUTE));
        String seg=Integer.toString(c.get(Calendar.SECOND));
        String mili=Integer.toString(c.get(Calendar.MILLISECOND));
        return ""+dia+mes+anio.substring(2)+hora+min+seg+mili;
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
