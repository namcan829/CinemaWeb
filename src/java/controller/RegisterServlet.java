/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import model.Users;
import util.DateUtil;

/**
 *
 * @author NgoQuan
 */
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        String email = request.getParameter("email");
//        String fullName = request.getParameter("fullName");
//        int gender = Integer.parseInt(request.getParameter("gender"));
//        String phone = request.getParameter("phone");
//
//        int roleId = 2;
////        String usernameError = DateUtil.validateUsername(username);
////        String passwordError = DateUtil.validatePassword(password);
//        String birthdateStr = request.getParameter("birthdate");
//        Date birthdate = DateUtil.validateAndConvertDOB(birthdateStr);
////        System.out.println("????????");
////        if (usernameError != null || passwordError != null || birthdate == null) {
////            request.setAttribute("usernameError", usernameError);
////            request.setAttribute("passwordError", passwordError);
////            request.setAttribute("birthdateError", birthdate == null ? "Birthdate must be between 1990 and today." : null);
////
////            request.setAttribute("username", username);
////            request.setAttribute("birthdate", birthdateStr);
////
////            request.getRequestDispatcher("register.jsp").forward(request, response);
////            return;
////        }
//        HttpSession session = request.getSession(false);
//        int creatorRole = 2;
//        if (session != null && session.getAttribute("userRole") != null) {
//            int userRole = (int) session.getAttribute("userRole");
//            if (userRole == 1) {
//                creatorRole = 1;
//            }
//        }
//        UserDAO userDAO = new UserDAO();
//
////        boolean usernameExists = userDAO.checkExist("username", usernameError);
////        boolean emailExists = userDAO.checkExist("email", email);
////        boolean phoneExists = userDAO.checkExist("phone", phone);
////        if (usernameExists || emailExists || phoneExists) {
////            request.setAttribute("error",
////                    usernameExists ? "Username already exists!"
////                            : emailExists ? "Email already exists!"
////                                    : "Phone number already exists!");
////
////            request.setAttribute("username", usernameExists);
////            request.setAttribute("email", emailExists);
////            request.setAttribute("fullName", phoneExists);
////            request.setAttribute("gender", gender);
////            request.setAttribute("birthdate", birthdate);
////            request.setAttribute("phone", phone);
////
////            request.getRequestDispatcher("register.jsp").forward(request, response);
////            return;
////        }
//        boolean success = userDAO.insertUser(username, password, email, fullName, gender, birthdate, phone, roleId, creatorRole);
//        if (success) {
//            Users newUser = userDAO.getUserByUsername(username);
//            if (newUser != null) {
//                session.setAttribute("user", newUser);
//                session.setAttribute("userRole", newUser.getRoleId());
//                response.sendRedirect("homepage");
//            } else {
//                request.setAttribute("error", "Registration succeeded, but login failed.");
//                request.getRequestDispatcher("register.jsp").forward(request, response);
//            }
//        } else {
//            request.setAttribute("error", "Registration failed.");
//            request.getRequestDispatcher("register.jsp").forward(request, response);
//        }
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String phone = request.getParameter("phone");

        int roleId = 2;
        String birthdateStr = request.getParameter("birthdate");
        Date birthdate = DateUtil.validateAndConvertDOB(birthdateStr);

// Kiểm tra tính hợp lệ của username, password, và birthdate
        String usernameError = DateUtil.validateUsername(username);
        String passwordError = DateUtil.validatePassword(password);

        if (usernameError != null || passwordError != null || birthdate == null) {
            request.setAttribute("usernameError", usernameError);
            request.setAttribute("passwordError", passwordError);
            request.setAttribute("birthdateError", birthdate == null ? "Birthdate must be between 1990 and today." : null);

            request.setAttribute("username", username);
            request.setAttribute("birthdate", birthdateStr);

            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

// Kiểm tra sự tồn tại của username, email, và phone trong cơ sở dữ liệu
        UserDAO userDAO = new UserDAO();
        boolean usernameExists = userDAO.checkExist("username", username);
        boolean emailExists = userDAO.checkExist("email", email);
        boolean phoneExists = userDAO.checkExist("phone", phone);

        if (usernameExists || emailExists || phoneExists) {
            request.setAttribute("error",
                    usernameExists ? "Username already exists!"
                            : emailExists ? "Email already exists!"
                                    : "Phone number already exists!");

            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("fullName", fullName);
            request.setAttribute("gender", gender);
            request.setAttribute("birthdate", birthdate);
            request.setAttribute("phone", phone);

            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession(false);
        int creatorRole = 2;
        if (session != null && session.getAttribute("userRole") != null) {
            int userRole = (int) session.getAttribute("userRole");
            if (userRole == 1) {
                creatorRole = 1;
            }
        }

// Thực hiện thêm người dùng mới vào cơ sở dữ liệu
        boolean success = userDAO.insertUser(username, password, email, fullName, gender, birthdate, phone, roleId, creatorRole);
        if (success) {
            Users newUser = userDAO.getUserByUsername(username);
            if (newUser != null) {
                session.setAttribute("user", newUser);
                session.setAttribute("userRole", newUser.getRoleId());
                response.sendRedirect("homepage");
            } else {
                request.setAttribute("error", "Registration succeeded, but login failed.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Registration failed.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
