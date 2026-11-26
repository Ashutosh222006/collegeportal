package collegeportal.beans;

public class Feedback {
private int id,rating ;
private String name , email, remark;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getRemark() {
	return remark;
}
public void setRemark(String remark) {
	this.remark = remark;
}
public int getRating() {
	return rating;
}
public void setRating(int rating) {
	this.rating = rating;
}
public Feedback(String name, String email, String remark, int studentRating) {
	super();
	this.name = name;
	this.email = email;
	this.remark = remark;
	this.rating = studentRating;
}
public Feedback() {
	super();
	// TODO Auto-generated constructor stub
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}


}
