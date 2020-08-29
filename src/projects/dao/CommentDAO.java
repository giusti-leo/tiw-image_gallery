package projects.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import project.exceptions.BadCommentForImage;
import projects.beans.User;

public class CommentDAO {
	private Connection connection;

	public CommentDAO(Connection connection) {
		this.connection = connection;
	}

	public HashMap<User, String> findCommentsByImageId(int imageId) throws SQLException {
		HashMap<User, String> comments = new HashMap<User, String>();

		String query = "SELECT comment.text, user.name, user.surname FROM comment, image, user WHERE comment.userid=user.id AND image.id = ? AND comment.image_id=image.id ";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, imageId);
			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					User user = new User();
					String comment;
					user.setName(result.getString("user.name"));
					user.setSurname(result.getString("user.surname"));
					comment = (result.getString("comment.text"));
					comments.put(user, comment);
				}
			}
		}
		return comments;
	}

	public void createComment(int userId, int imageId, String text) throws SQLException, BadCommentForImage {
		// Check if text is null
		if (text.isEmpty() || userId < 0 || imageId < 0)
			throw new BadCommentForImage("Upload error");

		String query = "INSERT INTO comment (userid, image_id, text) VALUES ( ? , ? , ?)";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, userId);
			pstatement.setInt(2, imageId);
			pstatement.setString(3, text);
			pstatement.executeUpdate();
		}
	}
}
