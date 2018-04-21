package cn.gxnu.research.test;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;

public class Test {

	public static void main(String[] args) throws IOException
	{
		// TODO Auto-generated method stub
		Workbook wb = new HSSFWorkbook();
		FileOutputStream fos = new FileOutputStream(
		        "D:\\POI使用FileOutputStream输出流生成的工作簿.xls");
		// 使用工作簿提供的 write 方法向文件输出流输出
		wb.write(fos);
		fos.close();
	}

}
