<%@page import="dao.ProdutoDao"%>
<%@page import="beans.ProdutoBeans"%>


<%

	//Obter dados Do Produto
	int codigo = Integer.parseInt(request.getParameter("codigo"));
	String produto = request.getParameter("produto");
	int quantidade = Integer.parseInt(request.getParameter("quantidade"));
	double valor = Double.parseDouble(request.getParameter("venda"));
	String marca = request.getParameter("marca");
	double compra = Double.parseDouble(request.getParameter("compra"));
	
	//Instanciar um objeto
	ProdutoBeans pb = new ProdutoBeans();
	
	pb.setCodigo(codigo);
	pb.setProduto(produto);
	pb.setQuantidade(quantidade);
	pb.setValor(valor);
	pb.setMarca(marca);
	pb.setCompra(compra);
	
	//Criar um objeto da classe PordutoDao
	ProdutoDao pd = new ProdutoDao();
	pd.atualizarProdutos(pb);
	
	
	//Redirecionamento
	response.sendRedirect("index.jsp");
%>
