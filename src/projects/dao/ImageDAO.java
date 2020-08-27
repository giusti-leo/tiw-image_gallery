package projects.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import projects.beans.Image;

public class ImageDAO {
	private Connection con;

	public ImageDAO(Connection connection) {
		this.con = connection;
	}
	
	public ArrayList<Image> findListOfImages(int index) throws SQLException {
		ArrayList<Image> images = new ArrayList<Image>();

		String query = "SELECT * from image ORDER BY date DESC";
		try (PreparedStatement pstatement = con.prepareStatement(query);) {
			try (ResultSet result = pstatement.executeQuery();) {
				for(int i=1; i<(index-1)*5;i++) {
					result.next();
				}
				for(int i=index*5;i<(index+1)*5;i++) {
					Image image = new Image();
					image.setId(result.getInt("id"));
					image.setTitle(result.getString("title"));
					image.setDirectory(result.getString("directory"));
					image.setDate(result.getDate("date"));
					image.setImage(result.getBlob("image"));
					images.add(image);	
				}
			}
		}
		return images;
	}
	
	public ArrayList<Image> findImagesByAlbumId(int albumId, int startIndex,int recordPerPage) throws SQLException {

		/*"SELECT transactionId, date, amount, originId, A1.username, " +
                "destinationId, A2.username, description " +
                "FROM transaction " +
                "JOIN account A1 ON originId = A1.accountId " +
                "JOIN account A2 ON destinationId = A2.accountId " +
                "WHERE originId = ? OR destinationId = ? ORDER BY date DESC"*/
		
		ArrayList<Image> images = new ArrayList<Image>();
		
		String query = "SELECT id, title, text, directory, date, image FROM image JOIN containment A1 ON id = A1.imageid WHERE A1.albumid = ?";// LIMIT "+ (startIndex) + "," + (recordPerPage);
		try (PreparedStatement pstatement = con.prepareStatement(query);) {
			pstatement.setInt(1, albumId);
			try (ResultSet result = pstatement.executeQuery();) {
				int i = 0;
				if(result != null) {
					do {
						i++;
						Image image = new Image();
						image.setId(result.getInt("id"));
						image.setTitle(result.getString("title"));
						image.setTitle(result.getString("text"));
						image.setTitle(result.getString("directory"));
						image.setDate(result.getDate("date"));
						image.setImage(result.getBlob("image"));
						images.add(image);	
					} while (result.next() && i != recordPerPage);
				}
			}
			return images;
		}
	}
	
	public int countImages(int albumId) throws SQLException{
		String query = "select count(*) from containment where ? = containment.albumid";
		try (PreparedStatement pstatement = con.prepareStatement(query);) {
			pstatement.setInt(1, albumId);
			try (ResultSet result = pstatement.executeQuery();) {
				return result.getInt(1);
			}
		}
	}

	public Image findImageById(int imageId) throws SQLException {
		Image image = null;

		String query = "SELECT * FROM image WHERE id = ?";
		try (PreparedStatement pstatement = con.prepareStatement(query);) {
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

	
}
