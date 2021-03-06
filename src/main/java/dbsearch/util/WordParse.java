package dbsearch.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import dbsearch.domain.CompressPic;

import org.apache.poi.POIXMLException;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.hwpf.usermodel.Table;
import org.apache.poi.hwpf.usermodel.TableCell;
import org.apache.poi.hwpf.usermodel.TableIterator;
import org.apache.poi.hwpf.usermodel.TableRow;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFPictureData;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

public class WordParse {
	public static void main(String[] args) throws Exception {
		String text = getText("E:\\failed\\145.doc");
		System.out.print(text);
	}

	public static String getCellText(XWPFTableCell sourceCell) {
		if (sourceCell == null)
			return "";
		StringBuffer content = new StringBuffer();
		content.append(sourceCell.getText().trim());
		for (XWPFTable table : sourceCell.getTables()) {
			for (XWPFTableRow row : table.getRows()) {
				for (XWPFTableCell cell : row.getTableCells()) {
					content.append(getCellText(cell));
				}
			}
		}
		return content.toString();
	}
	//获取一张图片
	public static String extractPic(String path, String fileNameNoExt,String dir) throws Exception{
		
		try
		{
			FileInputStream fis = new FileInputStream(path);  
			XWPFDocument document = new XWPFDocument(fis);   
		    List<XWPFPictureData> picList = document.getAllPictures();
		    byte[] bytev = picList.get(0).getData();  //只取一张图片
		//    String bigfileName = fileNameNoExt+"2.jpg";
		    fileNameNoExt = fileNameNoExt +".jpg";
		    
		    FileOutputStream fos = new FileOutputStream(dir+ File.separator + fileNameNoExt);   
	        fos.write(bytev);  
	        //尝试压缩图片
	        CompressPic compresspic = new CompressPic(); 
	        compresspic.compressPic(dir+ File.separator + fileNameNoExt, dir+ File.separator, 
	        		fileNameNoExt, fileNameNoExt, 180, 120, false);
	     //   File f = new File(dir+ File.separator + bigfileName);

	        
	        
		}
		catch(POIXMLException xmlexp){
			
		}
		
		return fileNameNoExt;
	}
	///
	public static String getText(String path) throws Exception {
		StringBuffer content = new StringBuffer();
		try {
			InputStream is = new FileInputStream(path);
			XWPFDocument docx = new XWPFDocument(is);
			List<XWPFTable> tables = docx.getTables();
			for (XWPFTable table : tables) {
				for (XWPFTableRow row : table.getRows()) {
					for (XWPFTableCell cell : row.getTableCells()) {
						content.append(getCellText(cell));
					}
				}
			}
		} catch (POIXMLException xmlexp) {
			InputStream is = new FileInputStream(path);
			HWPFDocument doc = new HWPFDocument(is);
			Range range = doc.getRange();
			TableIterator tableIter = new TableIterator(range);
			Table table;
			TableRow row;
			TableCell cell;
			while (tableIter.hasNext()) {
				table = tableIter.next();
				int rowNum = table.numRows();
				for (int j = 0; j < rowNum; j++) {
					row = table.getRow(j);
					int cellNum = row.numCells();
					for (int k = 0; k < cellNum; k++) {
						cell = row.getCell(k);
						content.append(cell.text().trim());
					}
				}
			}

		}
		return content.toString();
	}
}
