package projects.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projects.beans.Album;

public class AlbumDAO {
	private Connection con;

	public AlbumDAO(Connection connection) {
		this.con = connection;
	}
	
	public List<Album> findAlbum() throws SQLException {
		List<Album> albums = new ArrayList<Album>();

		String query = "SELECT * from album ORDER BY date DESC";
		try (PreparedStatement pstatement = con.prepareStatement(query);) {
			try (ResultSet result = pstatement.executeQuery();) {
				while (result.next()) {
					Album album = new Album();
					album.setId(result.getInt("id"));
					album.setDate(result.getDate("date"));
					album.setTitle(result.getString("title"));
					albums.add(album);
				}
			}
		}
		return albums;
	}

	
}
