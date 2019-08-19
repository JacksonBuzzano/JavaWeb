<%@page import="dao.FornecedorDao"%>

<%
	//Obter código do funcionário
	int codigo = Integer.parseInt(request.getParameter("codigo"));

	//Instanciar a classe funcionário dao
	FornecedorDao fd = new FornecedorDao();
	boolean valida = fd.removerFornecedor(codigo);

	//Redirecionamento
	if (valida == true) {
		response.sendRedirect("index.jsp?msg=removerOK");
	} else {
		response.sendRedirect("index.jsp?msg=removerFalha");
	}
%>