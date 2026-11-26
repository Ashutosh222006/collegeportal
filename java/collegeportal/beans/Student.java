package collegeportal.beans;

public class Student {

	private String email;
	private String password;
	private String name;
	private String course;
	private String phone;

	public Student() {
		super();
	}

	public Student(String email, String password, String name, String course, String phone) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.course = course;
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}