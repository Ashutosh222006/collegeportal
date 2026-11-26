package collegeportal.beans;

public class Staff
{
	private String name,email,phone,designation,profile_pic;

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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getProfile_pic() {
		return profile_pic;
	}

	public void setProfile_pic(String profile_pic) {
		this.profile_pic = profile_pic;
	}

	public Staff() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Staff(String name, String email, String phone, String designation, String profile_pic) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.designation = designation;
		this.profile_pic = profile_pic;
	}
	
	
}
