package projects.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import projects.beans.Album;
import projects.beans.Image;
import projects.beans.User;

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

		ArrayList<Image> images = new ArrayList<Image>();
		
		String query = "SELECT image.* FROM image, order WHERE image.id = order.id_album AND order.album_id = ? LIMIT "+ (startIndex) + "," + (recordPerPage);
		try (PreparedStatement pstatement = con.prepareStatement(query);) {
			pstatement.setInt(1, albumId);
			try (ResultSet result = pstatement.executeQuery();) {
				int i = 0;
				do {
					i++;
					Image image = new Image();
					image.setId(result.getInt("id"));
					image.setTitle(result.getString("title"));
					image.setDate(result.getDate("date"));
					image.setImage(result.getBlob("image"));
					images.add(image);	
				} while (result.next() && i != recordPerPage);
			}
			return images;
		}
	}
	
	public int countImages(int albumId) throws SQLException{
		int value;

		String query = "select count(*) from order where ? = order.album_id";
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
