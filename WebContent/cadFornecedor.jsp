<%@page import="dao.FornecedorDao"%>
<%@page import="dao.FuncionarioDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mercadinho J</title>

<!-- boodstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>


<!-- estilos -->
<link rel="stylesheet" href="css/estilo.css">

<!-- JS -->
<script src="javascript.js"></script>
</head>
<body class="pag">

	<!-- boodstrap -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>


	<!-- barra de inicio -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"href="index.jsp">P�gina Inicial <span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link"href="cadFuncion�rio.jsp">Cadastro de Funcion�rio</a></li>
				<li class="nav-item"><a class="nav-link" href="cadFornecedor.jsp">Cadastro de Fornecedor</a></li>
				<li class="nav-item"><a class="nav-link" href="cadProduto.jsp">Cadastro de Produtos</a></li>
			</ul>
		</div>
	</nav>
	
	<!-- formul�rio -->
	<form class="alterar"  action="cadastrarFor.jsp" method="post" onsubmit="return valida()">
		<%@ include file="menssagem.jsp"%>
		
	<div id="oi">
		<input class="nome" type="text" placeholder="Nome" name="nome">
		<input class="nascimento" type="text"placeholder="Data de Nascimento" name="nascimento">
		<input class="cnpj" type="text" placeholder="Cnpj" name="cnpj">
	</div>
	<div>
		<input class="telefone" type="text" placeholder="Telefone"name="telefone">
		<input class="endere�o" type="text" placeholder="Endere�o"name="endere�o">
		<input class="cidade" type="text" placeholder="Cidade"name="cidade">
	</div>
	<div>
		<input class="estado" type="text" placeholder="Estado"name="estado">
		<input class="e-mail" type="text" placeholder="E-mail"name="e-mail">
	</div>
	<div>
		<input type="submit" class="btn btn-primary">
	</div>
	</form>

	<%
		FornecedorDao fd = new FornecedorDao();
		out.print(fd.selecionarFornecedor());
	%>

</body>
</html>