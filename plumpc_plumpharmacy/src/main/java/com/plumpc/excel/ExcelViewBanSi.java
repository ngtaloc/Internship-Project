package com.plumpc.excel;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import com.plumpc.dao.CustomerDAO;
import com.plumpc.dao.InvoiceDAO;
import com.plumpc.dao.UserDAO;
import com.plumpc.entity.Invoice;
import com.plumpc.entity.User;

public class ExcelViewBanSi extends AbstractXlsxView {
	private static final String[] header = { "Mã Hóa Đơn", "Nhân Viên Bán", "Khách hàng","Tổng Tiền", "ghi chú" };

	@Autowired
	InvoiceDAO invoiceDAO;
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	CustomerDAO customerDAO;
	private String extractCookie(HttpServletRequest req,String name) {
        for (Cookie c : req.getCookies()) {
           if (c.getName().equals(name))
               return c.getValue();
           }
        return null;
    }
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(extractCookie(request, "dateForm").substring(0,10)+" "+extractCookie(request, "dateForm").substring(11, 16)+":00");
		
		long epochform = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(extractCookie(request, "dateForm").substring(0,10)+" "+extractCookie(request, "dateForm").substring(11, 16)+":00").getTime() / 1000;
		long epochto = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(extractCookie(request, "dateTo").substring(0,10)+" "+extractCookie(request, "dateTo").substring(11, 16)+":00").getTime() / 1000;
		
		
		List<Invoice> list = invoiceDAO.findtime(epochform, epochto);
		int rowNum = 1;
		// Creating sheet with in the workbook
		Sheet sheet = workbook.createSheet("BanSi");
		/** for header **/
		Font font = workbook.createFont();
		font.setFontName("HELVETICA");
		font.setColor(IndexedColors.WHITE.getIndex());
		font.setBold(true);

		CellStyle style = workbook.createCellStyle();
		style.setFont(font);
		style.setWrapText(true);
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setFillForegroundColor(IndexedColors.CORNFLOWER_BLUE.getIndex());
		style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		style.setBorderRight(BorderStyle.THIN);
		style.setRightBorderColor(IndexedColors.BLACK.getIndex());
		style.setBorderLeft(BorderStyle.THIN);
		style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
		style.setBorderTop(BorderStyle.THIN);
		style.setTopBorderColor(IndexedColors.BLACK.getIndex());
		style.setBorderBottom(BorderStyle.THIN);
		style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
		Row row = sheet.createRow(0);
		for (int i = 0; i < header.length; i++) {
			// each column 12 characters wide
			sheet.setColumnWidth(i, 12 * 256);
			Cell cell = row.createCell(i);
			cell.setCellValue(header[i]);
			cell.setCellStyle(style);
		}
		/** header ends **/
		/** Rows in the sheet **/
		CellStyle dateStyle = workbook.createCellStyle();
		// Setting format For the date column
		dateStyle.setDataFormat(workbook.getCreationHelper().createDataFormat().getFormat("dd/MM/yyyy"));
		for (Invoice invoice : list) {
			
			row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(invoice.getId());
			row.createCell(1).setCellValue(invoice.getUser());
			row.createCell(2).setCellValue(userDAO.findById(invoice.getUser()).getName());
			row.createCell(3).setCellValue(customerDAO.findById(invoice.getCustomerId()).getName());
			row.createCell(4).setCellValue(invoice.getTotal());
			row.createCell(5).setCellValue(invoice.getNote());
			
			
		}

		/*
		 * String sheetName = "projectName" + System.currentTimeMillis() + ".xlsx";
		 * FileOutputStream fileOut = new FileOutputStream(sheetName);
		 * workbook.write(fileOut); fileOut.close();
		 */
	}
}