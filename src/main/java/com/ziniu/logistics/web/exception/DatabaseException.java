package com.ziniu.logistics.web.exception;

public class DatabaseException extends RuntimeException {

	private static final long serialVersionUID = -6702005279790316420L;

	public DatabaseException() {
		super();
	}

	public DatabaseException(String message, Throwable cause) {
		super(message, cause);
	}

	public DatabaseException(String message) {
		super(message);
	}

	public DatabaseException(Throwable cause) {
		super(cause);
	}
	
}
