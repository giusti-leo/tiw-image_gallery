package projects.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import projects.beans.Comment;
import projects.beans.Image;
import projects.beans.User;

public class CommentDAO {
	private Connection connection;

	public CommentDAO(Connection connection) {
		this.connection = connection;
	}
	

	public HashMap<Comment,User> findCommetsByImageId(int imageId) throws SQLException {
		HashMap<Comment,User> comments = new HashMap<Comment,User>();
		
		String query = "SELECT user.name , user.surname , comment.text , user.id FROM comment, user, image WHERE image.id = ? AND comment.user_id = user.id AND comment.image_id = image.id";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, imageId);
			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					User user = new User();
					Comment comment = new Comment();
					user.setId(result.getInt("user.id"));
					user.setName(result.getString("user.name"));
					user.setSurname(result.getString("user.surname"));
					comment.setComment(result.getString("comment.text"));
					comments.put(comment, user);
				}
			}
		}
		return comments;
	}
	
	private User findUserById(int id) throws SQLException {
		User user = null;

		String query = "SELECT * FROM user WHERE id = ?";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, id);
			try (ResultSet result = pstatement.executeQuery();) {
				if (result.next()) {
					user = new User();
					user.setId(result.getInt("id"));
					user.setName(result.getString("name"));
					user.setSurname(result.getString("surname"));
				}	
			}
		}
		return user;
	}
	
	
	private Image findImageById(int imageId) throws SQLException{
		Image image = null;

		String query = "SELECT * FROM image WHERE id = ?";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(1, imageId);
			try (ResultSet result = pstatement.executeQuery();) {
				if (result.next()) {
					image = new Image();
					image.setId(result.getInt("id"));
					image.setTitle(result.getString("title"));
					image.setDirectory(result.getString("directory"));
					image.setDate(result.getDate("date"));
					image.setImage(result.getBlob("image"));
				}	
			}
		}
		return image;
	}

	

	public void createComment(int userId, int imageId, String text)
			throws SQLException {

		String query = "INSERT into comment (id,user_id, image_id, text) VALUES(NULL,?,?,?)";
		try (PreparedStatement pstatement = connection.prepareStatement(query);) {
			pstatement.setInt(2, userId);
			pstatement.setInt(3, imageId);
			pstatement.setString(4, text);
			pstatement.executeUpdate();
		}
	}

}
