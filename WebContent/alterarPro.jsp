<%@page import="beans.ProdutoBeans"%>
<%@page import="dao.ProdutoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<!-- boodstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!-- estilos -->
<link rel="stylesheet" href="css/estilo.css"> 

</head>

<body class="pag">

<!-- barra de inicio --> 
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNav">
	    <ul class="navbar-nav">
	      <li class="nav-item active">
	        <a class="nav-link" href="index.jsp">Página Inicial <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="cadFuncionário.jsp">Cadastro de Funcionário</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="cadFornecedor.jsp">Cadastro de Fornecedor</a>
	      </li>
	        <li class="nav-item">
	        <a class="nav-link" href="cadProduto.jsp">Cadastro de Produtos</a>
	      </li>
	        <li class="nav-item">
	        <a class="nav-link" href="#">Vendas</a>
	    </ul>
	  </div>
	</nav>
	
	<%	int codigo = Integer.parseInt(request.getParameter("codigo"));
	
	ProdutoDao pd = new ProdutoDao();
	ProdutoBeans pb = new ProdutoBeans();
	pb=pd.buscaProduto(codigo);
	%>
	
		
	<!-- Frase da tela -->
	<h2>ALTERAÇÃO DE DADOS DOS PRODUTOS</h2>
	
	<!-- formulário -->
	<form class="alterar" action="alterarProduto.jsp" method="post">
	<%@ include file="menssagem.jsp" %>
		
		<input type="hidden"value="<%out.print(pb.getCodigo());%>" name="codigo">
			<div>
				<input type="text"  placeholder="Nome do Produto" value="<%out.print(pb.getProduto());%>" name="produto" class="produto">
			    <input type="number"  step="0.01" placeholder="Valor de Compra" value="<%out.print(pb.getCompra());%>" name="compra" class="compra">	
			    <input type="number"  step="0.01" placeholder="Valor de Venda" value="<%out.print(pb.getValor());%>" name="venda" class="venda">
			</div>
			<div>
			<input type="text" placeholder="Marca" value="<%out.print(pb.getMarca());%>" name="marca" class="marca">
			<input type="number" placeholder="Quantidade de Produto"value="<%out.print(pb.getQuantidade());%>" name="quantidade" class="quantidade">
		</div>
				<input type="submit" class="btn btn-primary" value="Atualizar">
			
	</form>
	<h5>Criado por Jackson Buzzano</h5>

<!-- boodstrap -->	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	
	
	
</body>
</html>