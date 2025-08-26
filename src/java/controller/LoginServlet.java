package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Users;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie arr[] = request.getCookies();
        if (arr != null) {
            for (Cookie cookie : arr) {
                if (cookie.getName().equals("username")) {
                    request.setAttribute("username", cookie.getValue());
                }
                if (cookie.getName().equals("password")) {
                    request.setAttribute("password", cookie.getValue());
                }

            }
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rs = "";
        HttpSession session = request.getSession();

        UserDAO userDAO = new UserDAO();
        List<Users> users = userDAO.getAllUsers();
        boolean find = false;
        for (Users user : users) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                session.setAttribute("user", user);
                session.setAttribute("userRole", user.getRoleId());
                Cookie u = new Cookie("username", username);
                Cookie p = new Cookie("password", password);
                u.setMaxAge(60 * 60);
                response.addCookie(u);
                response.addCookie(p);
                response.sendRedirect("homepage");
                find = true;
                break;
            }

        }
        if (!find) {
            rs = "Nhập sai mật khẩu or tài khoản";
            request.setAttribute("error", rs);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
