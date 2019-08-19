<%@page import="dao.ProdutoDao"%>


<%
	//Obter código do Produto
	int codigo = Integer.parseInt(request.getParameter("codigo"));
	
	//Instanciar a classe Produto dao
	ProdutoDao pd = new ProdutoDao();
	boolean valida = pd.removerProduto(codigo);
	
	//Redirecionamento
	if (valida == true) {
		response.sendRedirect("index.jsp?msg=removerOK");
	} else {
		response.sendRedirect("index.jsp?msg=removerFalha");
	}


%>