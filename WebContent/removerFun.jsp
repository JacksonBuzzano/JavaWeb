<%@page import="dao.FuncionarioDao"%>


<%
	//Obter código do funcionário
	int codigo = Integer.parseInt(request.getParameter("codigo"));

	//Instanciar a classe funcionário dao
	FuncionarioDao fd = new FuncionarioDao();
	boolean valida = fd.removerFuncionario(codigo);

	//Redirecionamento
	if (valida == true) {
		response.sendRedirect("index.jsp?msg=removerOK");
	} else {
		response.sendRedirect("index.jsp?msg=removerFalha");
	}
%>