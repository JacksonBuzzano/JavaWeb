<%@page import="dao.ProdutoDao"%>
<%@page import="beans.ProdutoBeans"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<%
//Obter dados Do Produto
String produto = request.getParameter("produto");
String marca = request.getParameter("marca");
int quantidade = Integer.parseInt(request.getParameter("quantidade"));
double valor = Double.parseDouble(request.getParameter("valor"));
double compra = Double.parseDouble(request.getParameter("compra"));

//Criar um objeto da classe funcionário
ProdutoBeans pb = new ProdutoBeans();
pb.setProduto(produto);
pb.setQuantidade(quantidade);
pb.setValor(valor);
pb.setMarca(marca);
pb.setCompra(compra);

//Criar um objeto da classe PordutoDao
ProdutoDao p = new ProdutoDao();
boolean cadastro = p.cadastarProduto(pb);

//Redirecionamento
if(cadastro == true){
	response.sendRedirect("index.jsp?msg=cadastroOK");
}else{
	response.sendRedirect("index.jsp?msg=cadastroFalha");
}




%>
</body>
</html>