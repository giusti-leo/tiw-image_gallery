package project.exceptions;

public class BadCommentForImage extends Exception {
	private static final long serialVersionUID = 1L;
	
	public BadCommentForImage(String message) {
		super(message);
	}
}
