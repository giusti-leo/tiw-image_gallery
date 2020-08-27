package projects.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.thymeleaf.TemplateEngine;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ServletContextTemplateResolver;

import projects.beans.Comment;
import projects.beans.Image;
import projects.beans.User;
import projects.dao.CommentDAO;
import projects.dao.ImageDAO;
import projects.utils.ConnectionHandler;

@WebServlet("/GetComments")
public class GetComments extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;
	private TemplateEngine templateEngine;

	public GetComments() {
		super();
	}

	public void init() throws ServletException {
		ServletContext servletContext = getServletContext();
		ServletContextTemplateResolver templateResolver = new ServletContextTemplateResolver(servletContext);
		templateResolver.setTemplateMode(TemplateMode.HTML);
		this.templateEngine = new TemplateEngine();
		this.templateEngine.setTemplateResolver(templateResolver);
		templateResolver.setSuffix(".html");

		connection = ConnectionHandler.getConnection(getServletContext());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// If the user is not logged in (not present in session) redirect to the login
		String loginpath = getServletContext() + "/index.html";
		HttpSession session = request.getSession();
		
		if (session.isNew() || session.getAttribute("user") == null) {
			response.sendRedirect(loginpath);
			return;
		}

		// get and check params
		Integer imageId = null;
		try {
			imageId = Integer.parseInt(request.getParameter("imageid"));
		} catch (NumberFormatException | NullPointerException e) {
			// only for debugging e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Incorrect param values");
			return;
		}

		// If a mission with that ID exists for that USER,
		// obtain the expense report for it
		
		
		//'image' is used to zoom
		ImageDAO imagesDAO = new ImageDAO(connection);
		Image image = new Image();
		
		//'user' is used to redirect someone
		User user = new User();
		
		//'comments' is used to show comments
		CommentDAO commentDAO = new CommentDAO(connection);
		HashMap<Comment,User> comments = new HashMap<Comment,User>();
		
		try {
			image = imagesDAO.findImageById(imageId);
			comments = commentDAO.findCommetsByImageId(imageId);
			if (image == null ) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource not found");
				return;
			}
		} catch (SQLException e) {
			// for debugging only e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Not possible to recover missions");
			return;
		}
		
		request.getSession().setAttribute("user", user);
		request.setAttribute("image", image);
		request.setAttribute("listofcomments", comments);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/AlbumPage.jsp");
		requestDispatcher.forward(request,response);
		
	}

	public void destroy() {
		try {
			ConnectionHandler.closeConnection(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
