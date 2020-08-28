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
	
	public ArrayList<Image> findImagesByAlbumId(int albumId, int startIndex,int recordPerPage) throws SQLException {

		ArrayList<Image> images = new ArrayList<Image>();
		String query = "SELECT * FROM image, containment WHERE containment.albumid = ? AND image.id = containment.imageid ORDER BY date DESC LIMIT ?,?";
		try (PreparedStatement pstatement = con.prepareStatement(query);) {
			pstatement.setInt(1, albumId);
			pstatement.setInt(2, startIndex);
			pstatement.setInt(3, recordPerPage);
			try (ResultSet result = pstatement.executeQuery();) {
				int i = 0;
				while(result.next()) {
					if(i < recordPerPage) {
					i++;
					Image image = new Image();
					image.setId(result.getInt("image.id"));
					image.setTitle(result.getString("image.title"));
					image.setText(result.getString("image.text"));
					image.setDirectory(result.getString("image.directory"));
					image.setDate(result.getDate("image.date"));
					images.add(image);	
					}
				}
			}
			return images;
		}
	}
	
	public int countImages(int albumId) throws SQLException{
		String query = "SELECT COUNT(*) FROM containment WHERE albumid = ?";
		try (PreparedStatement pstatement = con.prepareStatement(query);) {
			pstatement.setInt(1, albumId);
			try (ResultSet result = pstatement.executeQuery();) {
				int res = 0;
				if(result.next())
					res = result.getInt(1);
				return res;
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
					image.setText(result.getString("text"));
					image.setDirectory(result.getString("directory"));
					image.setDate(result.getDate("date"));
				}	
			}
		}
		return image;
	}
}
