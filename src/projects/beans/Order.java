package projects.beans;

import java.sql.Date;

public class Order {
	private int id;
	Album album;
	User user;
	
	public Order(User user,Album album,int id) {
		this.user = user;
		this.album= album;
		this.id= id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


}
