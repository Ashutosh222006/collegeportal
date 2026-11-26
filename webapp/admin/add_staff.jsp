<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Staff</title>

<%@include file="/common/common_css.html"%>

<style>
.bg-image {
    background-image: url("/collegeportal/images/login.avif");
    background-repeat: no-repeat;
    background-size: cover;
}

.form-div {
    width: 30%;
    margin: auto;
    box-shadow: 0px 5px 20px black;
    border-radius: 10px;
    padding: 25px;
    background-color: rgba(255,255,255,0.9);
}
</style>

</head>
<body class="bg-image">

    <%@include file="/common/top_header.html"%>
    <%@include file="/admin/admin_header.html"%>

    <%
        String msg = (String) request.getAttribute("successMsg");
        if(msg != null){
    %>

    <div class="alert alert-success alert-dismissible fade show w-50 mx-auto mt-2"
        role="alert">
        <strong style="margin-left:40%"><%=msg%></strong>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>

    <% } %>

    <div class="main-div">
        <h2 style="text-align:center">Add Staff Form</h2>

        <div class="form-div">

<!-- step 1 to  add photo enctype -->

            <form method="post"
                action="/collegeportal/AddStaff"
                
                enctype="multipart/form-data"
                novalidate
                class="needs-validation">

                <!-- Name -->
                <div class="form-floating mb-3">
                    <input type="text" name="name" required
                        class="form-control"
                        placeholder="Enter Name">

                    <label>Enter Staff Name Here</label>

                    <div class="invalid-feedback">
                        Name is required
                    </div>
                </div>

                <!-- Email -->
                <div class="form-floating mb-3">
                    <input type="email" name="email" required
                        class="form-control"
                        placeholder="Enter Email">

                    <label>Enter Staff Email Here</label>

                    <div class="invalid-feedback">
                        Email is required
                    </div>
                </div>

                <!-- Phone -->
                <div class="form-floating mb-3">
                    <input type="text" name="phone" required
                        class="form-control"
                        placeholder="Enter Phone Number">

                    <label>Enter Staff Phone Number Here</label>

                    <div class="invalid-feedback">
                        Phone Number is required
                    </div>
                </div>

                <!-- Designation -->
                <div class="form-floating mb-3">
                    <input type="text" name="designation" required
                        class="form-control"
                        placeholder="Enter Designation">

                    <label>Enter Staff Designation Here</label>

                    <div class="invalid-feedback">
                        Designation is required
                    </div>
                </div>

                <!-- Profile Picture -->
                <div class="mb-3">
                    <label class="form-label">Upload Profile Picture</label>

                    <input type="file"
                        name="profilePic"
                        class="form-control"
                        accept="image/*"
                        required>

                    <div class="invalid-feedback">
                        Profile Picture is required
                    </div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">
                        Submit
                    </button>
                </div>

            </form>

        </div>
    </div>

    <%@include file="/common/footer.html"%>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js">
    </script>

    <script src="/collegeportal/javascript/custom_validation.js"></script>

</body>
</html>/html>