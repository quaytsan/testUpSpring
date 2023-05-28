<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">
		<a class="navbar-brand" href="/product/index"><img
			src="https://img5.thuthuatphanmem.vn/uploads/2022/01/16/logo-fpt-fpt-polytechnic-tach-nen-dep_043151037.png"
			alt="" class="img-fluid" width="100px"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item ml-2"><a class="nav-link active"
					aria-current="page" href="#"><i class="fa-brands fa-github m-2"></i>Giới
						thiệu</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa-solid fa-phone m-2"></i>Liên hệ</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa-solid fa-phone m-2"></i>Góp ý</a></li>
				<li class="nav-item">
					<div class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> <i
							class="fa-solid fa-user m-2"></i>Danh mục
						</a>
						<ul class="dropdown-menu">
							<!-- Menu -->
						</ul>
					</div>
				</li>

			</ul>
		</div>
		<div class="row">
			<div class="nav-item col">
				<a class="nav-link" href="/cart/layout"><i
					class="fa-solid fa-cart-shopping"></i> (${count })</a>
			</div>
			<div class="nav-item dropdown col">
				<a class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> <i
					class="fa-solid fa-user m-2"></i>Tài khoản
				</a>

				<ul class="dropdown-menu">

					<c:choose>
						<c:when test="${empty sessionService.user}">
							<li><a class="dropdown-item" href="/login">Đăng nhập</a></li>
							<li><a class="dropdown-item" href="#">Đăng ký</a></li>
							<li><a class="dropdown-item" href="#">Quên mật khẩu</a></li>
						</c:when>
						<c:otherwise>
							<li><a class="dropdown-item" href="#">
									${sessionService.user.username} </a></li>
							<hr>
							<li><a class="dropdown-item" href="#">Đăng xuất</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>

	</div>
</nav>