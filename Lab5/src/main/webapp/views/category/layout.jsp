<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%> --%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang chủ</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/style.css">
<style>
header {
	height: 100px;
	position: relative;
	background-image: linear-gradient(270deg, #b447eb, #57aeff 95%);
}

nav {
	background-color: azure;
	box-shadow: 0px 7px 8px rgb(160, 148, 148);
}

main {
	background-color: white;
	min-height: 500px;
}

footer {
	height: 30px;
	float: unset;
}

.carousel-inner {
	border-radius: 10px;
}

a {
	text-decoration: none;
	color: black;
}

button {
	text-decoration: none;
}

.card-item {
	transition: transform 0.25s
}

.card-item:hover {
	transform: translateY(-5px);
}
</style>
</head>

<body>

	<header class="text-center text-white"> </header>
	<%@include file="../layout/menu.jsp"%>

	<main class="row m-auto col-11 mt-4">
		<div class="card col-4">
			<div class="card-header">
				<h2>CATEGORY MANAGEMENT</h2>
			</div>
			<form:form action="/category/save" modelAttribute="category">
				<div class="mb-3">
					<label for="idCategory" class="form-label">idCategory:</label>
					<form:input path="idCategory" class="form-control" id="idCategory"
						placeholder="Enter idCategory" name="idCategory" delimiter=" " />
					<form:errors path="idCategory" element="p" delimiter="<br>" />
				</div>
				<div class="mb-3">
					<label for="nameCategory" class="form-label">Category Name:</label>
					<form:input path="nameCategory" class="form-control" id="nameCategory"
						placeholder="Enter nameCategory" name="nameCategory" delimiter=" " />
					<form:errors path="nameCategory" element="p" delimiter="<br>" />
				</div>
				<div class="">
					<button class="btn btn-primary">Save</button>
				</div>
			</form:form>
		</div>
		<div class="col-8">
			<table class="table table-stripe">
			<thead>
				<tr>
					<td>idCategory</td>
					<td>Category Name</td>
					<td>&nbsp;</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${categorys }">
					<tr>
						<td>${item.idCategory }</td>
						<td>${item.nameCategory }</td>
						
						<td><a href="/category/edit/${item.idCategory }"
							class="btn btn-success"><i class="fa-solid fa-pen-to-square"></i></a>
							| <a href="/category/remove/${item.idCategory}"
							class="btn btn-danger"><i class="fa-solid fa-xmark"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>


		
	</main>
	<%@include file="../layout/footer.jsp"%>

</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

</html>