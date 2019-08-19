<%@page import="dao.FornecedorDao"%>
<%@page import="beans.FornecedorBeans"%>
<%@page import="conexão.Conexao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	//Obter dados do fornecedor
	String nome = request.getParameter("nome");
	String nascimento = request.getParameter("nascimento");
	String cnpj = request.getParameter("cnpj");
	String telefone = request.getParameter("telefone");
	String endereco = request.getParameter("endereço");
	String cidade = request.getParameter("estado");
	String estado = request.getParameter("estado");
	String email = request.getParameter("e-mail");

	//Criar um objeto da classe Fornecedor
	FornecedorBeans fb = new FornecedorBeans();
	fb.setCidade(cidade);
	fb.setCnpj(cnpj);
	fb.setEmail(email);
	fb.setEndereco(endereco);
	fb.setEstado(estado);
	fb.setNascimento(nascimento);
	fb.setNome(nome);
	fb.setTelefone(telefone);

	//Criar um objeto da classe Fornecedor Dao
	FornecedorDao fd = new FornecedorDao();
	boolean cadastro = fd.casdastrarFornecedor(fb);

	//Redirecionar Página
	if (cadastro == true) {
		response.sendRedirect("index.jsp?msg=cadastroOK");
	} else {
		response.sendRedirect("index.jsp?msg=cadastroFalha");
	}
%>