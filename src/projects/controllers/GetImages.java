package projects.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

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

import projects.beans.Image;
import projects.dao.ImageDAO;
import projects.utils.ConnectionHandler;

@WebServlet("/GetImages")
public class GetImages extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection = null;
	private TemplateEngine templateEngine;

	public GetImages() {
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
		int totalNumberOfRecords = 0;
		int recordPerPage = 5;
		int startIndex = 0;
		int numberOfPages = 0;

		// If the user is not logged in (not present in session) redirect to the login
		String loginpath = getServletContext()+ "/index.html";
		HttpSession session = request.getSession();
		if (session.isNew() || session.getAttribute("user") == null) {
			response.sendRedirect(loginpath);
			return;
		}

		// get and check params
		Integer albumId = null;
		Integer pageNumber = null;
		try {
			albumId = Integer.parseInt(request.getParameter("albumid"));
			pageNumber = Integer.parseInt(request.getParameter("pageno"));
		} catch (NumberFormatException | NullPointerException e) {
			// only for debugging e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Incorrect param values");
			return;
		}

		// If a mission with that ID exists for that USER,
		// obtain the expense report for it
		ImageDAO imagesDAO = new ImageDAO(connection);
		ArrayList<Image> images = new ArrayList<Image>();
		Image image1 = null;
		
		try {
			images = imagesDAO.findImagesByAlbumId(albumId, startIndex, recordPerPage);
			System.out.println("IMAGES: "+images);
			//images.stream().forEach(w-> System.out.println(w.getId()+ " " + w.getTitle()));
			if (images == null || totalNumberOfRecords < 0) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource not found");
				return;
			}
		} catch (SQLException e) {
			//for debugging only e.printStackTrace();
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Not possible to findImagesByAlbumId");
			return;
		}
		
		boolean selected = false;
		request.setAttribute("selected", selected);
		numberOfPages = 1 + totalNumberOfRecords / recordPerPage;
		request.setAttribute("images", images);
		request.setAttribute("pageno", pageNumber);
		request.setAttribute("numberofpages", numberOfPages);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/AlbumPage.jsp");
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
