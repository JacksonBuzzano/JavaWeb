<%@page import="beans.FuncionarioBeans"%>
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
</head>
<body class="pag">


	<!-- barra de inicio -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">P�gina Inicial <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="cadFuncion�rio.jsp">Cadastro de Funcion�rio</a></li>
				<li class="nav-item"><a class="nav-link"
					href="cadFornecedor.jsp">Cadastro de Fornecedor</a></li>
				<li class="nav-item"><a class="nav-link" href="cadProduto.jsp">Cadastro
						de Produtos</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Vendas</a>
			</ul>
		</div>
	</nav>

	<%
		int codigo = Integer.parseInt(request.getParameter("codigo"));

		FuncionarioDao fd = new FuncionarioDao();
		FuncionarioBeans f = new FuncionarioBeans();
		f = fd.buscaFuncionario(codigo);
	%>

	<!-- Frase da tela -->
	<h2>ALTERA��O DE DADOS CADASTRAIS DO TRABALHADOR</h2>

	<!-- formul�rio -->
	<form class="alterar" action="alterarFuncion�rio.jsp" method="post">
		<%@ include file="menssagem.jsp"%>

		<input type="hidden" value="<%out.print(f.getCodigo());%>"
			name="codigo">
		<div>
			<input type="text" placeholder="Nome"
				value="<%out.print(f.getNome());%>" name="nome" class="nome">
			<input type="text" placeholder="Cpf"
				value="<%out.print(f.getCpf());%>" name="cpf" class="cpf"> <input
				type="text" placeholder="Data de Nascimento"
				value="<%out.print(f.getNascimento());%>" name="nascimento"
				class="nascimento">
		</div>
		<div>
			<input type="text" placeholder="Endere�o"
				value="<%out.print(f.getEndereco());%>" name="endere�o"
				class="endere�o"> <input type="number" placeholder="N�mero"
				value="<%out.print(f.getNumero());%>" name="n�mero" class="n�mero">
			<input type="text" placeholder="Cidade"
				value="<%out.print(f.getCidade());%>" name="cidade" class="cidade">
			<input type="text" placeholder="Estado"
				value="<%out.print(f.getEstado());%>" name="estado" class="estado">
		</div>
		<div>
			<input type="text" placeholder="Telefone"
				value="<%out.print(f.getTelefone());%>" name="telefone"
				class="telefone"> <input type="text" placeholder="Fun��o"
				value="<%out.print(f.getFuncao());%>" name="fun��o" class="fun��o">
		</div>
		<div>
			<input type="submit" class="btn btn-primary" value="Atualizar">
		</div>
	</form>
	<h5>Criado por Jackson Buzzano</h5>

	<!-- boodstrap -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>

</body>
</html>