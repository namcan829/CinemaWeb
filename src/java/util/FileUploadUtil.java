/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

/**
 *
 * @author NgoQuan
 */
public class FileUploadUtil {

    public static String saveUploadedFile(HttpServletRequest request, Part filePart, String uploadDir)
            throws IOException, ServletException {

        String fileName = filePart.getSubmittedFileName();
        if (fileName == null || fileName.trim().isEmpty()) {
            System.out.println("File name không hợp lệ!");
            return null;
        }

        // Lấy đường dẫn thư mục upload trong thư mục gốc của webapp (không phải build/)
        String uploadPath = request.getServletContext().getRealPath("/uploads");

        System.out.println("Upload Path: " + uploadPath);

        File uploadFolder = new File(uploadPath);
        if (!uploadFolder.exists()) {
            boolean created = uploadFolder.mkdirs();
            System.out.println("Tạo thư mục thành công? " + created);
        }

        // Kiểm tra thư mục có thể ghi không
        if (!uploadFolder.canWrite()) {
            System.out.println("LỖI: Không thể ghi vào thư mục upload!");
            return null;
        }

        // Đường dẫn file đầy đủ
        String filePath = uploadPath + File.separator + fileName;
        System.out.println("Lưu file tại: " + filePath);

        // Ghi file
        try {
            filePart.write(filePath);
            System.out.println("Đã lưu file thành công!");

            // Trả về đường dẫn ảnh dùng trong JSP (từ thư mục /uploads/)
            return "uploads/" + fileName;
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Lỗi khi lưu file: " + e.getMessage());
            return null;
        }
    }

}
