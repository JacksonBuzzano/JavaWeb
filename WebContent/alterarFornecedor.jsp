
<%@page import="dao.FornecedorDao"%>
<%@page import="beans.FornecedorBeans"%>
<%
	//Obter os dados
	int codigo = Integer.parseInt(request.getParameter("codigo"));
	String nome = request.getParameter("nome");
	String nascimento = request.getParameter("nascimento");
	String cnpj = request.getParameter("cnpj");
	String telefone = request.getParameter("telefone");
	String endereco = request.getParameter("endereço");
	String cidade = request.getParameter("cidade");
	String estado = request.getParameter("estado");
	String email = request.getParameter("e-mail");

	//Instânciar fornecedor Beans
	FornecedorBeans fb = new FornecedorBeans();
	
	fb.setCodigo(codigo);
	fb.setNome(nome);
	fb.setNascimento(nascimento);
	fb.setCnpj(cnpj);
	fb.setTelefone(telefone);
	fb.setEndereco(endereco);
	fb.setCidade(cidade);
	fb.setEstado(estado);
	fb.setEmail(email);
	
	//Instânciar um objeto para realizar o fornecedor
	FornecedorDao fornecedor = new FornecedorDao();
	fornecedor.atualizarFornecedor(fb);

	//Redirecionar Página
	response.sendRedirect("index.jsp");
%>