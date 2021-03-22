package com.plumpc.excel;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import com.plumpc.entity.User;

public class ExcelViewDanhThu extends AbstractXlsxView {
	private static final String[] header = { "Ngày", "Tổng tiền đã bán", "Tổng tiền trả lại", "Tổng danh thu" };

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// List of users that will be displayed in the Excel
		/* List<User> users = (ArrayList<User>)request.getAttribute("exL"); */
		List<User> users = (List<User>) model.get("Users");
		int rowNum = 1;
		// Creating sheet with in the workbook
		Sheet sheet = workbook.createSheet("Users");
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
		for (User user : users) {
			System.out.println(user.getName());
			row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(user.getName());
			row.createCell(1).setCellValue(user.getPhone());
			row.createCell(2).setCellValue(user.getUserName());
			Cell cell = row.createCell(3);
			cell.setCellValue(user.getDateJoin());
			cell.setCellStyle(dateStyle);
		}

		/*
		 * String sheetName = "projectName" + System.currentTimeMillis() + ".xlsx";
		 * FileOutputStream fileOut = new FileOutputStream(sheetName);
		 * workbook.write(fileOut); fileOut.close();
		 */
	}
}