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
				<h2>PRODUCT MANAGEMENT</h2>
			</div>
			<form:form action="/product/save" modelAttribute="product">
				<div class="mb-3" style=" display: none;">
					<label for="idProduct" class="form-label">Product Name:</label>
					<form:input path="idProduct" class="form-control" id="idProduct"
						placeholder="Enter product name" name="idProduct" delimiter=" " />
					<form:errors path="idProduct" element="p" delimiter="<br>" />
				</div>
				<div class="mb-3">
					<label for="nameProduct" class="form-label">Product Name:</label>
					<form:input path="nameProduct" class="form-control"
						id="nameProduct" placeholder="Enter product name"
						name="nameProduct" delimiter=" " />
					<form:errors path="nameProduct" element="p" delimiter="<br>" />
				</div>
				<div class="mb-3">
					<label for="image" class="form-label">Image link:</label>
					<form:input path="image" class="form-control" id="image"
						placeholder="Enter image link" name="image" delimiter=" " />
					<form:errors path="image" element="p" delimiter="<br>" />
				</div>
				<div class="mb-3">
					<label for="price" class="form-label">Price:</label>
					<form:input path="price" class="form-control" id="price"
						placeholder="Enter price" name="price" delimiter=" " />
					<form:errors path="price" element="p" delimiter="<br>" />
				</div>
				<div class="mb-3">
					<label for="quantity" class="form-label">Quantity:</label>
					<form:input path="quantity" class="form-control" id="quantity"
						placeholder="Enter quantity" name="quantity" delimiter=" " min="1"
						type="number" />
					<form:errors path="quantity" element="p" delimiter="<br>" />
				</div>
				<div class="mb-3">
					<label for="createdate" class="form-label">Create Date:</label>
					<form:input path="createdate" class="form-control" id="createdate"
						placeholder="Enter create date" name="createdate" delimiter=" "
						type="date" />
					<form:errors path="createdate" element="p" delimiter="<br>" />
				</div>
				<%-- 				<div class="mb-3">
					<label for="category" class="form-label">Category:</label>
					<form:select path="category.idCategory">
						<c:forEach var="item" items="${categories}">
							<form:option value="${item.idCategory}"
								c:if="${item.idCategory == selectedCategoryId}">
                ${item.nameCategory}
            </form:option>
							<form:option value="${item.idCategory}"
								c:if="${item.idCategory != selectedCategoryId}">
                ${item.nameCategory}
            </form:option>
						</c:forEach>
					</form:select>
				</div> --%>
				<div class="mb-3">
					<label for="category" class="form-label">Category:</label>
					<form:select path="category.idCategory">
						<c:forEach var="item" items="${categories}">
							<c:choose>
								<c:when test="${item.idCategory == selectedCategoryId}">
									<form:option value="${item.idCategory}" selected="true">
                        ${item.nameCategory}
                    </form:option>
								</c:when>
								<c:otherwise>
									<form:option value="${item.idCategory}">
                        ${item.nameCategory}
                    </form:option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</form:select>
				</div>


				<div class="mb-3">
					<label for="available" class="checkbox-inline">Available:</label>
					<form:checkbox path="available" delimiter=" " />

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
						<td><a href="/product/list?field=idProduct">idProduct</td>
						<td><a href="/product/list?field=nameProduct">Product
								Name</td>
						<td>Image</td>
						<td><a href="/product/list?field=price">Price</td>
						<td>Quantity</td>
						<td><a href="/product/list?field=createdate">Create Date</td>
						<td>Category</td>
						<td>Available</td>
						<td>&nbsp;</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${products }">
						<tr>
							<td>${item.idProduct }</td>
							<td>${item.nameProduct }</td>
							<td><img style="height: 100px;" class="img-fluid"
								src="${item.image }"></td>
							<td>${item.price }</td>
							<td>${item.quantity }</td>
							<td>${item.createdate }</td>
							<td>${item.category.nameCategory }</td>
							<td>${item.available?"Available":"Over" }</td>

							<td><a href="/product/edit/${item.idProduct }"
								class="btn btn-success"><i class="fa-solid fa-pen-to-square"></i></a>
								| <a href="/product/remove/${item.idProduct}"
								class="btn btn-danger"><i class="fa-solid fa-xmark"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="/product/list?p=0">First</a> <a
				href="/product/list?p=${page.number-1}">Previous</a> <a
				href="/product/list?p=${page.number+1}">Next</a> <a
				href="/product/list?p=${page.totalPages-1}">Last</a>
			<ul>
				<li>Số thực thể hiện tại: ${page.numberOfElements}</li>
				<li>Trang số: ${page.number}</li>
				<li>Kích thước trang: ${page.size}</li>
				<li>Tổng số thực thể: ${page.totalElements}</li>
				<li>Tổng số trang: ${page.totalPages}</li>
			</ul>
		</div>



	</main>
	<%@include file="../layout/footer.jsp"%>

</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

</html>