package dbsearch.domain;

import java.io.BufferedInputStream;    
import java.io.File;   
import java.io.IOException;    
import java.io.InputStream;     
  
/**   
 * 将文件转成swf格式   
 *    
 * @author Administrator   
 *    
 */    
public class ConvertSwf {    
  
    /**   
     * 入口方法-通过此方法转换文件至swf格式   
     * @param filePath  上传文件所在文件夹的绝对路径   
     * @param fileName  文件名称   
     * @return          生成swf文件名   
     */    
    public String beginConvert(String filePath, String fileName) {      
        final String PDF = ".pdf";    
        final String SWF = ".swf";    
        final String TOOL = "pdf2swf.exe";    
        String outFile = "";    
        String fileNameOnly = "";    
        String fileExt = "";    
        if (null != fileName && fileName.lastIndexOf(".") > 0) {    
            int index = fileName.lastIndexOf(".");    
            fileNameOnly = fileName.substring(0, index);    
            fileExt = fileName.substring(index).toLowerCase();    
        }    
        String inputFile = filePath + File.separator + fileName;    
        String outputFile = "";    
  
        //如果是office文档，先转为pdf文件    
        
        if (fileExt.equals(PDF)) {    
            String toolFile = filePath + File.separator + TOOL;    
            outputFile = filePath + File.separator + fileNameOnly + SWF;    
            convertPdf2Swf(inputFile, outputFile, toolFile);    
            outFile = outputFile;    
        }    
        return outFile;    
    }    
  
    /**   
     * 将pdf文件转换成swf文件   
     * @param sourceFile pdf文件绝对路径   
     * @param outFile    swf文件绝对路径   
     * @param toolFile   转换工具绝对路径   
     */    
    private void convertPdf2Swf(String sourceFile, String outFile,    
            String toolFile) {    
        String command = toolFile + " \"" + sourceFile + "\" -o  \"" + outFile    
                + "\" -s flashversion=9 ";    
        try {    
            Process process = Runtime.getRuntime().exec(command);    
            System.out.println(loadStream(process.getInputStream()));    
            System.err.println(loadStream(process.getErrorStream()));    
            System.out.println(loadStream(process.getInputStream()));    
            System.out.println("###--Msg: swf 转换成功");    
        } catch (Exception e) {    
            e.printStackTrace();    
        }    
    }    
  
  
    static String loadStream(InputStream in) throws IOException{    
        int ptr = 0;    
        in = new BufferedInputStream(in);    
        StringBuffer buffer = new StringBuffer();    
  
        while ((ptr=in.read())!= -1){    
            buffer.append((char)ptr);    
        }    
        return buffer.toString();    
    }    
  
}       