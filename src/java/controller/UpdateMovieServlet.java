/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.MovieCategoryDAO;
import dal.MoviesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.ArrayList;
import java.util.List;
import model.MovieCategory;
import model.Movies;
import util.DateUtil;
import util.FileUploadUtil;

/**
 *
 * @author NgoQuan
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50M
public class UpdateMovieServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateMovieServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateMovieServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    MoviesDAO moviesDao = new MoviesDAO();
    MovieCategoryDAO mcDao = new MovieCategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int movieId = Integer.parseInt(request.getParameter("mid"));

            Movies movie = moviesDao.getMovieById(movieId);
            List<MovieCategory> categories = mcDao.getAllCate();
            request.setAttribute("mc", categories);
            if (movie != null) {
                request.setAttribute("movie", movie);
                request.getRequestDispatcher("updatemovies.jsp").forward(request, response);
            } else {
                response.sendRedirect("listmovies");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("listmovies");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Nhận dữ liệu từ form
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            String title = request.getParameter("movieName");
            String description = request.getParameter("moviesDes");
            int duration = Integer.parseInt(request.getParameter("moviesDu"));
            int year = Integer.parseInt(request.getParameter("moviesYear"));
            java.sql.Date releaseDate = DateUtil.validateAndConvertDOB(request.getParameter("moviesTime"));
            float rating = Float.parseFloat(request.getParameter("moviesRate"));

            // Xử lý ảnh
            Part filePart = request.getPart("moviesImge");
            String imageUrl = null;

            // Nếu có ảnh mới, lưu ảnh
            if (filePart != null && filePart.getSize() > 0) {
                imageUrl = FileUploadUtil.saveUploadedFile(request, filePart, "/uploads");
            }

            // Nếu không có ảnh mới, giữ lại ảnh cũ
            if (imageUrl == null || imageUrl.isEmpty()) {
                imageUrl = request.getParameter("oldImageUrl");
            }

            // Kiểm tra movieId hợp lệ
            if (movieId <= 0) {
                System.out.println("Lỗi: movieId không hợp lệ!");
                response.sendRedirect("updatemovies.jsp?update=fail");
                return;
            }

            // Lấy thể loại được chọn từ form (giả sử chỉ có 1 thể loại)
            String categoryId = request.getParameter("cateMovies");  // ID thể loại duy nhất

            // Gọi DAO để cập nhật bộ phim và thể loại
            boolean success = moviesDao.updateMovie(movieId, title, description, duration, year, releaseDate, rating, imageUrl, categoryId);

            if (success) {
                response.sendRedirect("listmovies");
            } else {
                System.out.println("Update thất bại, movieId = " + movieId);
                response.sendRedirect("updatemovies.jsp?update=fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("updatemovies.jsp?update=error");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
