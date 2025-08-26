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
import java.io.File;
import java.util.Date;
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
public class AddMoviesServlet extends HttpServlet {

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
            out.println("<title>Servlet AddMoviesServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddMoviesServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    MovieCategoryDAO mcDao = new MovieCategoryDAO();
    MoviesDAO moviesDao = new MoviesDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<MovieCategory> listMC = mcDao.getAllCate();
        request.setAttribute("mc", listMC);
        request.getRequestDispatcher("addmovies.jsp").forward(request, response);
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
            // Lấy dữ liệu từ form
            String title = request.getParameter("movieName");
            String description = request.getParameter("moviesDes");
            int duration = Integer.parseInt(request.getParameter("moviesDu"));
            int year = Integer.parseInt(request.getParameter("moviesYear"));
            java.sql.Date releaseDate = DateUtil.validateAndConvertDOB(request.getParameter("moviesTime"));
            float rating = Float.parseFloat(request.getParameter("moviesRate"));
            int categoryId = Integer.parseInt(request.getParameter("cateMovies"));

            Part filePart = request.getPart("moviesImge");
            String imageUrl = FileUploadUtil.saveUploadedFile(request, filePart, "/uploads");
            if (imageUrl == null) {
                imageUrl = "imge/aquaman.jpg";
            }

            if (rating < 0 || rating > 10) {
                rating = 5.0f;
            }
            System.out.println("Title: " + title);
            System.out.println("Description: " + description);
            System.out.println("Duration: " + duration);
            System.out.println("Year: " + year);
            System.out.println("Release Date: " + releaseDate);
            System.out.println("Rating: " + rating);
            System.out.println("Image URL: " + imageUrl);
            System.out.println("Category ID: " + categoryId);
            int movieId = moviesDao.addMovie(title, description, duration, year, releaseDate, rating, imageUrl, 1);
            System.out.println("Movie ID: " + movieId);
            System.out.println("Category ID: " + categoryId);

            if (movieId > 0) {
                boolean categoryAdded = moviesDao.addMovieCategory(movieId, categoryId);
                if (categoryAdded) {
                    response.sendRedirect("listmovies");
                    return;
                } else {
                    response.sendRedirect("login");
                }
            }

        } catch (Exception e) {
            response.sendRedirect("login");
            System.out.println("???? lỗi");
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
