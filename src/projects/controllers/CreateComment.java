package projects.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringEscapeUtils;

import project.exceptions.BadCommentForImage;
import projects.beans.User;
import projects.dao.CommentDAO;
import projects.utils.ConnectionHandler;

@WebServlet("/CreateComment")
public class CreateComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection connection = null;

	public CreateComment() {
		super();
	}

	public void init() throws ServletException {
		connection = ConnectionHandler.getConnection(getServletContext());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.isNew() || session.getAttribute("user") == null) {
			String loginpath = getServletContext() + "/index.html";
			response.sendRedirect(loginpath);
			return;
		}

		boolean isBadRequest = false;
		String text = null;
		Integer imageId = null;
		User user = null;
		CommentDAO commentDAO = new CommentDAO(connection);
		try {
			text = StringEscapeUtils.escapeJava(request.getParameter("text"));
			imageId = Integer.parseInt(request.getParameter("imageid"));
			user = (User) session.getAttribute("user");
			isBadRequest = text.isEmpty();
		} catch (NumberFormatException | NullPointerException e) {
			isBadRequest = true;
			e.printStackTrace();
		}
		if (isBadRequest) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Incorrect or missing param values");
			return;
		}

		try {
			commentDAO.createComment(user.getId(), imageId, text);
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Not possible to create comment");
			return;
		} catch (BadCommentForImage ex) {
			response.sendError(HttpServletResponse.SC_PRECONDITION_FAILED, "Upload Error due to BadCommentForImage");
			return;
		}
		
		String ctxpath = getServletContext().getContextPath();
		String path = ctxpath + "/GetComments?imageid=" + imageId;
		response.sendRedirect(path);
	}

	public void destroy() {
		try {
			ConnectionHandler.closeConnection(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
