package com.notice;

public class notice1 {
 private int id;
 private String message;
 private String visibility;
 
public notice1( String message) {
	
	this.id = 0;
	this.message = message;
	this.visibility = "v";
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getMessage() {
	return message;
}

public void setMessage(String message) {
	this.message = message;
}

public String getVisibility() {
	return visibility;
}

public void setVisibility(String visibility) {
	this.visibility = visibility;
}
 
 
}
